// ALIEN BLOOM - Procedural bioluminescent organism generator
// Creates organic flower/coral forms with glowing edges on deep black
// Ref: orchid with electric green glow, deep-sea coral with cyan/magenta
//
// Inputs: 0=optional image (color/modulation source)
// vec0 uControl: x=petalCount(3-24), y=layers(1-8), z=bloom(0-20), w=symmetry(0-1)
// vec1 uColor:   x=hueBase(0-360), y=saturation(0-5), z=glowPower(0.5-10), w=edgeWidth(0-14, higher=wider)
// vec2 uAnim:    x=time(absTime), y=speed(0.1-3), z=breathe(0-2), w=warp(0-5)
// vec3 uAudio:   x=bass, y=mid, z=high, w=overall (from Max/MSP CHOPs)
// vec4 uExtra:   x=globalScale(0.1-10), y=bloomRadius(0-30)

out vec4 fragColor;

uniform vec4 uControl;
uniform vec4 uColor;
uniform vec4 uAnim;
uniform vec4 uAudio;
uniform vec4 uExtra;

// ---- noise ----
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

// ---- voronoi for cellular texture ----
vec2 voronoi(vec2 p) {
    vec2 i = floor(p), f = fract(p);
    float minD = 8.0;
    float minD2 = 8.0;
    for (int y = -1; y <= 1; y++) {
        for (int x = -1; x <= 1; x++) {
            vec2 n = vec2(float(x), float(y));
            vec2 pt = vec2(hash(i+n+vec2(0,73)), hash(i+n+vec2(37,0)));
            float d = length(n + pt - f);
            float prev = minD;
            minD = min(minD, d);
            minD2 = min(minD2, max(d, prev));
        }
    }
    return vec2(minD, minD2 - minD);
}

// ---- color ----
vec3 hsv2rgb(vec3 c) {
    vec3 p = abs(fract(c.xxx + vec3(0.0, 2.0/3.0, 1.0/3.0)) * 6.0 - 3.0);
    return c.z * mix(vec3(1.0), clamp(p - 1.0, 0.0, 1.0), c.y);
}

// ---- petal SDF ----
float petalField(vec2 p, float n, float width, float t) {
    float angle = atan(p.y, p.x);
    float r = length(p);
    float petal = cos(angle * n) * 0.5 + 0.5;
    petal = pow(petal, width);
    float wave = sin(angle * n * 3.0 + t * 1.1) * 0.06;
    wave += sin(angle * n * 7.0 - t * 0.6) * 0.02;
    return r - petal * 0.42 - wave;
}

void main() {
    vec2 uv = vUV.st;
    vec2 res = vec2(textureSize(sTD2DInputs[0], 0));
    vec2 p = (uv - 0.5) * 2.0;
    p.x *= res.x / max(res.y, 1.0);
    float globalScale = max(uExtra.x, 0.1);
    if (globalScale < 0.05) globalScale = 1.0;
    p *= globalScale;

    float t = uAnim.x * uAnim.y;
    float petalN = max(uControl.x, 3.0);
    float layerN = clamp(uControl.y, 1.0, 8.0);
    float bloomAmt = max(uControl.z, 0.0);
    float symmetry = clamp(uControl.w, 0.0, 1.0);
    float hueBase = uColor.x / 360.0;
    float sat = max(uColor.y, 0.0);
    float glowPow = max(uColor.z, 0.5);
    float edgeW = max(uColor.w, 0.0);
    float breathe = uAnim.z;
    float warpAmt = max(uAnim.w, 0.0);
    float audioBass = uAudio.x;
    float audioMid = uAudio.y;
    float audioHigh = uAudio.z;
    float audioAll = uAudio.w;
    float bloomRadius = max(uExtra.y, 0.1);

    // Edge width inversion: higher edgeW = wider glow band
    // edgeSharpness controls the exponential decay rate
    float edgeSharpness = 30.0 / max(edgeW, 0.1);

    // breathing animation
    float breath = 1.0 + sin(t * 0.3) * breathe * 0.15;
    p *= breath;

    // audio modulation
    float audioScale = 1.0 + audioAll * 0.2;
    p *= audioScale;

    // domain warping for organic feel
    float n1 = fbm(p * 1.8 + t * 0.07);
    float n2 = fbm(p * 1.8 + vec2(7.7, 3.3) + t * 0.05);
    vec2 wp = p + vec2(n1 - 0.5, n2 - 0.5) * warpAmt * 0.4;

    // accumulate layers
    vec3 color = vec3(0.0);
    float totalGlow = 0.0;

    float layerCount = floor(layerN);
    // Layer 0
    {
        float rot = t * 0.05;
        vec2 lp = vec2(wp.x * cos(rot) - wp.y * sin(rot),
                       wp.x * sin(rot) + wp.y * cos(rot));
        float d = petalField(lp, petalN, 1.5 + audioBass * 0.5, t);
        float edge = exp(-abs(d) * edgeSharpness);
        float fill = smoothstep(0.005, -0.02, d);
        float glow = pow(edge, glowPow);
        vec3 eCol = vec3(0.15, 1.0, 0.45) * glow * 2.5;
        vec3 fCol = hsv2rgb(vec3(hueBase + 0.85, sat * 0.9, 0.7 * fill));
        color += eCol + fCol;
        totalGlow += glow;
    }

    // Layer 1
    if (layerCount >= 2.0) {
        float rot = t * 0.08 + 0.4;
        float s = 1.3 + audioMid * 0.15;
        vec2 lp = wp * s;
        lp = vec2(lp.x * cos(rot) - lp.y * sin(rot),
                  lp.x * sin(rot) + lp.y * cos(rot));
        float d = petalField(lp, petalN + 1.0, 2.0, t * 0.7);
        float edge = exp(-abs(d) * edgeSharpness * 0.8);
        float fill = smoothstep(0.005, -0.02, d);
        float glow = pow(edge, glowPow * 0.8);
        vec3 eCol = vec3(0.9, 0.3, 0.7) * glow * 1.8;
        vec3 fCol = hsv2rgb(vec3(hueBase + 0.05, sat, 0.5 * fill));
        color += eCol + fCol;
        totalGlow += glow * 0.7;
    }

    // Layer 2
    if (layerCount >= 3.0) {
        float rot = -t * 0.03 + 1.2;
        float s = 0.7;
        vec2 lp = wp * s;
        lp = vec2(lp.x * cos(rot) - lp.y * sin(rot),
                  lp.x * sin(rot) + lp.y * cos(rot));
        float d = petalField(lp, petalN - 1.0, 1.0, t * 1.3);
        float edge = exp(-abs(d) * edgeSharpness * 0.72);
        float fill = smoothstep(0.005, -0.02, d);
        float glow = pow(edge, glowPow * 1.2);
        vec3 eCol = vec3(0.2, 0.85, 0.9) * glow * 2.0;
        vec3 fCol = hsv2rgb(vec3(hueBase + 0.7, sat * 0.7, 0.6 * fill));
        color += eCol + fCol;
        totalGlow += glow * 0.5;
    }

    // Layer 3 - fine cellular texture (coral polyps)
    if (layerCount >= 4.0) {
        vec2 vor = voronoi(wp * 6.0 + t * 0.15);
        float cellEdge = smoothstep(0.05, 0.0, vor.y);
        float cellGlow = exp(-vor.x * 8.0);
        color += vec3(0.3, 0.9, 0.8) * cellEdge * 0.6;
        color += vec3(1.0, 0.5, 0.8) * cellGlow * 0.3;
    }

    // Layer 4 - inner stigma/stamen glow
    if (layerCount >= 5.0) {
        float r = length(wp);
        float stigma = exp(-r * r * 12.0);
        float pulseStigma = 0.8 + 0.2 * sin(t * 2.0 + audioHigh * 6.28);
        vec3 stigmaColor = vec3(1.0, 0.9, 0.4) * stigma * pulseStigma * 1.5;
        color += stigmaColor;
    }

    // Layer 5 - outer fractal tendrils
    if (layerCount >= 6.0) {
        float rot = t * 0.02 + 2.0;
        vec2 lp = wp * 0.5;
        lp = vec2(lp.x * cos(rot) - lp.y * sin(rot),
                  lp.x * sin(rot) + lp.y * cos(rot));
        float d = petalField(lp, petalN * 2.0, 0.8, t * 0.4);
        float edge = exp(-abs(d) * edgeSharpness * 0.5);
        float glow = pow(edge, glowPow * 0.6);
        color += vec3(0.6, 0.2, 0.9) * glow * 1.2;
        totalGlow += glow * 0.3;
    }

    // Layer 6 - micro spore ring
    if (layerCount >= 7.0) {
        float r = length(wp);
        float ring = exp(-pow(r - 0.55, 2.0) * 60.0);
        float ringPulse = 0.7 + 0.3 * sin(atan(wp.y, wp.x) * petalN * 2.0 + t * 1.5);
        color += vec3(0.4, 1.0, 0.6) * ring * ringPulse * 0.8;
    }

    // Layer 7 - outer halo
    if (layerCount >= 8.0) {
        float r = length(wp);
        float halo = exp(-pow(r - 0.75, 2.0) * 30.0);
        vec3 haloColor = hsv2rgb(vec3(hueBase + 0.3, sat * 0.5, 0.6));
        color += haloColor * halo * 0.6;
    }

    // center radial glow
    float centerDist = length(wp);
    color += vec3(0.8, 0.2, 0.5) * exp(-centerDist * 3.5) * 0.35;
    color += vec3(1.0, 0.95, 0.7) * exp(-centerDist * centerDist * 20.0) * 0.2;

    // background spore particles
    float spore = fbm(uv * 30.0 + t * 0.3);
    spore = pow(spore, 6.0) * 0.15;
    color += vec3(0.2, 0.6, 0.5) * spore;

    // bloom: glow amplification + radius-based spread
    float bloomSpread = bloomRadius * 0.03;
    vec3 bloomColor = color;
    // Sample neighbors for bloom spread (poor-man's blur kernel)
    bloomColor += texture(sTD2DInputs[0], uv + vec2(bloomSpread, 0.0)).rgb * 0.1;
    bloomColor += texture(sTD2DInputs[0], uv - vec2(bloomSpread, 0.0)).rgb * 0.1;
    bloomColor += texture(sTD2DInputs[0], uv + vec2(0.0, bloomSpread)).rgb * 0.1;
    bloomColor += texture(sTD2DInputs[0], uv - vec2(0.0, bloomSpread)).rgb * 0.1;

    // Bloom amplification driven by totalGlow and bloomAmt
    color += color * bloomAmt * 0.15 * (1.0 + totalGlow);
    // Bloom radius adds soft glow spread
    color += bloomColor * bloomAmt * bloomSpread * 0.5;

    // optional image modulation
    vec3 imgSample = texture(sTD2DInputs[0], uv).rgb;
    float imgLuma = dot(imgSample, vec3(0.2126, 0.7152, 0.0722));
    if (imgLuma > 0.01) {
        color = mix(color, color * imgSample * 2.5, 0.3);
    }

    // audio overall brightness
    color *= 1.0 + audioAll * 0.5;

    fragColor = TDOutputSwizzle(vec4(clamp(color, 0.0, 1.0), 1.0));
}
