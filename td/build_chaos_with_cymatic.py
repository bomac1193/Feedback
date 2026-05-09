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
// Single-pass. Uses only the 8 existing OSC-bound uniforms — full reactivity.

uniform float uChaosX;     // Attractor X (drives cymatic mode N + position)
uniform float uChaosY;     // Attractor Y (drives cymatic mode M + position)
uniform float uChaosZ;     // Attractor Z (drives cymatic drift)
uniform float uAmp;        // Audio amplitude (drives brightness, point size)
uniform float uAttractor;  // Attractor type (used by point projection)
uniform float uChaosGain;  // Chaos intensity (drives cymatic line thickness)
uniform float uDecay;      // Decay (drives warm tint)
uniform float uDrive;      // Drive (drives point size + cymatic contrast)

out vec4 fragColor;

#define PI 3.14159265359

float chladni(vec2 p, float n, float m) {
    return sin(n * PI * p.x) * sin(m * PI * p.y)
         + sin(m * PI * p.x) * sin(n * PI * p.y);
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
    // CYMATIC BACKGROUND (audio-reactive, derived from chaos uniforms)
    // ============================================================

    // Mode numbers driven by chaos position (continuous wandering)
    float modeN = 2.0 + abs(uChaosX) * 0.15 + uChaosGain * 1.5;
    float modeM = 3.0 + abs(uChaosY) * 0.12 + uDrive * 1.2;

    // Drift derived from Z
    float drift = uChaosZ * 0.05;

    vec2 plate = (uv - 0.5) * 2.0;
    plate.x *= aspect;

    // Two-harmonic chladni — wobble between modes via drift
    float c1 = chladni(plate * 0.5, modeN, modeM);
    float c2 = chladni(plate * 0.5, modeN + 1.5 + sin(drift) * 0.5,
                                     modeM + 1.0 + cos(drift * 0.7) * 0.5);
    float cymatic = mix(c1, c2, 0.4 + 0.3 * sin(drift));

    // Normalize to keep brightness stable across mode count
    float fieldNorm = cymatic / (0.5 + abs(cymatic) * 0.5);

    // Line width driven by chaos gain (wider = more visible)
    float lineWidthUV = 0.005 + uChaosGain * 0.025;
    float dist = abs(fieldNorm);

    // Anti-aliased nodal line
    float fw = max(fwidth(dist), 0.001);
    float lineCore = smoothstep(lineWidthUV + fw, lineWidthUV * 0.4, dist);

    // Soft halo for line presence (always on)
    float haloWidth = lineWidthUV * 4.0;
    float halo = smoothstep(haloWidth, lineWidthUV * 0.6, dist);
    halo = halo * halo * 0.4;

    // Chalk-like edge jitter for textural feel
    float jitter = (hash21(uv * 1200.0) - 0.5) * lineWidthUV * 0.3;
    float jitteredCore = smoothstep(lineWidthUV * 1.2, lineWidthUV * 0.4,
                                    dist + jitter);
    lineCore = max(lineCore, jitteredCore * 0.8);

    float nodalLine = clamp(lineCore + halo, 0.0, 1.0);

    // Cymatic brightness scales with amplitude (audio-reactive intensity)
    float cymaticBright = (0.3 + uAmp * 0.7) * (0.4 + uChaosGain * 0.6);
    nodalLine *= cymaticBright;

    // Contrast from drive
    nodalLine = pow(nodalLine, 1.0 + uDrive * 0.5);

    // Cymatic color: cool with warm tint when decay is high
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
