"""
Build Cymatic Layer (rollback + isolated cymatic shader).

This script:
1. Restores /project1/feedback_viz/chaos_viz to its ORIGINAL chaos-point shader
   so OSC bindings (uChaosX, uChaosY, etc.) work again. Visuals get reactive
   to Max input again.
2. Creates a NEW GLSL TOP /project1/feedback_viz/cymatic_layer that:
   - Reads chaos_viz output as background
   - Renders textured cymatic patterns on top
   - Has its own 5 vec4 uniforms in fresh slots 0-4
   - Reads parameter values from /project1/feedback_viz custom 'Cymatic' page
3. Connects chaos_viz output to cymatic_layer input automatically.
4. Leaves cymatic_layer output unconnected so you can wire it where chaos_viz
   used to feed (the trail/feedback chain or the composite stage).

Run in TD textport AFTER running build_cymatic_panel.py once (which adds the
custom Cymatic parameter page to feedback_viz):

    exec(open(r'\\\\wsl.localhost\\Ubuntu\\home\\sphinxy\\Feedback\\td\\build_cymatic_layer.py').read())
"""

BASE_PATH = '/project1/feedback_viz'
CHAOS_VIZ_PATH = '/project1/feedback_viz/chaos_viz'
LAYER_NAME = 'cymatic_layer'


# Original chaos-point shader (from build_chaos_viz.py). Slots 0-7 already
# bound by build_chaos_viz to OSC-driven Select CHOPs.
CHAOS_GLSL_ORIGINAL = '''// Chaos Attractor Point — renders bright point at projected XYZ
// The trail feedback chain handles trajectory persistence

uniform float uChaosX;     // Attractor X state
uniform float uChaosY;     // Attractor Y state
uniform float uChaosZ;     // Attractor Z state
uniform float uAmp;        // Audio amplitude (0-1)
uniform float uAttractor;  // Attractor type (0-4)
uniform float uChaosGain;  // Chaos intensity (0-1)
uniform float uDecay;      // Resonator decay (0-1.5)
uniform float uDrive;      // Excitation drive (0-1)

out vec4 fragColor;

void main()
{
    vec2 uv = vUV.st;
    vec2 res = uTDOutputInfo.res.zw;
    float aspect = res.x / res.y;

    float scale = 0.025;
    int att = int(uAttractor);
    if (att == 0) scale = 0.022;
    else if (att == 1) scale = 0.035;
    else if (att == 2) scale = 0.15;
    else if (att == 3) scale = 0.04;
    else if (att == 4) scale = 0.25;

    vec2 attPos = vec2(
        uChaosX * scale,
        uChaosY * scale + uChaosZ * scale * 0.15
    );
    attPos.x /= aspect;
    attPos = attPos * 0.5 + 0.5;

    vec2 fragPos = uv;
    fragPos.x *= aspect;
    vec2 aPos = attPos;
    aPos.x *= aspect;
    float dist = length(fragPos - aPos);

    float baseSize = 0.003 + uDrive * 0.004;
    float pointSize = baseSize + uAmp * 0.008;

    float intensity = exp(-dist * dist / (pointSize * pointSize * 2.0));

    float brightness = 0.3 + uAmp * 0.7;

    float haloSize = pointSize * 4.0;
    float halo = exp(-dist * dist / (haloSize * haloSize * 2.0)) * 0.15;

    float chaosGlow = uChaosGain * 0.1;

    float total = (intensity * brightness + halo + chaosGlow * intensity) * 1.2;

    vec3 color = vec3(total);

    float warmth = clamp(uDecay / 1.5, 0.0, 1.0) * 0.08;
    color.r += warmth * total;
    color.b -= warmth * total * 0.5;

    fragColor = TDOutputSwizzle(vec4(color, 1.0));
}
'''


# New cymatic shader: textured cymatic field + materials, blended over the
# chaos_viz background. 5 vec4 uniforms read from /project1/feedback_viz
# custom parameters.
CYMATIC_LAYER_GLSL = '''// Cymatic Layer: textured cymatic field over chaos_viz background.
// Reads sTD2DInputs[0] = chaos_viz output (passes through).
// 5 vec4 uniforms read live from feedback_viz.par.<Name>.eval() expressions.

uniform vec4 uCymatic;   // (modeBaseN, modeBaseM, harmonicCount, driftSpeed)
uniform vec4 uCymatic2;  // (nodalThickness, contrast, complexity, colorWarmth)
uniform vec4 uTexture;   // (noiseIntensity, noiseScale, warpAmount, grainAmount)
uniform vec4 uTexture2;  // (detailOctaves, materialPreset, materialMix, surfaceShimmer)
uniform vec4 uTexture3;  // (textureSize, edgeSoftness, noiseStretch, particleDensity)

out vec4 fragColor;

#define PI 3.14159265359

float hash21(vec2 p) {
    p = fract(p * vec2(123.34, 456.21));
    p += dot(p, p + 45.32);
    return fract(p.x * p.y);
}

float vnoise(vec2 p) {
    vec2 i = floor(p);
    vec2 f = fract(p);
    f = f * f * (3.0 - 2.0 * f);
    float a = hash21(i);
    float b = hash21(i + vec2(1.0, 0.0));
    float c = hash21(i + vec2(0.0, 1.0));
    float d = hash21(i + vec2(1.0, 1.0));
    return mix(mix(a, b, f.x), mix(c, d, f.x), f.y);
}

float fbm(vec2 p, int oct) {
    float total = 0.0;
    float amp = 0.5;
    float freq = 1.0;
    for (int i = 0; i < 8; i++) {
        if (i >= oct) break;
        total += amp * vnoise(p * freq);
        freq *= 2.03;
        amp *= 0.5;
    }
    return total;
}

float chladni(vec2 p, float n, float m) {
    return sin(n * PI * p.x) * sin(m * PI * p.y)
         + sin(m * PI * p.x) * sin(n * PI * p.y);
}

void main() {
    vec2 uv = vUV.st;
    vec2 res = uTDOutputInfo.res.zw;
    float displayAspect = res.x / res.y;
    float t = absTime.seconds;

    vec3 background = texture(sTD2DInputs[0], uv).rgb;

    float modeBaseN     = max(uCymatic.x, 0.5);
    float modeBaseM     = max(uCymatic.y, 0.5);
    float harmonicCount = clamp(uCymatic.z, 1.0, 8.0);
    float driftSpeed    = uCymatic.w;
    float nodalThickness = max(uCymatic2.x, 0.1);
    float contrast      = max(uCymatic2.y, 0.1);
    float complexity    = clamp(uCymatic2.z, 0.0, 2.0);
    float colorWarmth   = clamp(uCymatic2.w, 0.0, 1.0);

    float noiseIntensity = clamp(uTexture.x, 0.0, 1.5);
    float noiseScale     = max(uTexture.y, 0.1);
    float warpAmount     = clamp(uTexture.z, 0.0, 0.5);
    float grainAmount    = clamp(uTexture.w, 0.0, 0.5);
    float detailOctaves  = clamp(uTexture2.x, 1.0, 8.0);
    int   materialPreset = int(clamp(uTexture2.y, 0.0, 8.0));
    float materialMix    = clamp(uTexture2.z, 0.0, 1.0);
    float surfaceShimmer = clamp(uTexture2.w, 0.0, 1.0);

    float textureSize     = max(uTexture3.x, 0.05);
    float edgeSoftness    = clamp(uTexture3.y, 0.0, 1.0);
    float noiseStretch    = clamp(uTexture3.z, 0.1, 4.0);
    float particleDensity = clamp(uTexture3.w, 0.0, 1.0);

    // === Domain warp ===
    vec2 warpUv = uv;
    if (warpAmount > 0.001) {
        vec2 wScale = vec2(noiseScale * 1.7 * noiseStretch, noiseScale * 1.7);
        float wn1 = fbm(uv * wScale + t * 0.05, int(detailOctaves + 0.5));
        float wn2 = fbm(uv * wScale + vec2(13.7, 7.3) - t * 0.04, int(detailOctaves + 0.5));
        warpUv += vec2(wn1, wn2) * warpAmount * 2.0 - warpAmount;
    }

    // === Multi-harmonic Chladni field ===
    vec2 plate = (warpUv - 0.5) * 2.0;
    plate.x *= displayAspect;

    float baseN = modeBaseN + complexity * 0.3 * sin(t * 0.05);
    float baseM = modeBaseM + complexity * 0.3 * cos(t * 0.07);
    float drift = t * driftSpeed;

    float cymatic = 0.0;
    float weightSum = 0.0;
    int hCount = int(harmonicCount + 0.5);
    for (int i = 0; i < 8; i++) {
        if (i >= hCount) break;
        float fi = float(i);
        float ni = baseN + fi * (1.3 + complexity * 0.4) + sin(drift + fi) * (0.5 + complexity);
        float mi = baseM + fi * (0.9 + complexity * 0.3) + cos(drift * 0.7 + fi) * (0.5 + complexity);
        float w = 1.0 / (1.0 + fi * 0.5);
        cymatic += w * chladni(plate * 0.5, ni, mi);
        weightSum += w;
    }
    cymatic /= max(weightSum, 0.001);

    // Field magnitude normalization for stable brightness across harmonic count
    float absC = abs(cymatic);
    float fieldNorm = cymatic / (0.5 + absC * 0.6);

    // FBM noise blended into field for material grain
    if (noiseIntensity > 0.001) {
        float n = fbm(warpUv * noiseScale * 5.0 + t * 0.05, int(detailOctaves + 0.5));
        fieldNorm += (n - 0.5) * noiseIntensity * 0.3;
    }

    // === TEXTURAL NODAL LINES (anti-aliased, with stroke character) ===
    float dist = abs(fieldNorm);
    float coreWidthUV = nodalThickness * 0.012;
    float haloWidthUV = coreWidthUV * (4.0 + edgeSoftness * 4.0);

    // Core: textural via FBM modulation along the line (chalk/ink stroke feel)
    float strokeNoise = fbm(uv * 90.0 + warpUv * 30.0, 3);
    float strokeMod = mix(0.55, 1.0, strokeNoise);
    float coreSharp = smoothstep(coreWidthUV * 1.5, coreWidthUV * 0.3, dist);
    float coreTextured = coreSharp * strokeMod;

    // Per-pixel jitter at the edge for chalky character
    float edgeJitter = (hash21(uv * 800.0) - 0.5) * coreWidthUV * 0.3;
    float jitteredCore = smoothstep(coreWidthUV * 1.2, coreWidthUV * 0.4,
                                    dist + edgeJitter);
    coreTextured = max(coreTextured, jitteredCore * strokeMod * 0.7);

    // Halo: permanent presence around line
    float halo = smoothstep(haloWidthUV, coreWidthUV * 0.6, dist);
    halo = halo * halo * 0.35;

    float nodalLine = clamp(coreTextured + halo, 0.0, 1.0);
    nodalLine = pow(nodalLine, max(contrast, 0.4));

    // === Material color ===
    vec3 cymaticColor = vec3(0.85, 0.9, 1.0);
    vec3 grainTint = vec3(1.0);
    float baseGrainScale = 250.0;

    if (materialPreset == 0) {
        cymaticColor = mix(vec3(0.85, 0.9, 1.0), vec3(1.0, 0.85, 0.6), colorWarmth);
        baseGrainScale = 250.0;
    } else if (materialPreset == 1) {
        cymaticColor = vec3(0.95, 0.95, 0.93); baseGrainScale = 600.0; grainTint = vec3(1.0, 1.0, 0.97);
    } else if (materialPreset == 2) {
        cymaticColor = vec3(0.96, 0.92, 0.82); baseGrainScale = 550.0; grainTint = vec3(1.0, 0.97, 0.88);
    } else if (materialPreset == 3) {
        cymaticColor = vec3(0.92, 0.78, 0.55); baseGrainScale = 500.0; grainTint = vec3(1.0, 0.88, 0.7);
    } else if (materialPreset == 4) {
        cymaticColor = vec3(0.78, 0.84, 0.95); baseGrainScale = 700.0; grainTint = vec3(0.85, 0.9, 1.0);
    } else if (materialPreset == 5) {
        cymaticColor = vec3(0.7, 0.7, 0.72);  baseGrainScale = 650.0; grainTint = vec3(0.78, 0.78, 0.8);
    } else if (materialPreset == 6) {
        cymaticColor = vec3(0.5, 0.85, 0.95); baseGrainScale = 220.0; grainTint = vec3(0.7, 1.0, 0.95);
    } else if (materialPreset == 7) {
        float irid = sin(uv.x * 8.0 + t * 0.5) * 0.5 + 0.5;
        cymaticColor = mix(vec3(0.4, 0.6, 1.0), vec3(0.95, 0.6, 0.9), irid);
        baseGrainScale = 320.0; grainTint = vec3(0.9, 0.85, 1.0);
    } else if (materialPreset == 8) {
        cymaticColor = vec3(0.97, 0.96, 0.92); baseGrainScale = 800.0; grainTint = vec3(1.0, 0.99, 0.95);
    }
    float grainScale = baseGrainScale / max(textureSize, 0.05);
    cymaticColor = mix(cymaticColor, mix(cymaticColor, vec3(1.0, 0.85, 0.6), colorWarmth), 0.5);

    vec3 lineColor = cymaticColor * nodalLine;

    // Film grain
    if (grainAmount > 0.001) {
        float g = hash21(uv * grainScale + vec2(t * 60.0, t * 47.0));
        float gateThresh = (1.0 - particleDensity) * 0.5;
        float gMask = smoothstep(gateThresh, gateThresh + 0.05, g);
        lineColor += (g - 0.5) * grainAmount * grainTint * gMask;
    }

    // Surface shimmer
    if (surfaceShimmer > 0.001) {
        float sh = fbm(uv * 4.0 + t * 0.15, 3);
        lineColor *= 1.0 + (sh - 0.5) * surfaceShimmer;
    }

    // Composite over background (additive blend with material mix)
    vec3 finalColor = background + lineColor * mix(1.0, materialMix, 0.5);

    fragColor = TDOutputSwizzle(vec4(finalColor, 1.0));
}
'''


def get_or_create_dat(parent, name, text):
    dat = parent.op(name)
    if dat is None:
        dat = parent.create('textDAT', name)
        dat.nodeX = -300
        dat.nodeY = 0
    dat.text = text
    return dat


def restore_chaos_shader():
    """Restore /project1/feedback_viz/chaos_viz to the original chaos-point shader."""
    glsl = op(CHAOS_VIZ_PATH)
    if glsl is None:
        print(f"[ERROR] {CHAOS_VIZ_PATH} not found")
        return None

    parent = glsl.parent()
    dat = get_or_create_dat(parent, 'chaos_glsl_src', CHAOS_GLSL_ORIGINAL)
    dat.nodeX = glsl.nodeX - 250
    dat.nodeY = glsl.nodeY
    glsl.par.pixeldat = dat.path
    print(f"[OK] Restored {glsl.path} pixel shader to original chaos-point")
    print(f"     OSC-bound uniforms (slots 0-7) drive it again")
    return glsl


def build_cymatic_layer(chaos_top):
    """Create cymatic_layer GLSL TOP downstream of chaos_viz."""
    parent = chaos_top.parent()

    layer = parent.op(LAYER_NAME)
    if layer is not None:
        layer.destroy()

    layer = parent.create('glslTOP', LAYER_NAME)
    layer.nodeX = chaos_top.nodeX + 200
    layer.nodeY = chaos_top.nodeY

    # Set the shader
    dat = parent.op('cymatic_layer_glsl_src')
    if dat is None:
        dat = parent.create('textDAT', 'cymatic_layer_glsl_src')
        dat.nodeX = layer.nodeX - 250
        dat.nodeY = layer.nodeY - 100
    dat.text = CYMATIC_LAYER_GLSL
    layer.par.pixeldat = dat.path
    print(f"[OK] Created {layer.path} with cymatic shader")

    # Discover what chaos_viz currently feeds (downstream consumers)
    downstream_targets = []
    try:
        for conn in chaos_top.outputConnectors[0].connections:
            owner = conn.owner
            in_index = conn.index
            downstream_targets.append((owner, in_index))
    except Exception as e:
        print(f"[INFO] Could not enumerate downstream connections: {e}")

    if downstream_targets:
        print(f"[INFO] chaos_viz currently feeds {len(downstream_targets)} downstream op(s):")
        for op_, idx in downstream_targets:
            print(f"       - {op_.path} (input {idx})")

    # Disconnect chaos_viz from all downstream targets
    for op_, in_index in downstream_targets:
        try:
            chaos_top.outputConnectors[0].disconnect(op_.inputConnectors[in_index])
            print(f"[OK] Disconnected {chaos_top.path} from {op_.path}")
        except Exception as e:
            print(f"[WARN] Could not disconnect from {op_.path}: {e}")

    # Connect chaos_viz output to cymatic_layer input
    try:
        chaos_top.outputConnectors[0].connect(layer.inputConnectors[0])
        print(f"[OK] Connected {chaos_top.path} -> {layer.path}")
    except Exception as e:
        print(f"[WARN] Could not connect {chaos_top.path} to {layer.path}: {e}")

    # Connect cymatic_layer output to each former downstream target
    for op_, in_index in downstream_targets:
        try:
            layer.outputConnectors[0].connect(op_.inputConnectors[in_index])
            print(f"[OK] Connected {layer.path} -> {op_.path} (input {in_index})")
        except Exception as e:
            print(f"[WARN] Could not connect {layer.path} to {op_.path}: {e}")

    # Configure 5 vec4 uniforms in fresh slots 0-4
    target_path = parent.path  # /project1/feedback_viz, where custom params live
    uniform_groups = [
        ('uCymatic',   ['Moden', 'Modem', 'Harmoniccount', 'Driftspeed']),
        ('uCymatic2',  ['Nodalthickness', 'Contrast', 'Complexity', 'Colorwarmth']),
        ('uTexture',   ['Noiseintensity', 'Noisescale', 'Warpamount', 'Grainamount']),
        ('uTexture2',  ['Detailoctaves', 'Materialpreset', 'Materialmix', 'Surfaceshimmer']),
        ('uTexture3',  ['Texturesize', 'Edgesoftness', 'Noisestretch', 'Particledensity']),
    ]

    bound = 0
    for k, (uniform_name, param_names) in enumerate(uniform_groups):
        slot = k  # 0..4 (fresh GLSL TOP, slots definitely available)
        try:
            setattr(layer.par, f'uniformtype{slot}', 'vec4')
            setattr(layer.par, f'uniformname{slot}', uniform_name)
            for ax_idx, ax in enumerate(['x', 'y', 'z', 'w']):
                p = getattr(layer.par, f'value{slot}{ax}')
                p.mode = ParMode.EXPRESSION
                p.expr = f"op('{target_path}').par.{param_names[ax_idx]}.eval()"
            print(f"[OK] Bound {uniform_name} to slot {slot}")
            bound += 1
        except Exception as e:
            print(f"[WARN] Could not bind {uniform_name} at slot {slot}: {e}")

    if bound == 5:
        print(f"[OK] All 5 uniforms wired to /project1/feedback_viz Cymatic params")
    else:
        print(f"[WARN] Only {bound}/5 uniforms wired. The cymatic_layer GLSL TOP")
        print(f"       might be missing some slots. Check params manually.")

    return layer


def main():
    print("=" * 60)
    print("Cymatic Layer Build (rollback + isolated cymatic shader)")
    print("=" * 60)

    chaos = restore_chaos_shader()
    if chaos is None:
        return

    layer = build_cymatic_layer(chaos)
    if layer is None:
        return

    print()
    print("=" * 60)
    print("Wiring complete:")
    print(f"  Audio in (OSC) -> {chaos.path} (original chaos-point shader)")
    print(f"           -> {layer.path} (cymatic shader, slider-driven)")
    print(f"           -> downstream ops (trail/feedback/composite, restored)")
    print()
    print("Try sliders: click /project1/feedback_viz, find 'Cymatic' page, drag.")
    print("Try material: set Material slider to 1 (chalk), then bring up Texture Size,")
    print("Noise Intensity, Film Grain to taste.")
    print("=" * 60)


main()
