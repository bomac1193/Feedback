// Cymatic Field + Lusona Lines + Dots + Head Glow � TEXTURED + SLIDERS
// Live audio reactivity via uChaos (vec0). Slider control via vec5/vec6.
//
// vec params:
//   vec0: uChaos    (x, y, z, loudness)
//   vec1: uParams1  (kuramotoR, time, chaosGain, progress)
//   vec2: uParams2  (lusonaRows, lusonaCols, lusonaMargin, lusonaPoints)
//   vec3: uParams3  (cymaticBright, lineBright, lineWidth, dotBright)
//   vec4: uParams4  (headGlow, headX, headY, masterBright)
//   vec5: uParams5  (vignette, warpAmount, noiseIntensity, lineSmoothness)
//   vec6: uParams6  (materialWarmth, grainAmount, lineTexture, _)

uniform vec4 uChaos;
uniform vec4 uParams1;
uniform vec4 uParams2;
uniform vec4 uParams3;
uniform vec4 uParams4;
uniform vec4 uParams5;
uniform vec4 uParams6;
uniform vec4 uParams7;
uniform vec4 uParams8;
uniform vec4 uParams9;
uniform vec4 uParams10;
uniform vec4 uParams11;

layout(location = 0) out vec4 fragColor;

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
    return mix(mix(hash21(i),               hash21(i + vec2(1, 0)), f.x),
               mix(hash21(i + vec2(0, 1)),  hash21(i + vec2(1, 1)), f.x), f.y);
}

float fbm(vec2 p, int oct) {
    float a = 0.5, total = 0.0, freq = 1.0;
    for (int i = 0; i < 8; i++) {
        if (i >= oct) break;
        total += a * vnoise(p * freq);
        freq *= 2.03;
        a *= 0.5;
    }
    return total;
}
float fbm(vec2 p) { return fbm(p, 4); }

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

    // Slider-driven texture knobs (live from feedback_viz Cymatic page)
    float vignetteAmt    = uParams5.x;
    float warpAmount     = uParams5.y;
    float noiseIntensity = uParams5.z;
    float lineSmoothness = max(uParams5.w, 0.3);  // 0.3=jagged, 8=very smooth
    float materialWarmth = uParams6.x;
    float grainAmount    = uParams6.y;
    float lineTextureOn  = uParams6.z;
    float turbulence     = clamp(uParams6.w, 0.0, 2.0); // ambient non-gated motion
    float cymLineWidth   = max(uParams7.x, 0.1);   // multiplier on cymatic line core width
    vec3  cymColorRGB    = uParams7.yzw;            // cymatic line color RGB
    float cymScale       = max(uParams8.x, 0.01);  // pattern scale (1 = default, 0.01 = tiny)
    float noiseScaleP    = max(uParams8.y, 0.5);   // FBM frequency
    float harmonicCount  = clamp(uParams8.z, 1.0, 8.0); // number of chladni iterations
    float audioDepth     = max(uParams8.w, 0.0);   // master multiplier on audio influence
    float noiseSpeed     = uParams9.x;             // FBM time advance multiplier
    float noiseContrast  = max(uParams9.y, 0.05);  // power applied to noise
    int   noiseOctaves   = int(clamp(uParams9.z, 1.0, 8.0));
    float noiseWarp      = clamp(uParams9.w, 0.0, 1.0); // domain warp via noise itself
    float idleAmount        = clamp(uParams10.x, 0.0, 1.0); // 0=noise on always, 1=noise off when quiet
    float noiseContrastIdle = max(uParams10.y, 0.05);       // contrast value when audio is idle
    float scaleEnv          = clamp(uParams10.w, 0.0, 1.0); // scale envelope (peak-driven, slow release)
    float cymScalePeak      = max(uParams11.x, 0.01);       // target pattern scale at audio peak

    // === CHLADNI CYMATIC FIELD (with domain warp + FBM blend) ===
    vec2 plate = (uv - 0.5) * 2.0;
    plate.x *= displayAspect;

    // PEAK-DRIVEN AUDIO REACTIVITY
    // All audio influence is multiplied by `loudness` (the gated peak envelope).
    // When audio is quiet, loudness ~= 0 and visual is static. When a peak hits,
    // loudness spikes and the cymatic warps, scales, and shifts in lockstep.
    // The base pattern (when loudness=0) is the unmodulated cymatic.

    float peakEnergy = loudness * audioDepth;
    // Combined energy = strong peak pulses + gentle baseline turbulence
    float chaosEnergy = peakEnergy + turbulence * 0.3;

    // Domain warp: peak-gated AND turbulence baseline
    vec2 audioWarp = vec2(uChaos.x, uChaos.y) * warpAmount * chaosEnergy * 4.0;
    plate += audioWarp;

    // Audio scale pulse: peak-gated, turbulence adds tiny baseline breath
    float audioScale = 1.0 + peakEnergy * 0.6 + turbulence * 0.05;
    plate *= audioScale;

    // Mode shift: combined peak + turbulence
    float baseN = 2.0 + abs(uChaos.x) * chaosEnergy * 0.4;
    float baseM = 3.0 + abs(uChaos.y) * chaosEnergy * 0.3;
    // Drift: turbulence keeps the pattern slowly flowing even when audio is quiet
    float drift = t * 0.1 + uChaos.z * chaosEnergy * 1.5
                  + t * turbulence * 0.3;

    int hCount = int(harmonicCount + 0.5);
    float cymatic = 0.0;
    float wSum = 0.0;
    for (int i = 0; i < 8; i++) {
        if (i >= hCount) break;
        float fi = float(i);
        float ni = baseN + fi * 1.3 + sin(drift + fi) * 0.5;
        float mi = baseM + fi * 0.9 + cos(drift * 0.7 + fi) * 0.5;
        float w = 1.0 / (1.0 + fi * 0.5);
        // cymScale shrinks/grows the plate sampling. effectiveCymScale lerps
        // toward cymScalePeak when audio peaks (scaleEnv high), back to cymScale
        // when idle (scaleEnv low). Release controlled by Cymscalerelease.
        float effectiveCymScale = mix(cymScale, cymScalePeak, scaleEnv);
        cymatic += w * chladni(plate * 0.5 / effectiveCymScale, ni, mi);
        wSum += w;
    }
    cymatic /= max(wSum, 0.001);
    cymatic *= mix(0.5, 1.0, kr);

    // Noise self-warp (lets noise distort its own sample point — fluid feel)
    vec2 noiseUv = uv;
    if (noiseWarp > 0.001) {
        float wx = fbm(uv * noiseScaleP * 0.3 + t * 0.05 * noiseSpeed, noiseOctaves);
        float wy = fbm(uv * noiseScaleP * 0.3 + vec2(11.7, 4.3) - t * 0.04 * noiseSpeed, noiseOctaves);
        noiseUv += (vec2(wx, wy) - 0.5) * noiseWarp;
    }

    // Idle gate: scales noise (and grain) when audio is quiet.
    // idleAmount=0 means noise full strength always; =1 means noise off
    // when quiet, full when peak. Uses gated loudness as the activity signal.
    float idleGate = mix(1.0, peakEnergy, idleAmount);

    // FBM noise blended into the cymatic field for material grain.
    // Contrast lerps between idle and peak values: idle = sharper/higher,
    // peak = soft/lower (or whatever user sets).
    float effectiveContrast = mix(noiseContrastIdle, noiseContrast, peakEnergy);
    float n = fbm(noiseUv * noiseScaleP + t * 0.1 * noiseSpeed, noiseOctaves) - 0.5;
    n = sign(n) * pow(abs(n) * 2.0, effectiveContrast) * 0.5;
    cymatic += n * noiseIntensity * idleGate;

    // Smooth vs jagged line: lineSmoothness multiplies the antialiased edge width.
    // Low smoothness (0.3-1) = sharp/jagged. High smoothness (3-8) = soft/smooth halo.
    // Line width = how thick the line is; smoothness = how soft the edge is.
    // Both compose: total threshold = fw * smoothness * width.
    float fw = max(fwidth(cymatic), 0.0001);
    float lineThreshold = fw * lineSmoothness * cymLineWidth;
    float nodalLine = 1.0 - smoothstep(0.0, lineThreshold, abs(cymatic));

    // Textural line modulation (chalk/ink stroke feel)
    if (lineTextureOn > 0.5) {
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

    // === COLOR COMBINE (cymColorRGB from slider, blended with material warmth) ===
    vec3 warmTint = vec3(0.98, 0.88, 0.7);
    vec3 cymaticColor = mix(cymColorRGB, warmTint, materialWarmth * 0.6);
    vec3 lineColor = vec3(0.95, 0.93, 0.88);
    vec3 dotColor = vec3(0.7, 0.68, 0.62);

    float cymaticBase = cymaticBright + loudness * cymaticBright * 3.0;
    float cymaticBoost = 1.0 + lusonaField * lineBright * 4.0;

    vec3 color = vec3(0.0);
    color += cymaticColor * nodalLine * cymaticBase * cymaticBoost;
    color += lineColor * lineMask * lineBright;
    color += dotColor * dotBright * dotBrightP;
    color += vec3(1.0, 0.97, 0.9) * headGlow;

    // Vignette
    float vig = 1.0 - length(uv - vec2(0.5)) * vignetteAmt;
    color *= clamp(vig, 0.3, 1.0);

    // Master brightness
    color *= masterBright;

    // Background floor (dark base on which film grain rides)
    color = max(color, vec3(0.008, 0.007, 0.006));

    // Film grain: positive-only so it visibly textures dark/black areas
    // (was bipolar (g-0.5) which clamped negative half to nothing on black).
    // Idle-gated softly so background quiets when audio is silent.
    if (grainAmount > 0.001) {
        float g = hash21(uv * 400.0 + vec2(t * 60.0, t * 47.0));
        float grainGate = mix(1.0, peakEnergy, idleAmount * 0.7);
        color += vec3(g * grainAmount * grainGate);
    }

    fragColor = TDOutputSwizzle(vec4(color, 1.0));
}
