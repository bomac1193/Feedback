// Cymatic Field + Lusona Lines + Dots + Head Glow — TEXTURED EDITION
// Preserves all original uniform schema; adds FBM noise, domain warp,
// material grain, audio-amplified warping for clearer reactivity.
//
// vec params (unchanged):
//   vec0: uChaos (x, y, z, loudness)
//   vec1: uParams1 (kuramotoR, time, chaosGain, progress)
//   vec2: uParams2 (lusonaRows, lusonaCols, lusonaMargin, lusonaPoints)
//   vec3: uParams3 (cymaticBright, lineBright, lineWidth, dotBright)
//   vec4: uParams4 (headGlow, headX, headY, masterBright)
//   vec5: uParams5 (vignette, 0, 0, 0)

uniform vec4 uChaos;
uniform vec4 uParams1;
uniform vec4 uParams2;
uniform vec4 uParams3;
uniform vec4 uParams4;
uniform vec4 uParams5;

layout(location = 0) out vec4 fragColor;

#define PI 3.14159265359

// Texture knobs (edit these to taste)
#define WARP_AMOUNT       0.12   // how much audio warps the plate (0=none, 0.3=heavy)
#define NOISE_SCALE       8.0    // FBM frequency for material grain
#define NOISE_INTENSITY   0.25   // FBM blend into cymatic field
#define GRAIN_AMOUNT      0.06   // film grain on top
#define GRAIN_SCALE       400.0  // grain particle pitch
#define LINE_TEXTURE      1.0    // 0=clean line, 1=textured stroke
#define MATERIAL_WARMTH   0.0    // 0=cool blue tint, 1=warm chalk

float hash21(vec2 p) {
    p = fract(p * vec2(123.34, 456.21));
    p += dot(p, p + 45.32);
    return fract(p.x * p.y);
}

float vnoise(vec2 p) {
    vec2 i = floor(p);
    vec2 f = fract(p);
    f = f * f * (3.0 - 2.0 * f);
    return mix(mix(hash21(i),               hash21(i + vec2(1, 0)), f.x),
               mix(hash21(i + vec2(0, 1)),  hash21(i + vec2(1, 1)), f.x), f.y);
}

float fbm(vec2 p) {
    float a = 0.5, total = 0.0, freq = 1.0;
    for (int i = 0; i < 4; i++) {
        total += a * vnoise(p * freq);
        freq *= 2.03;
        a *= 0.5;
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
    float loudness = clamp(abs(uChaos.w), 0.0, 1.0);

    float rows = max(uParams2.x, 1.0);
    float cols = max(uParams2.y, 1.0);
    float margin = uParams2.z;

    float cymaticBright = uParams3.x;
    float lineBright = uParams3.y;
    float lineW = max(uParams3.z, 0.001);
    float dotBrightP = uParams3.w;

    float headGlowP = uParams4.x;
    vec2 headPos = uParams4.yz;
    float masterBright = max(uParams4.w, 0.0);
    float vignetteAmt = uParams5.x;

    // === CHLADNI CYMATIC FIELD (with domain warp + FBM blend) ===
    vec2 plate = (uv - 0.5) * 2.0;
    plate.x *= displayAspect;

    // Domain warp from audio (uChaos.xy) — pattern translates and breathes
    vec2 audioWarp = vec2(uChaos.x, uChaos.y) * WARP_AMOUNT * (1.0 + loudness * 2.0);
    plate += audioWarp;

    // Audio scale (breath: expand/contract pulse)
    float audioScale = 1.0 + loudness * 0.25 + uParams1.z * 0.15;
    plate *= audioScale;

    float baseN = 2.0 + abs(uChaos.x) * 0.1;
    float baseM = 3.0 + abs(uChaos.y) * 0.08;
    float drift = t * 0.1 + uChaos.z * 0.5;  // chaos.z slides the drift smoothly

    float cymatic = 0.0;
    for (int i = 0; i < 3; i++) {
        float fi = float(i);
        float ni = baseN + fi * 1.3 + sin(drift + fi) * 0.5;
        float mi = baseM + fi * 0.9 + cos(drift * 0.7 + fi) * 0.5;
        cymatic += (1.0 / (1.0 + fi * 0.5)) * chladni(plate * 0.5, ni, mi);
    }
    cymatic *= mix(0.5, 1.0, kr);

    // FBM noise blended into the cymatic field for material grain
    float n = fbm(uv * NOISE_SCALE + t * 0.1) - 0.5;
    cymatic += n * NOISE_INTENSITY;

    float fw = fwidth(cymatic);
    float nodalLine = 1.0 - smoothstep(0.0, fw * 1.5, abs(cymatic));

    // Textural line modulation (chalk/ink stroke feel)
    if (LINE_TEXTURE > 0.5) {
        float strokeNoise = fbm(uv * 60.0);
        nodalLine *= mix(0.6, 1.0, strokeNoise);
    }

    // === LUSONA DISTANCE (unchanged) ===
    float minDist = texture(sTD2DInputs[0], uv).r;
    float lineMask = smoothstep(lineW, lineW * 0.3, minDist);
    float lusonaField = exp(-minDist * minDist / (lineW * 8.0));

    // === DOT GRID (unchanged) ===
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

    // === HEAD GLOW (unchanged) ===
    float hd = length(uv - headPos);
    float headGlow = exp(-hd * hd / 0.001) * headGlowP;

    // === COLOR COMBINE (with material warmth) ===
    vec3 cymaticCool = vec3(0.92, 0.9, 0.85);
    vec3 cymaticWarm = vec3(0.98, 0.88, 0.7);
    vec3 cymaticColor = mix(cymaticCool, cymaticWarm, MATERIAL_WARMTH);
    vec3 lineColor = vec3(0.95, 0.93, 0.88);
    vec3 dotColor = vec3(0.7, 0.68, 0.62);

    float cymaticBase = cymaticBright + loudness * cymaticBright * 3.0;
    float cymaticBoost = 1.0 + lusonaField * lineBright * 4.0;

    vec3 color = vec3(0.0);
    color += cymaticColor * nodalLine * cymaticBase * cymaticBoost;
    color += lineColor * lineMask * lineBright;
    color += dotColor * dotBright * dotBrightP;
    color += vec3(1.0, 0.97, 0.9) * headGlow;

    // Film grain (animated)
    if (GRAIN_AMOUNT > 0.001) {
        float g = hash21(uv * GRAIN_SCALE + vec2(t * 60.0, t * 47.0));
        color += (g - 0.5) * GRAIN_AMOUNT;
    }

    // Vignette
    float vig = 1.0 - length(uv - vec2(0.5)) * vignetteAmt;
    color *= clamp(vig, 0.3, 1.0);

    // Master brightness
    color *= masterBright;

    // Background floor
    color = max(color, vec3(0.008, 0.007, 0.006));

    fragColor = TDOutputSwizzle(vec4(color, 1.0));
}
