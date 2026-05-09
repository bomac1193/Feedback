// CHEMICAL DECAY - Psychedelic fluid decay / degraded film generator
// Creates organic flowing patterns like chemically degraded film
// Ref: psychedelic silhouette, organic coastline erosion
// Uses Inigo Quilez-style iterated domain warping
//
// Inputs: 0=optional image (displacement/color source)
// vec0 uControl: x=complexity(1-5), y=sharpness(0-1), z=bands(2-8), w=erosion(0-1)
// vec1 uColor:   x=palette(0-5), y=saturation(0-2), z=brightness(0-2), w=contrast(0.5-3)
// vec2 uAnim:    x=time(absTime), y=speed(0.1-3), z=flow(0-2), w=turbulence(0-2)
// vec3 uAudio:   x=bass, y=mid, z=high, w=overall
// vec4 uExtra:   x=globalScale(0.1-10)

out vec4 fragColor;

uniform vec4 uControl;
uniform vec4 uColor;
uniform vec4 uAnim;
uniform vec4 uAudio;
uniform vec4 uExtra;

float hash(vec2 p) {
    p = fract(p * vec2(123.34, 456.21));
    p += dot(p, p + 45.32);
    return fract(p.x * p.y);
}

float vnoise(vec2 p) {
    vec2 i = floor(p), f = fract(p);
    f = f * f * (3.0 - 2.0 * f);
    return mix(mix(hash(i), hash(i+vec2(1,0)), f.x),
               mix(hash(i+vec2(0,1)), hash(i+vec2(1,1)), f.x), f.y);
}

float fbm(vec2 p) {
    float v = 0.0;
    v += vnoise(p) * 0.5;   p *= 2.01;
    v += vnoise(p) * 0.25;  p *= 2.02;
    v += vnoise(p) * 0.125; p *= 2.03;
    v += vnoise(p) * 0.0625;
    return v;
}

vec3 hsv2rgb(vec3 c) {
    vec3 p = abs(fract(c.xxx + vec3(0.0, 2.0/3.0, 1.0/3.0)) * 6.0 - 3.0);
    return c.z * mix(vec3(1.0), clamp(p - 1.0, 0.0, 1.0), c.y);
}

// IQ-style iterated domain warping
float warpedPattern(vec2 p, float t, float complexity) {
    vec2 q = vec2(fbm(p + vec2(0.0, 0.0) + t * 0.04),
                  fbm(p + vec2(5.2, 1.3) + t * 0.03));

    vec2 r = vec2(fbm(p + 4.0 * q + vec2(1.7, 9.2) + t * 0.02),
                  fbm(p + 4.0 * q + vec2(8.3, 2.8) + t * 0.015));

    float result = fbm(p + 4.0 * r);

    if (complexity > 2.0) {
        vec2 s = vec2(fbm(p + 3.0 * r + vec2(3.1, 7.4) + t * 0.01),
                      fbm(p + 3.0 * r + vec2(6.8, 1.2) + t * 0.008));
        result = mix(result, fbm(p + 3.5 * s), (complexity - 2.0) / 3.0);
    }

    return result;
}

// Palette functions — each returns a vec3 color for value t in [0,1]
vec3 palette0(float t) {
    // Psychedelic: magenta → green → orange → black
    vec3 a = vec3(0.5, 0.5, 0.5);
    vec3 b = vec3(0.5, 0.5, 0.5);
    vec3 c = vec3(1.0, 1.0, 0.5);
    vec3 d = vec3(0.80, 0.90, 0.30);
    return a + b * cos(6.28318 * (c * t + d));
}

vec3 palette1(float t) {
    // Chemical: teal → purple → orange → black
    vec3 a = vec3(0.5, 0.5, 0.5);
    vec3 b = vec3(0.5, 0.5, 0.5);
    vec3 c = vec3(1.0, 0.7, 0.4);
    vec3 d = vec3(0.0, 0.15, 0.20);
    return a + b * cos(6.28318 * (c * t + d));
}

vec3 palette2(float t) {
    // Erosion: deep green → teal → burnt orange → dark red
    vec3 a = vec3(0.2, 0.4, 0.3);
    vec3 b = vec3(0.3, 0.4, 0.3);
    vec3 c = vec3(1.5, 1.0, 0.7);
    vec3 d = vec3(0.0, 0.33, 0.67);
    return a + b * cos(6.28318 * (c * t + d));
}

vec3 palette3(float t) {
    // Film decay: cyan → magenta → yellow → black
    vec3 a = vec3(0.5, 0.5, 0.5);
    vec3 b = vec3(0.5, 0.5, 0.5);
    vec3 c = vec3(2.0, 1.0, 1.0);
    vec3 d = vec3(0.50, 0.20, 0.25);
    return a + b * cos(6.28318 * (c * t + d));
}

vec3 palette4(float t) {
    // Bioluminescent: deep blue → cyan → green → warm white
    vec3 a = vec3(0.1, 0.3, 0.5);
    vec3 b = vec3(0.3, 0.5, 0.4);
    vec3 c = vec3(1.0, 1.0, 1.0);
    vec3 d = vec3(0.0, 0.10, 0.20);
    return a + b * cos(6.28318 * (c * t + d));
}

vec3 palette5(float t) {
    // Infrared: black → deep red → orange → hot white
    return mix(vec3(0.0), mix(vec3(0.6, 0.05, 0.05),
           mix(vec3(1.0, 0.4, 0.05), vec3(1.0, 0.9, 0.7),
           smoothstep(0.6, 1.0, t)), smoothstep(0.25, 0.6, t)),
           smoothstep(0.0, 0.25, t));
}

vec3 getPalette(int idx, float t) {
    if (idx <= 0) return palette0(t);
    if (idx == 1) return palette1(t);
    if (idx == 2) return palette2(t);
    if (idx == 3) return palette3(t);
    if (idx == 4) return palette4(t);
    return palette5(t);
}

void main() {
    vec2 uv = vUV.st;
    vec2 res = vec2(textureSize(sTD2DInputs[0], 0));
    vec2 p = uv * 2.0 - 1.0;
    p.x *= res.x / max(res.y, 1.0);
    float globalScale = max(uExtra.x, 0.1);
    if (globalScale < 0.05) globalScale = 1.0;
    p *= globalScale;

    float t = uAnim.x * uAnim.y;
    float complexity = clamp(uControl.x, 1.0, 5.0);
    float sharpness = clamp(uControl.y, 0.0, 1.0);
    float bands = max(uControl.z, 2.0);
    float erosion = clamp(uControl.w, 0.0, 1.0);
    int paletteIdx = int(floor(uColor.x + 0.01));
    float sat = max(uColor.y, 0.0);
    float bright = max(uColor.z, 0.0);
    float contrast = max(uColor.w, 0.5);
    float flow = max(uAnim.z, 0.0);
    float turbulence = max(uAnim.w, 0.0);
    float audioBass = uAudio.x;
    float audioAll = uAudio.w;

    // scale and flow
    vec2 sp = p * (1.5 + turbulence * 0.5);
    sp += vec2(sin(t * 0.07), cos(t * 0.05)) * flow * 0.3;

    // audio modulation of scale
    sp *= 1.0 + audioBass * 0.15;

    // optional image displacement
    vec3 imgSample = texture(sTD2DInputs[0], uv).rgb;
    float imgLuma = dot(imgSample, vec3(0.2126, 0.7152, 0.0722));
    if (imgLuma > 0.01) {
        sp += (imgSample.rg - 0.5) * 0.5;
    }

    // compute warped field
    float field = warpedPattern(sp, t, complexity);

    // secondary field for depth/layering
    float field2 = warpedPattern(sp * 1.3 + vec2(3.7, 1.2), t * 0.7, max(complexity - 1.0, 1.0));

    // banding — create color bands from field value
    float banded = field * bands;
    float bandFrac = fract(banded);
    float bandLine = 1.0 - smoothstep(0.02, mix(0.15, 0.03, sharpness), min(bandFrac, 1.0 - bandFrac));

    // erosion boundary sharpening
    float erosionField = smoothstep(0.5 - erosion * 0.3, 0.5 + erosion * 0.3, field);
    float boundary = 1.0 - smoothstep(0.0, mix(0.1, 0.02, sharpness), abs(field - 0.5));

    // color mapping
    float colorT = field * 0.7 + field2 * 0.3;
    colorT = (colorT - 0.5) * contrast + 0.5;
    vec3 color = getPalette(paletteIdx, clamp(colorT, 0.0, 1.0));

    // saturation adjustment
    float lum = dot(color, vec3(0.2126, 0.7152, 0.0722));
    color = mix(vec3(lum), color, sat);

    // brightness
    color *= bright;

    // band line glow (bright edges at band boundaries)
    vec3 lineColor = getPalette(paletteIdx, clamp(colorT + 0.15, 0.0, 1.0)) * 1.5;
    color = mix(color, lineColor, bandLine * 0.6);

    // erosion boundary glow
    vec3 boundaryColor = vec3(0.9, 0.6, 0.3);
    color += boundaryColor * boundary * erosion * 0.8;

    // dark silhouette regions
    float silhouette = smoothstep(0.3, 0.5, abs(field - 0.45));
    color *= mix(0.15, 1.0, silhouette * (1.0 - erosion * 0.5) + erosion * 0.5);

    // subtle vignette
    float vig = 1.0 - dot(p * 0.5, p * 0.5) * 0.3;
    color *= vig;

    // image blending
    if (imgLuma > 0.01) {
        color = mix(color, color * imgSample * 2.0, 0.25);
    }

    // audio brightness
    color *= 1.0 + audioAll * 0.4;

    fragColor = TDOutputSwizzle(vec4(clamp(color, 0.0, 1.0), 1.0));
}
