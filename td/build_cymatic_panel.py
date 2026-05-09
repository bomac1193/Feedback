"""
Build Cymatic Controls panel for Feedback TD project.

Run in TD textport AFTER the main build script:
    exec(open('D:/Visuals/Touchdesigner/Projects/Feedback/td/build_cymatic_panel.py').read())

What it builds:
    - Replaces the cymatic GLSL with a richer shader: FBM texture, domain
      warping, film grain, multi-harmonic mode, material selector.
    - Creates /project1/cymatic_panel container with sliders bound to uniforms.

Result: cymatic field feels like it's drawn IN something (sand, iron filings,
ferrofluid, water, glass). Slide the material selector to flip between modes.
Slide noise/warp/grain to add organic detail.
"""

BASE_PATH = '/project1'
TARGET_GLSL_NAMES = ['chaos_viz', 'cymatic_viz', 'composite_viz', 'feedback_viz/chaos_viz']


CYMATIC_GLSL = '''// Cymatic Field with texture, domain warp, film grain, material selector.
// Companion shader to chaos_lusona_composite.glsl with extra uniforms.
//
// Uniforms (existing):
//   uChaos    (x, y, z, loudness)
//   uParams1  (kuramotoR, time, chaosGain, progress)
//   uParams2  (lusonaRows, lusonaCols, lusonaMargin, lusonaPoints)
//   uParams3  (cymaticBright, lineBright, lineWidth, dotBright)
//   uParams4  (headGlow, headX, headY, 0)
//
// Uniforms (new):
//   uCymatic   (modeBaseN, modeBaseM, harmonicCount, driftSpeed)
//   uCymatic2  (nodalThickness, contrast, complexity, colorWarmth)
//   uTexture   (noiseIntensity, noiseScale, warpAmount, grainAmount)
//   uTexture2  (detailOctaves, materialPreset, materialMix, surfaceShimmer)
//   uTexture3  (textureSize, edgeSoftness, noiseStretch, particleDensity)
//
// Material presets (uTexture2.y, integer 0-8). Defaults tuned for very fine grain.
//   0 = clean         (no texture, mathematical interference)
//   1 = chalk         (fine white dust on black slate)
//   2 = white sand    (fine cream grains)
//   3 = warm sand     (fine warm grains)
//   4 = iron filings  (fine cold metallic clusters)
//   5 = ash           (fine grey carbon dust)
//   6 = water surface (caustic shimmer)
//   7 = ferrofluid    (iridescent dark liquid)
//   8 = flour         (very fine pale dust, soft edges)

uniform vec4 uChaos;
uniform vec4 uParams1;
uniform vec4 uParams2;
uniform vec4 uParams3;
uniform vec4 uParams4;
uniform vec4 uCymatic;
uniform vec4 uCymatic2;
uniform vec4 uTexture;
uniform vec4 uTexture2;
uniform vec4 uTexture3;

layout(location = 0) out vec4 fragColor;

#define PI 3.14159265359

// ----- Noise primitives -----
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

void main()
{
    vec2 uv = vUV.st;
    vec2 res = uTDOutputInfo.res.zw;
    float displayAspect = res.x / res.y;

    float kr = clamp(uParams1.x, 0.0, 1.0);
    float t = uParams1.y;
    float progress = clamp(uParams1.w, 0.0, 1.0);
    float loudness = clamp(abs(uChaos.w), 0.0, 1.0);

    float rows = max(uParams2.x, 1.0);
    float cols = max(uParams2.y, 1.0);
    float margin = uParams2.z;

    float cymaticBright = uParams3.x;
    float lineBright   = uParams3.y;
    float lineW        = max(uParams3.z, 0.001);
    float dotBrightP   = uParams3.w;

    float headGlowP = uParams4.x;
    vec2 headPos    = uParams4.yz;

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

    float textureSize     = max(uTexture3.x, 0.05);   // grain pitch multiplier (0.1=fine, 1=large)
    float edgeSoftness    = clamp(uTexture3.y, 0.0, 1.0);
    float noiseStretch    = clamp(uTexture3.z, 0.1, 4.0);
    float particleDensity = clamp(uTexture3.w, 0.0, 1.0);

    // === DOMAIN WARP ===
    vec2 warpUv = uv;
    if (warpAmount > 0.001) {
        vec2 wScale = vec2(noiseScale * 1.7 * noiseStretch, noiseScale * 1.7);
        float wn1 = fbm(uv * wScale + t * 0.05, int(detailOctaves + 0.5));
        float wn2 = fbm(uv * wScale + vec2(13.7, 7.3) - t * 0.04, int(detailOctaves + 0.5));
        warpUv += vec2(wn1, wn2) * warpAmount * 2.0 - warpAmount;
    }

    // === CHLADNI MULTI-HARMONIC FIELD on warped UV ===
    vec2 plate = (warpUv - 0.5) * 2.0;
    plate.x *= displayAspect;

    float baseN = modeBaseN + abs(uChaos.x) * 0.1 * complexity;
    float baseM = modeBaseM + abs(uChaos.y) * 0.08 * complexity;
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
    cymatic *= mix(0.5, 1.0, kr);

    // Add FBM noise into the field for material grain
    if (noiseIntensity > 0.001) {
        float n = fbm(warpUv * noiseScale * 5.0 + t * 0.05, int(detailOctaves + 0.5));
        cymatic += (n - 0.5) * noiseIntensity;
    }

    float fw = fwidth(cymatic);
    float softFactor = 1.0 + edgeSoftness * 6.0; // 1 = sharp, 7 = very soft
    float nodalLine = 1.0 - smoothstep(0.0, fw * nodalThickness * softFactor, abs(cymatic));
    nodalLine = pow(nodalLine, contrast);

    // === LUSONA DISTANCE (Pass 1 texture) ===
    float minDist = texture(sTD2DInputs[0], uv).r;
    float lineMask = smoothstep(lineW, lineW * 0.3, minDist);
    float lusonaField = exp(-minDist * minDist / (lineW * 8.0));

    // === DOT GRID ===
    float dotBright = 0.0;
    float dotScale = 1.0 - 2.0 * margin;
    float dotR = 0.005;
    for (int k = 0; k < 56; k++) {
        float fk = float(k);
        float row = floor(fk / cols);
        float col = fk - row * cols;
        float dotX = margin + (2.0 * col + 1.0) / (2.0 * cols) * dotScale;
        float dotY = margin + (2.0 * row + 1.0) / (2.0 * rows) * dotScale;
        float dd = length(uv - vec2(dotX, dotY));
        dotBright += smoothstep(dotR, dotR * 0.3, dd);
    }
    dotBright = clamp(dotBright, 0.0, 1.0);

    // === HEAD GLOW ===
    float headGlow = 0.0;
    float hd = length(uv - headPos);
    headGlow = exp(-hd * hd / 0.001) * headGlowP;

    // === MATERIAL ===
    // Each preset chooses a base color and a baseline grain pitch.
    // The textureSize slider then scales that baseline (smaller = finer grain).
    vec3 cymaticColor = vec3(0.85, 0.9, 1.0);
    vec3 grainTint    = vec3(1.0);
    float baseGrainScale = 250.0;

    if (materialPreset == 0) {
        // clean math interference, no material character
        cymaticColor = mix(vec3(0.85, 0.9, 1.0), vec3(1.0, 0.85, 0.6), colorWarmth);
        grainTint    = vec3(1.0);
        baseGrainScale = 250.0;
    } else if (materialPreset == 1) {
        // chalk: fine white dust on black slate
        cymaticColor = vec3(0.95, 0.95, 0.93);
        grainTint    = vec3(1.0, 1.0, 0.97);
        baseGrainScale = 600.0;
    } else if (materialPreset == 2) {
        // white sand: fine cream grain
        cymaticColor = vec3(0.96, 0.92, 0.82);
        grainTint    = vec3(1.0, 0.97, 0.88);
        baseGrainScale = 550.0;
    } else if (materialPreset == 3) {
        // warm sand: fine warm grain
        cymaticColor = vec3(0.92, 0.78, 0.55);
        grainTint    = vec3(1.0, 0.88, 0.7);
        baseGrainScale = 500.0;
    } else if (materialPreset == 4) {
        // iron filings: fine cold metallic
        cymaticColor = vec3(0.78, 0.84, 0.95);
        grainTint    = vec3(0.85, 0.9, 1.0);
        baseGrainScale = 700.0;
    } else if (materialPreset == 5) {
        // ash: fine grey carbon
        cymaticColor = vec3(0.7, 0.7, 0.72);
        grainTint    = vec3(0.78, 0.78, 0.8);
        baseGrainScale = 650.0;
    } else if (materialPreset == 6) {
        // water surface: caustic shimmer
        cymaticColor = vec3(0.5, 0.85, 0.95);
        grainTint    = vec3(0.7, 1.0, 0.95);
        baseGrainScale = 220.0;
    } else if (materialPreset == 7) {
        // ferrofluid: iridescent dark liquid
        float irid = sin(uv.x * 8.0 + t * 0.5) * 0.5 + 0.5;
        cymaticColor = mix(vec3(0.4, 0.6, 1.0), vec3(0.95, 0.6, 0.9), irid);
        grainTint    = vec3(0.9, 0.85, 1.0);
        baseGrainScale = 320.0;
    } else if (materialPreset == 8) {
        // flour: very fine pale dust, soft edges
        cymaticColor = vec3(0.97, 0.96, 0.92);
        grainTint    = vec3(1.0, 0.99, 0.95);
        baseGrainScale = 800.0;
    }

    // textureSize: 1.0 = baseline grain, 0.1 = very fine, 2.0 = coarse
    float grainScale = baseGrainScale / max(textureSize, 0.05);

    // Optional warmth blend over the chosen material
    cymaticColor = mix(cymaticColor, mix(cymaticColor, vec3(1.0, 0.85, 0.6), colorWarmth), 0.5);

    vec3 lineColor = vec3(0.9, 0.9, 0.88);
    vec3 dotColor  = vec3(0.7, 0.7, 0.65);

    float cymaticBase  = cymaticBright + loudness * cymaticBright * 3.0;
    float cymaticBoost = 1.0 + lusonaField * lineBright * 4.0;

    vec3 color = vec3(0.0);
    color += cymaticColor * nodalLine * cymaticBase * cymaticBoost;
    color += lineColor * lineMask * lineBright;
    color += dotColor * dotBright * dotBrightP;
    color += vec3(1.0, 0.98, 0.95) * headGlow;

    // === FILM GRAIN (animated, scaled by textureSize) ===
    if (grainAmount > 0.001) {
        float g = hash21(uv * grainScale + vec2(t * 60.0, t * 47.0));
        // particleDensity gates grain: low = sparse particles, high = full coverage
        float gateThresh = (1.0 - particleDensity) * 0.5;
        float gMask = smoothstep(gateThresh, gateThresh + 0.05, g);
        color += (g - 0.5) * grainAmount * grainTint * gMask;
    }

    // === SHIMMER (subtle moving highlight) ===
    if (surfaceShimmer > 0.001) {
        float sh = fbm(uv * 4.0 + t * 0.15, 3);
        color *= 1.0 + (sh - 0.5) * surfaceShimmer;
    }

    float vig = 1.0 - length(uv - vec2(0.5)) * 0.4;
    color *= clamp(vig, 0.3, 1.0);
    color = max(color, vec3(0.005, 0.005, 0.01));

    fragColor = TDOutputSwizzle(vec4(color, 1.0));
}
'''


def find_cymatic_glsl():
    project = op(BASE_PATH)
    if project is None:
        print(f"[ERROR] {BASE_PATH} not found")
        return None
    for name in TARGET_GLSL_NAMES:
        node = op(name) or project.op(name)
        if node and node.type.startswith('glsl'):
            return node
    for child in project.children:
        if child.type == 'glslTOP':
            print(f"[INFO] Using found GLSL TOP: {child.path}")
            return child
    return None


def patch_glsl(glsl_top):
    project = op(BASE_PATH)
    dat_name = 'cymatic_glsl_src'
    dat = project.op(dat_name)
    if dat is None:
        dat = project.create('textDAT', dat_name)
        dat.nodeX = glsl_top.nodeX - 250
        dat.nodeY = glsl_top.nodeY
    dat.text = CYMATIC_GLSL
    glsl_top.par.pixeldat = dat.path
    print(f"[OK] Patched GLSL pixel shader on {glsl_top.path}")


def build_panel(glsl_top):
    project = op(BASE_PATH)
    panel_name = 'cymatic_panel'
    existing = project.op(panel_name)
    if existing is not None:
        existing.destroy()

    panel = project.create('containerCOMP', panel_name)
    panel.nodeX = glsl_top.nodeX + 400
    panel.nodeY = glsl_top.nodeY + 200
    panel.par.w = 340
    panel.par.h = 850

    sliders = [
        # Group 1: shape
        ('mode_n',            'Mode N (X)',          1.0, 12.0, 2.0),
        ('mode_m',            'Mode M (Y)',          1.0, 12.0, 3.0),
        ('harmonic_count',    'Harmonics',           1.0,  8.0, 4.0),
        ('drift_speed',       'Drift Speed',         0.0,  1.0, 0.1),
        ('nodal_thickness',   'Nodal Thickness',     0.3,  4.0, 1.0),
        ('contrast',          'Contrast',            0.5,  4.0, 1.5),
        ('complexity',        'Pattern Complexity',  0.0,  2.0, 0.7),
        # Group 2: texture (defaults tuned for very fine grain)
        ('noise_intensity',   'Noise Intensity',     0.0,  1.5, 0.4),
        ('noise_scale',       'Noise Scale',         0.5, 30.0, 12.0),
        ('warp_amount',       'Domain Warp',         0.0,  0.5, 0.06),
        ('grain_amount',      'Film Grain',          0.0,  0.5, 0.08),
        ('detail_octaves',    'Detail Octaves',      1.0,  8.0, 5.0),
        ('texture_size',      'Texture Size',        0.05, 2.0, 0.4),
        ('edge_softness',     'Edge Softness',       0.0,  1.0, 0.1),
        ('noise_stretch',     'Noise Stretch (anisotropy)', 0.1, 4.0, 1.0),
        ('particle_density',  'Particle Density',    0.0,  1.0, 0.7),
        # Group 3: material
        ('material_preset',   'Material (0-8)',      0.0,  8.0, 1.0),
        ('material_mix',      'Material Mix',        0.0,  1.0, 1.0),
        ('surface_shimmer',   'Surface Shimmer',     0.0,  1.0, 0.1),
        ('color_warmth',      'Color Warmth',        0.0,  1.0, 0.0),
    ]

    sx = 20
    sy_step = 38
    sy_start = 20

    for i, (name, label, lo, hi, default) in enumerate(sliders):
        slider = panel.create('sliderCOMP', name)
        slider.par.w = 280
        slider.par.h = 28
        try:
            slider.par.parentpos.val = (sx, sy_start + i * sy_step)
            slider.par.label = label
            slider.par.rangelow0 = lo
            slider.par.rangehigh0 = hi
            slider.par.value0 = default
        except Exception:
            pass

    print()
    print("[OK] Cymatic panel built at " + panel.path)
    print()
    print("Manual finishing step:")
    print(f"  On {glsl_top.path} add five vec4 uniforms:")
    print("     uniformname[next free] = 'uCymatic'    type vec4")
    print("     uniformname[next free] = 'uCymatic2'   type vec4")
    print("     uniformname[next free] = 'uTexture'    type vec4")
    print("     uniformname[next free] = 'uTexture2'   type vec4")
    print("     uniformname[next free] = 'uTexture3'   type vec4")
    print()
    print("  Then wire panel slider values into those uniforms (mergeCHOP into each).")
    print()
    print("Material presets (slide Material 0-8):")
    print("  0 = clean (math interference)")
    print("  1 = chalk (fine white dust on black)")
    print("  2 = white sand (fine cream grain)")
    print("  3 = warm sand (fine warm grain)")
    print("  4 = iron filings (fine cold metallic)")
    print("  5 = ash (fine grey carbon dust)")
    print("  6 = water surface (caustic shimmer)")
    print("  7 = ferrofluid (iridescent dark liquid)")
    print("  8 = flour (very fine pale dust, soft edges)")
    print()
    print("Slider ranges and defaults:")
    for name, label, lo, hi, default in sliders:
        print(f"  {label:25s}  {lo:5.1f} to {hi:5.1f}, default {default:5.2f}")


def main():
    print("=" * 60)
    print("Cymatic Panel Build (texture + material edition)")
    print("=" * 60)
    glsl = find_cymatic_glsl()
    if glsl is None:
        print("[ERROR] No cymatic GLSL TOP found. Run build_viz.py first.")
        return
    print(f"[OK] Found cymatic GLSL: {glsl.path}")
    patch_glsl(glsl)
    build_panel(glsl)
    print()
    print("Done. Slide knobs while audio plays. Patterns should respond live.")
    print("Try material preset 1 (sand) or 4 (ferrofluid) for immediate texture.")


main()
