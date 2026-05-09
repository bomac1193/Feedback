"""
Build Cymatic Layer (rollback + isolated cymatic shader, regen-driven).

Three fixes from the prior version:
  - Shader uses NO `absTime.seconds` (invalid GLSL); time comes via a CHOP-driven
    constant baked into the shader text on regen.
  - Uniform binding is bypassed entirely. Shader values are baked in as GLSL
    constants and the shader text is regenerated whenever any Cymatic custom
    param on feedback_viz changes. A ParExec DAT watches the params and calls
    a render function in a Python DAT.
  - Disconnect uses Connector.disconnect() with no args (TD API correct form).

Usage in TD textport:
    exec(open(r'\\\\wsl.localhost\\Ubuntu\\home\\sphinxy\\Feedback\\td\\build_cymatic_layer.py').read())

This will:
    1. Restore chaos_viz pixel shader to the original chaos-point version
       (so OSC reactivity returns).
    2. Create cymatic_layer GLSL TOP downstream.
    3. Create cymatic_render Text DAT with the render() function.
    4. Create cymatic_paramexec DAT that triggers render() on slider changes.
    5. Call render() once to populate the shader.
    6. Auto-rewire: chaos_viz -> cymatic_layer -> existing downstream.
"""

BASE_PATH = '/project1/feedback_viz'
CHAOS_VIZ_PATH = '/project1/feedback_viz/chaos_viz'
LAYER_NAME = 'cymatic_layer'
RENDER_DAT_NAME = 'cymatic_render'
PAREXEC_DAT_NAME = 'cymatic_paramexec'


CHAOS_GLSL_ORIGINAL = '''// Chaos Attractor Point — restored original
uniform float uChaosX;
uniform float uChaosY;
uniform float uChaosZ;
uniform float uAmp;
uniform float uAttractor;
uniform float uChaosGain;
uniform float uDecay;
uniform float uDrive;

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
    vec2 attPos = vec2(uChaosX * scale, uChaosY * scale + uChaosZ * scale * 0.15);
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


# CYMATIC SHADER TEMPLATE — placeholders are replaced at render time with current
# parameter values from feedback_viz. No uniforms, no absTime. Just a TIME constant
# baked in periodically.
CYMATIC_TEMPLATE = '''// Cymatic Layer (regenerated from feedback_viz custom params)

uniform float uCymaticTime;  // bound to a CHOP value via the GLSL TOP's CHOP input or expression

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
    float t = uCymaticTime;

    vec3 background = texture(sTD2DInputs[0], uv).rgb;

    // Baked-in parameter values (regenerated from feedback_viz Cymatic page)
    float modeBaseN     = {Moden};
    float modeBaseM     = {Modem};
    float harmonicCount = {Harmoniccount};
    float driftSpeed    = {Driftspeed};
    float nodalThickness = {Nodalthickness};
    float contrast      = {Contrast};
    float complexity    = {Complexity};
    float colorWarmth   = {Colorwarmth};
    float noiseIntensity = {Noiseintensity};
    float noiseScale     = {Noisescale};
    float warpAmount     = {Warpamount};
    float grainAmount    = {Grainamount};
    float detailOctaves  = {Detailoctaves};
    int   materialPreset = int({Materialpreset});
    float materialMix    = {Materialmix};
    float surfaceShimmer = {Surfaceshimmer};
    float textureSize     = {Texturesize};
    float edgeSoftness    = {Edgesoftness};
    float noiseStretch    = {Noisestretch};
    float particleDensity = {Particledensity};

    // Domain warp
    vec2 warpUv = uv;
    if (warpAmount > 0.001) {
        vec2 wScale = vec2(noiseScale * 1.7 * noiseStretch, noiseScale * 1.7);
        float wn1 = fbm(uv * wScale + t * 0.05, int(detailOctaves + 0.5));
        float wn2 = fbm(uv * wScale + vec2(13.7, 7.3) - t * 0.04, int(detailOctaves + 0.5));
        warpUv += vec2(wn1, wn2) * warpAmount * 2.0 - warpAmount;
    }

    // Multi-harmonic Chladni
    vec2 plate = (warpUv - 0.5) * 2.0;
    plate.x *= displayAspect;
    float baseN = modeBaseN;
    float baseM = modeBaseM;
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

    // Normalize
    float absC = abs(cymatic);
    float fieldNorm = cymatic / (0.5 + absC * 0.6);

    if (noiseIntensity > 0.001) {
        float n = fbm(warpUv * noiseScale * 5.0 + t * 0.05, int(detailOctaves + 0.5));
        fieldNorm += (n - 0.5) * noiseIntensity * 0.3;
    }

    // Textural lines
    float dist = abs(fieldNorm);
    float coreWidthUV = nodalThickness * 0.012;
    float haloWidthUV = coreWidthUV * (4.0 + edgeSoftness * 4.0);
    float strokeNoise = fbm(uv * 90.0 + warpUv * 30.0, 3);
    float strokeMod = mix(0.55, 1.0, strokeNoise);
    float coreSharp = smoothstep(coreWidthUV * 1.5, coreWidthUV * 0.3, dist);
    float coreTextured = coreSharp * strokeMod;
    float edgeJitter = (hash21(uv * 800.0) - 0.5) * coreWidthUV * 0.3;
    float jitteredCore = smoothstep(coreWidthUV * 1.2, coreWidthUV * 0.4, dist + edgeJitter);
    coreTextured = max(coreTextured, jitteredCore * strokeMod * 0.7);
    float halo = smoothstep(haloWidthUV, coreWidthUV * 0.6, dist);
    halo = halo * halo * 0.35;
    float nodalLine = clamp(coreTextured + halo, 0.0, 1.0);
    nodalLine = pow(nodalLine, max(contrast, 0.4));

    // Material
    vec3 cymaticColor = vec3(0.85, 0.9, 1.0);
    vec3 grainTint = vec3(1.0);
    float baseGrainScale = 250.0;
    if (materialPreset == 1)      { cymaticColor = vec3(0.95, 0.95, 0.93); baseGrainScale = 600.0; grainTint = vec3(1.0, 1.0, 0.97); }
    else if (materialPreset == 2) { cymaticColor = vec3(0.96, 0.92, 0.82); baseGrainScale = 550.0; grainTint = vec3(1.0, 0.97, 0.88); }
    else if (materialPreset == 3) { cymaticColor = vec3(0.92, 0.78, 0.55); baseGrainScale = 500.0; grainTint = vec3(1.0, 0.88, 0.7); }
    else if (materialPreset == 4) { cymaticColor = vec3(0.78, 0.84, 0.95); baseGrainScale = 700.0; grainTint = vec3(0.85, 0.9, 1.0); }
    else if (materialPreset == 5) { cymaticColor = vec3(0.7, 0.7, 0.72); baseGrainScale = 650.0; grainTint = vec3(0.78, 0.78, 0.8); }
    else if (materialPreset == 6) { cymaticColor = vec3(0.5, 0.85, 0.95); baseGrainScale = 220.0; grainTint = vec3(0.7, 1.0, 0.95); }
    else if (materialPreset == 7) {
        float irid = sin(uv.x * 8.0 + t * 0.5) * 0.5 + 0.5;
        cymaticColor = mix(vec3(0.4, 0.6, 1.0), vec3(0.95, 0.6, 0.9), irid);
        baseGrainScale = 320.0; grainTint = vec3(0.9, 0.85, 1.0);
    }
    else if (materialPreset == 8) { cymaticColor = vec3(0.97, 0.96, 0.92); baseGrainScale = 800.0; grainTint = vec3(1.0, 0.99, 0.95); }
    else                          { cymaticColor = mix(vec3(0.85, 0.9, 1.0), vec3(1.0, 0.85, 0.6), colorWarmth); }
    float grainScale = baseGrainScale / max(textureSize, 0.05);
    cymaticColor = mix(cymaticColor, mix(cymaticColor, vec3(1.0, 0.85, 0.6), colorWarmth), 0.5);

    vec3 lineColor = cymaticColor * nodalLine;
    if (grainAmount > 0.001) {
        float g = hash21(uv * grainScale + vec2(t * 60.0, t * 47.0));
        float gateThresh = (1.0 - particleDensity) * 0.5;
        float gMask = smoothstep(gateThresh, gateThresh + 0.05, g);
        lineColor += (g - 0.5) * grainAmount * grainTint * gMask;
    }
    if (surfaceShimmer > 0.001) {
        float sh = fbm(uv * 4.0 + t * 0.15, 3);
        lineColor *= 1.0 + (sh - 0.5) * surfaceShimmer;
    }

    vec3 finalColor = background + lineColor * mix(0.5, 1.0, materialMix);
    fragColor = TDOutputSwizzle(vec4(finalColor, 1.0));
}
'''


# Render DAT contents — Python function that fills the shader template
# with current values from feedback_viz custom params
RENDER_DAT_PY = '''# Auto-generated. Renders cymatic_layer shader text from feedback_viz Cymatic params.

def render():
    """Read feedback_viz Cymatic page params, fill the template, write to shader DAT."""
    fv = op('/project1/feedback_viz')
    template_dat = op('/project1/feedback_viz/cymatic_layer_template')
    out_dat = op('/project1/feedback_viz/cymatic_layer_glsl_src')
    if fv is None or template_dat is None or out_dat is None:
        return

    template = template_dat.text
    param_names = [
        'Moden', 'Modem', 'Harmoniccount', 'Driftspeed',
        'Nodalthickness', 'Contrast', 'Complexity', 'Colorwarmth',
        'Noiseintensity', 'Noisescale', 'Warpamount', 'Grainamount',
        'Detailoctaves', 'Materialpreset', 'Materialmix', 'Surfaceshimmer',
        'Texturesize', 'Edgesoftness', 'Noisestretch', 'Particledensity',
    ]
    values = {}
    for name in param_names:
        try:
            v = fv.par[name].eval()
            values[name] = f"{float(v):.6f}"
        except Exception:
            values[name] = "0.0"

    rendered = template.format(**values)
    out_dat.text = rendered
'''


# ParExecuteDAT contents — calls render() on each parameter change
PAREXEC_DAT_PY = '''# Watches feedback_viz Cymatic params and triggers shader regeneration.

def onValueChange(par, prev):
    op('/project1/feedback_viz/cymatic_render').module.render()
    return

def onPulse(par):
    return

def onExpressionChange(par, val, prev):
    op('/project1/feedback_viz/cymatic_render').module.render()
    return

def onExportChange(par, val, prev):
    return

def onEnableChange(par, val, prev):
    return

def onModeChange(par, prev):
    return
'''


def restore_chaos_shader():
    glsl = op(CHAOS_VIZ_PATH)
    if glsl is None:
        print(f"[ERROR] {CHAOS_VIZ_PATH} not found")
        return None
    parent = glsl.parent()
    dat = parent.op('chaos_glsl_src')
    if dat is None:
        dat = parent.create('textDAT', 'chaos_glsl_src')
        dat.nodeX = glsl.nodeX - 250
        dat.nodeY = glsl.nodeY - 50
    dat.text = CHAOS_GLSL_ORIGINAL
    glsl.par.pixeldat = dat.path
    print(f"[OK] Restored {glsl.path} to original chaos-point shader")
    return glsl


def disconnect_safely(in_connector):
    """Disconnect a single input connector. Connector.disconnect() takes no args."""
    try:
        in_connector.disconnect()
        return True
    except Exception as e:
        print(f"[WARN] Disconnect failed on {in_connector.owner.path}: {e}")
        return False


def build_cymatic_layer(chaos_top):
    parent = chaos_top.parent()

    # Create / replace cymatic_layer
    layer = parent.op(LAYER_NAME)
    if layer is not None:
        # Disconnect everything first (clean idempotent rebuild)
        for in_conn in list(layer.inputConnectors[0].connections):
            disconnect_safely(layer.inputConnectors[0])
            break
        layer.destroy()
    layer = parent.create('glslTOP', LAYER_NAME)
    layer.nodeX = chaos_top.nodeX + 250
    layer.nodeY = chaos_top.nodeY

    # Template DAT
    tmpl = parent.op('cymatic_layer_template')
    if tmpl is None:
        tmpl = parent.create('textDAT', 'cymatic_layer_template')
        tmpl.nodeX = layer.nodeX - 250
        tmpl.nodeY = layer.nodeY - 100
    tmpl.text = CYMATIC_TEMPLATE
    print(f"[OK] Wrote shader template to {tmpl.path}")

    # Output shader DAT (initially empty — render() fills it)
    out_dat = parent.op('cymatic_layer_glsl_src')
    if out_dat is None:
        out_dat = parent.create('textDAT', 'cymatic_layer_glsl_src')
        out_dat.nodeX = layer.nodeX - 250
        out_dat.nodeY = layer.nodeY - 200
    print(f"[OK] Output shader DAT: {out_dat.path}")

    # Render DAT (Python module)
    render_dat = parent.op(RENDER_DAT_NAME)
    if render_dat is None:
        render_dat = parent.create('textDAT', RENDER_DAT_NAME)
        render_dat.nodeX = layer.nodeX - 500
        render_dat.nodeY = layer.nodeY - 150
    render_dat.text = RENDER_DAT_PY
    print(f"[OK] Render module: {render_dat.path}")

    # ParExecute DAT watching feedback_viz params
    pex = parent.op(PAREXEC_DAT_NAME)
    if pex is None:
        pex = parent.create('parameterexecuteDAT', PAREXEC_DAT_NAME)
        pex.nodeX = layer.nodeX - 500
        pex.nodeY = layer.nodeY - 250
    pex.text = PAREXEC_DAT_PY
    pex.par.op = parent.path
    pex.par.pars = ' '.join([
        'Moden', 'Modem', 'Harmoniccount', 'Driftspeed',
        'Nodalthickness', 'Contrast', 'Complexity', 'Colorwarmth',
        'Noiseintensity', 'Noisescale', 'Warpamount', 'Grainamount',
        'Detailoctaves', 'Materialpreset', 'Materialmix', 'Surfaceshimmer',
        'Texturesize', 'Edgesoftness', 'Noisestretch', 'Particledensity',
    ])
    pex.par.valuechange = True
    pex.par.active = True
    print(f"[OK] ParExec watcher: {pex.path}")

    # Trigger first render
    try:
        render_dat.module.render()
        print(f"[OK] Initial render filled {out_dat.path}")
    except Exception as e:
        print(f"[WARN] Initial render failed: {e}")

    # Wire shader DAT to the GLSL TOP
    layer.par.pixeldat = out_dat.path

    # Bind a time uniform via expression on uniform slot 0 (or skip if it fails)
    try:
        layer.par.uniformname0 = 'uCymaticTime'
        layer.par.uniformtype0 = 'float'
        layer.par.value0x.mode = ParMode.EXPRESSION
        layer.par.value0x.expr = 'me.time.seconds'
        print("[OK] uCymaticTime uniform bound to me.time.seconds")
    except Exception as e:
        print(f"[WARN] Could not bind uCymaticTime; animation will be static: {e}")

    # Discover downstream targets (skip self)
    downstream = []
    try:
        for in_conn in list(chaos_top.outputConnectors[0].connections):
            owner = in_conn.owner
            if owner.path == layer.path:
                continue
            downstream.append((owner, in_conn.index))
    except Exception as e:
        print(f"[INFO] Could not enumerate downstream connections: {e}")

    if downstream:
        print(f"[INFO] chaos_viz feeds {len(downstream)} downstream op(s):")
        for op_, idx in downstream:
            print(f"       - {op_.path} (input {idx})")

    # Disconnect downstream
    for op_, idx in downstream:
        try:
            op_.inputConnectors[idx].disconnect()
            print(f"[OK] Disconnected input {idx} of {op_.path}")
        except Exception as e:
            print(f"[WARN] Disconnect failed on {op_.path}: {e}")

    # Connect chaos_top -> layer
    try:
        chaos_top.outputConnectors[0].connect(layer.inputConnectors[0])
        print(f"[OK] {chaos_top.path} -> {layer.path}")
    except Exception as e:
        print(f"[WARN] Connect chaos->layer failed: {e}")

    # Connect layer -> each downstream
    for op_, idx in downstream:
        try:
            layer.outputConnectors[0].connect(op_.inputConnectors[idx])
            print(f"[OK] {layer.path} -> {op_.path} (input {idx})")
        except Exception as e:
            print(f"[WARN] Connect layer->{op_.path} failed: {e}")

    return layer


def main():
    print("=" * 60)
    print("Cymatic Layer Build (regen-driven)")
    print("=" * 60)

    chaos = restore_chaos_shader()
    if chaos is None:
        return

    layer = build_cymatic_layer(chaos)
    if layer is None:
        return

    print()
    print("=" * 60)
    print("Done. chaos_viz is OSC-reactive again.")
    print(f"cymatic_layer wraps it with sliders driving shader regen.")
    print()
    print("Drag any slider on /project1/feedback_viz Cymatic page.")
    print("On change, the shader text DAT is rewritten and recompiled.")
    print("There may be a brief recompile flicker (50-100ms) per change.")
    print("=" * 60)


main()
