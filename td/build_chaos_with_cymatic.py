"""
Replace chaos_viz pixel shader with a lightweight chaos-point + audio-reactive
cymatic background using only the existing 8 OSC-bound uniforms.

No new uniforms. No CHOP binding. No regen system. The cymatic patterns
respond to audio automatically because the same uniforms that drive the
chaos point also drive the cymatic mode numbers, brightness, and line width.

Single-pass shader, cheap, realtime.

Run in TD textport (after running bypass_cymatic_layer.py first to clean state):

    exec(open(r'\\\\wsl.localhost\\Ubuntu\\home\\sphinxy\\Feedback\\td\\build_chaos_with_cymatic.py').read())
"""

CHAOS_VIZ_PATH = '/project1/feedback_viz/chaos_viz'


CHAOS_PLUS_CYMATIC_GLSL = '''// Chaos Attractor Point + Audio-Reactive Cymatic Background
// Single-pass. Uses only the 8 existing OSC-bound uniforms.
// Continuous warp + phase modulation = patterns smoothly morph with audio.

uniform float uChaosX;
uniform float uChaosY;
uniform float uChaosZ;
uniform float uAmp;
uniform float uAttractor;
uniform float uChaosGain;
uniform float uDecay;
uniform float uDrive;

out vec4 fragColor;

#define PI 3.14159265359

// =====================================================================
// EDIT THESE TO TASTE — they control the cymatic light/scale/frequency
// =====================================================================
#define CYMATIC_BRIGHTNESS    0.7    // overall cymatic line brightness (0-2)
#define CYMATIC_LINE_SCALE    1.0    // line thickness multiplier (0.3-3.0)
#define CYMATIC_FREQ_BASE_N   2.0    // base x-mode (1-8)
#define CYMATIC_FREQ_BASE_M   3.0    // base y-mode (1-8)
#define CYMATIC_AUDIO_DEPTH   1.5    // how aggressively audio warps the pattern (0-3)
#define CYMATIC_WARP_AMOUNT   0.08   // domain-warp depth from chaos (0-0.3)
#define CYMATIC_PHASE_GAIN    1.5    // phase modulation gain from chaos (0-3)
#define POINT_BRIGHTNESS      1.2    // chaos point intensity multiplier
#define POINT_SCALE           1.0    // chaos point size multiplier
// =====================================================================

float chladni(vec2 p, float n, float m, float pn, float pm) {
    // Phase-modulated chladni for smooth warping (instead of integer mode hop)
    return sin(n * PI * p.x + pn) * sin(m * PI * p.y + pm)
         + sin(m * PI * p.x + pm) * sin(n * PI * p.y + pn);
}

float hash21(vec2 p) {
    p = fract(p * vec2(123.34, 456.21));
    p += dot(p, p + 45.32);
    return fract(p.x * p.y);
}

void main()
{
    vec2 uv = vUV.st;
    vec2 res = uTDOutputInfo.res.zw;
    float aspect = res.x / res.y;

    // ============================================================
    // CYMATIC BACKGROUND (continuous audio warp, no mode hopping)
    // ============================================================

    vec2 plate = (uv - 0.5) * 2.0;
    plate.x *= aspect;

    // Domain warp — chaos position smoothly shifts the plate, so the
    // entire pattern slides/morphs continuously with audio motion
    vec2 audioOffset = vec2(uChaosX, uChaosY) * CYMATIC_WARP_AMOUNT;
    plate += audioOffset;

    // Phase modulation — uChaosZ continuously slides phase of the standing
    // waves, producing a smooth flowing morph instead of discrete mode jumps
    float phaseN = uChaosZ * CYMATIC_PHASE_GAIN;
    float phaseM = -uChaosZ * CYMATIC_PHASE_GAIN * 0.7;

    // Mode numbers — small audio influence on top of the base
    float modeN = CYMATIC_FREQ_BASE_N + abs(uChaosX) * 0.05 * CYMATIC_AUDIO_DEPTH
                  + uChaosGain * 0.4 * CYMATIC_AUDIO_DEPTH;
    float modeM = CYMATIC_FREQ_BASE_M + abs(uChaosY) * 0.04 * CYMATIC_AUDIO_DEPTH
                  + uDrive * 0.3 * CYMATIC_AUDIO_DEPTH;

    // Two phase-modulated harmonics — smooth blend, no flicker
    float c1 = chladni(plate * 0.5, modeN, modeM, phaseN, phaseM);
    float c2 = chladni(plate * 0.5, modeN + 1.7, modeM + 1.3,
                                     phaseN + 0.7, phaseM + 0.5);
    float cymatic = mix(c1, c2, 0.5 + 0.4 * sin(phaseN));

    // Normalize so brightness stays stable
    float fieldNorm = cymatic / (0.5 + abs(cymatic) * 0.5);

    // Line width — base + audio modulation
    float lineWidthUV = (0.006 + uChaosGain * 0.02) * CYMATIC_LINE_SCALE;
    float dist = abs(fieldNorm);

    float fw = max(fwidth(dist), 0.001);
    float lineCore = smoothstep(lineWidthUV + fw, lineWidthUV * 0.4, dist);

    float haloWidth = lineWidthUV * 4.5;
    float halo = smoothstep(haloWidth, lineWidthUV * 0.6, dist);
    halo = halo * halo * 0.4;

    float jitter = (hash21(uv * 1200.0) - 0.5) * lineWidthUV * 0.3;
    float jitteredCore = smoothstep(lineWidthUV * 1.2, lineWidthUV * 0.4,
                                    dist + jitter);
    lineCore = max(lineCore, jitteredCore * 0.8);

    float nodalLine = clamp(lineCore + halo, 0.0, 1.0);

    // Brightness reactivity to amplitude
    float cymaticBright = CYMATIC_BRIGHTNESS *
                          (0.4 + uAmp * 0.8) * (0.5 + uChaosGain * 0.7);
    nodalLine *= cymaticBright;

    nodalLine = pow(nodalLine, 1.0 + uDrive * 0.5);

    vec3 cymaticColor = mix(vec3(0.85, 0.9, 1.0),
                            vec3(1.0, 0.85, 0.6),
                            clamp(uDecay / 1.5, 0.0, 1.0) * 0.6);
    vec3 cymaticContribution = cymaticColor * nodalLine;

    // ============================================================
    // CHAOS POINT (the original)
    // ============================================================

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
    float pdist = length(fragPos - aPos);

    float baseSize = 0.003 + uDrive * 0.004;
    float pointSize = baseSize + uAmp * 0.008;
    float pIntensity = exp(-pdist * pdist / (pointSize * pointSize * 2.0));
    float pBrightness = 0.3 + uAmp * 0.7;

    float haloSize = pointSize * 4.0;
    float pHalo = exp(-pdist * pdist / (haloSize * haloSize * 2.0)) * 0.15;
    float chaosGlow = uChaosGain * 0.1;

    float pTotal = (pIntensity * pBrightness + pHalo + chaosGlow * pIntensity) * 1.2;
    vec3 pointColor = vec3(pTotal);

    float warmth = clamp(uDecay / 1.5, 0.0, 1.0) * 0.08;
    pointColor.r += warmth * pTotal;
    pointColor.b -= warmth * pTotal * 0.5;

    // ============================================================
    // COMPOSITE: cymatic background + chaos point on top
    // ============================================================

    vec3 finalColor = cymaticContribution + pointColor;
    finalColor = clamp(finalColor, 0.0, 1.0);

    fragColor = TDOutputSwizzle(vec4(finalColor, 1.0));
}
'''


def main():
    print("=" * 60)
    print("Chaos + Cymatic (single-pass, audio-reactive)")
    print("=" * 60)

    glsl = op(CHAOS_VIZ_PATH)
    if glsl is None:
        print(f"[ERROR] {CHAOS_VIZ_PATH} not found")
        return

    parent = glsl.parent()
    dat = parent.op('chaos_glsl_src')
    if dat is None:
        dat = parent.create('textDAT', 'chaos_glsl_src')
        dat.nodeX = glsl.nodeX - 250
        dat.nodeY = glsl.nodeY - 50
    dat.text = CHAOS_PLUS_CYMATIC_GLSL
    glsl.par.pixeldat = dat.path

    print(f"[OK] {glsl.path} now renders chaos point + audio-reactive cymatic")
    print()
    print("Cymatic mode numbers, brightness, line thickness, contrast all driven")
    print("by the existing OSC-bound uniforms (uChaosX, uChaosY, uChaosZ, uAmp,")
    print("uChaosGain, uDrive, uDecay).")
    print()
    print("No new uniforms. No CHOP binding. No regen. Realtime, single-pass.")
    print("=" * 60)


main()
