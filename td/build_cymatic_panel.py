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
# Search order: direct names at /project1/, then inside known containers, then full recursive scan
TARGET_GLSL_NAMES = [
    '/project1/feedback_viz/chaos_viz',
    '/project1/feedback_viz/cymatic_viz',
    '/project1/feedback_viz/composite_viz',
    '/project1/chaos_viz',
    '/project1/cymatic_viz',
    '/project1/composite_viz',
]
CONTAINER_HINTS = ['feedback_viz', 'chaos_viz_container', 'viz']


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

    // === ANTI-ALIASED NODAL LINE ===
    // Use absolute UV-space thickness for consistent visible lines, not fwidth
    // (which goes to zero at high frequencies and causes thin/aliased look).
    // Supersample 4 taps for proper AA, then smoothstep into a clean line.
    float dist = abs(cymatic);
    float lineWidthUV = nodalThickness * 0.014;          // line core width
    float lineEdgeUV  = lineWidthUV * (1.0 + edgeSoftness * 3.0); // soft edge

    // 4-tap supersample (0.25 px offsets) reduces aliasing on busy patterns
    float pxX = 0.5 / res.x;
    float pxY = 0.5 / res.y;
    float aaSum = 0.0;
    for (int sx = -1; sx <= 1; sx += 2) {
        for (int sy = -1; sy <= 1; sy += 2) {
            vec2 sUv = uv + vec2(float(sx) * pxX, float(sy) * pxY);
            // Re-eval a small offset of cymatic at sample position. Approximate
            // by reusing the existing field gradient for cheapness.
            float dSample = dist + (float(sx) + float(sy)) * fwidth(dist) * 0.25;
            aaSum += smoothstep(lineEdgeUV, lineWidthUV * 0.4, dSample);
        }
    }
    float nodalLine = aaSum * 0.25;

    // Optional soft halo for line presence (disabled when edgeSoftness is 0)
    float haloWidth = lineWidthUV * 5.0 * (0.3 + edgeSoftness);
    float halo = smoothstep(haloWidth, lineWidthUV * 0.4, dist) * 0.35 * edgeSoftness;
    nodalLine = clamp(nodalLine + halo, 0.0, 1.0);
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
    """Look for the cymatic GLSL TOP in known places and via recursive scan."""
    project = op(BASE_PATH)
    if project is None:
        print(f"[ERROR] {BASE_PATH} not found")
        return None

    # 1. Direct paths
    for name in TARGET_GLSL_NAMES:
        node = op(name)
        if node and node.type.startswith('glsl'):
            print(f"[INFO] Found cymatic GLSL by direct path: {node.path}")
            return node

    # 2. Inside known container hints
    for hint in CONTAINER_HINTS:
        container = project.op(hint)
        if container is None:
            continue
        # Look for child glsl TOPs
        for child in container.children:
            if child.type == 'glslTOP':
                print(f"[INFO] Found cymatic GLSL inside {container.path}: {child.path}")
                return child

    # 3. Full recursive scan of /project1 for any glslTOP. Pick the one whose
    #    pixel shader looks like our cymatic shader (contains 'chladni' or
    #    'Cymatic'), else fall back to first match.
    candidates = []
    def walk(node):
        for c in node.children:
            if c.type == 'glslTOP':
                candidates.append(c)
            if hasattr(c, 'children') and c.children:
                walk(c)
    walk(project)

    if not candidates:
        print("[ERROR] No GLSL TOPs found anywhere in /project1.")
        return None

    # Prefer one whose pixel DAT contains 'chladni' or 'Cymatic'
    for c in candidates:
        try:
            pix_par = c.par.pixeldat.eval() if hasattr(c.par, 'pixeldat') else ''
            pix_dat = op(pix_par) if pix_par else None
            if pix_dat and ('chladni' in pix_dat.text.lower() or 'cymatic' in pix_dat.text.lower()):
                print(f"[INFO] Cymatic-shader match: {c.path}")
                return c
        except Exception:
            pass

    print(f"[INFO] Falling back to first GLSL TOP: {candidates[0].path}")
    print(f"       (Other GLSL TOPs found: {[c.path for c in candidates[1:]]})")
    return candidates[0]


def patch_glsl(glsl_top):
    """Replace the GLSL pixel shader with the textured cymatic version.

    Puts the source DAT alongside the GLSL TOP (same parent) so it stays with
    the rest of the visualization graph.
    """
    parent = glsl_top.parent()
    dat_name = 'cymatic_glsl_src'
    dat = parent.op(dat_name)
    if dat is None:
        dat = parent.create('textDAT', dat_name)
        dat.nodeX = glsl_top.nodeX - 250
        dat.nodeY = glsl_top.nodeY
    dat.text = CYMATIC_GLSL
    glsl_top.par.pixeldat = dat.path
    print(f"[OK] Patched GLSL pixel shader on {glsl_top.path}")
    print(f"     Source DAT: {dat.path}")


def build_custom_parameters(glsl_top):
    """Add custom 'Cymatic' parameter page to the GLSL TOP's parent COMP.

    TOPs in TD don't support custom parameter pages. We attach the page to the
    parent containerCOMP (e.g. /project1/feedback_viz) and have the GLSL TOP's
    uniform expressions read from those parameters via op(parent).par.<Name>.

    After this runs, click the parent COMP (NOT the GLSL TOP) and the 'Cymatic'
    page in the parameter pane gives you 20 sliders. The GLSL TOP updates live.
    """
    # COMPs support custom pages; TOPs don't. Walk up to the nearest COMP.
    target = glsl_top.parent()
    while target is not None and not hasattr(target, 'appendCustomPage'):
        target = target.parent() if target.parent() is not None else None
    if target is None:
        target = op(BASE_PATH)  # fallback to /project1
    print(f"[INFO] Custom parameters will live on {target.path} (parent COMP of the GLSL TOP)")

    # Parameter spec: (internal_name, label, default, min, max)
    # internal_name must start uppercase for TD custom params
    params = [
        # Shape
        ('Moden',           'Mode N (X)',          2.0,  1.0, 12.0),
        ('Modem',           'Mode M (Y)',          3.0,  1.0, 12.0),
        ('Harmoniccount',   'Harmonics',           4.0,  1.0,  8.0),
        ('Driftspeed',      'Drift Speed',         0.1,  0.0,  1.0),
        ('Nodalthickness',  'Nodal Thickness',     2.5,  0.3,  6.0),
        ('Contrast',        'Contrast',            1.0,  0.5,  4.0),
        ('Complexity',      'Pattern Complexity',  0.7,  0.0,  2.0),
        ('Colorwarmth',     'Color Warmth',        0.0,  0.0,  1.0),
        # Texture
        ('Noiseintensity',  'Noise Intensity',     0.4,  0.0,  1.5),
        ('Noisescale',      'Noise Scale',        12.0,  0.5, 30.0),
        ('Warpamount',      'Domain Warp',         0.06, 0.0,  0.5),
        ('Grainamount',     'Film Grain',          0.08, 0.0,  0.5),
        ('Detailoctaves',   'Detail Octaves',      5.0,  1.0,  8.0),
        ('Texturesize',     'Texture Size',        0.4,  0.05, 2.0),
        ('Edgesoftness',    'Edge Softness',       0.3,  0.0,  1.0),
        ('Noisestretch',    'Noise Stretch',       1.0,  0.1,  4.0),
        ('Particledensity', 'Particle Density',    0.7,  0.0,  1.0),
        # Material
        ('Materialpreset',  'Material (0-8)',      1.0,  0.0,  8.0),
        ('Materialmix',     'Material Mix',        1.0,  0.0,  1.0),
        ('Surfaceshimmer',  'Surface Shimmer',     0.1,  0.0,  1.0),
    ]

    # Remove old custom page if present (idempotency)
    for page in target.customPages:
        if page.name == 'Cymatic':
            page.destroy()

    page = target.appendCustomPage('Cymatic')
    for name, label, default, lo, hi in params:
        page.appendFloat(name, label=label)
        p = target.par[name]
        p.default = default
        p.min = lo
        p.max = hi
        p.normMin = lo
        p.normMax = hi
        p.clampMin = True
        p.clampMax = True
        p.val = default

    print(f"[OK] Added 'Cymatic' page with {len(params)} parameters to {target.path}")

    # Wire 5 vec4 uniforms to those parameters
    # uCymatic   = (Moden, Modem, Harmoniccount, Driftspeed)
    # uCymatic2  = (Nodalthickness, Contrast, Complexity, Colorwarmth)
    # uTexture   = (Noiseintensity, Noisescale, Warpamount, Grainamount)
    # uTexture2  = (Detailoctaves, Materialpreset, Materialmix, Surfaceshimmer)
    # uTexture3  = (Texturesize, Edgesoftness, Noisestretch, Particledensity)

    uniform_groups = [
        ('uCymatic',   ['Moden', 'Modem', 'Harmoniccount', 'Driftspeed']),
        ('uCymatic2',  ['Nodalthickness', 'Contrast', 'Complexity', 'Colorwarmth']),
        ('uTexture',   ['Noiseintensity', 'Noisescale', 'Warpamount', 'Grainamount']),
        ('uTexture2',  ['Detailoctaves', 'Materialpreset', 'Materialmix', 'Surfaceshimmer']),
        ('uTexture3',  ['Texturesize', 'Edgesoftness', 'Noisestretch', 'Particledensity']),
    ]

    # Hardcode start at slot 8 (build_chaos_viz uses 0-7).
    start_slot = 8
    print(f"[INFO] Writing 5 vec4 uniforms starting at slot {start_slot}")

    def set_expr(par_obj, expr_text):
        try:
            par_obj.mode = ParMode.EXPRESSION
        except Exception:
            try:
                par_obj.mode = 2
            except Exception:
                pass
        par_obj.expr = expr_text

    for k, (uniform_name, param_names) in enumerate(uniform_groups):
        slot = start_slot + k
        try:
            glsl_top.par[f'uniformtype{slot}'].val = 'vec4'
            glsl_top.par[f'uniformname{slot}'].val = uniform_name
            for ax_idx, ax in enumerate(['x', 'y', 'z', 'w']):
                p = glsl_top.par[f'value{slot}{ax}']
                set_expr(p, f"op('{target.path}').par.{param_names[ax_idx]}.eval()")
            print(f"[OK] Bound {uniform_name} to slot {slot}")
        except Exception as e:
            print(f"[WARN] Could not bind {uniform_name} at slot {slot}: {e}")

    print()
    print("=" * 60)
    print("How to use:")
    print(f"  1. In TD, click {target.path}  (the parent COMP, NOT the GLSL TOP)")
    print("  2. Look at the parameter pane on the right")
    print("  3. Find the 'Cymatic' page tab")
    print("  4. Drag any slider, the GLSL TOP updates live")
    print()
    print("Material presets (slide 'Material' parameter 0 to 8):")
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
    print("Try first: set Material to 1 (chalk) and Texture Size to 0.2.")
    print("Then bring Noise Intensity to 0.5 and Film Grain to 0.1.")
    print("That gets you the fine-cymatic-on-chalkboard look immediately.")
    print("=" * 60)


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
    build_custom_parameters(glsl)
    print()
    print("Done. Click the GLSL TOP, find the 'Cymatic' page in the parameter pane.")
    print("Slide any knob and the visual updates live.")


main()
