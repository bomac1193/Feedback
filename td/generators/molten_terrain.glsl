// MOLTEN TERRAIN - Volcanic organic texture generator
// Creates ember glow through dark cracks, lava-like flowing textures
// Ref: orange/ember through dark organic cracks, volcanic surfaces
//
// Inputs: 0=optional image (height/color source)
// vec0 uControl: x=crackScale(2-15), y=heatIntensity(0-3), z=crackDepth(0-1), w=flowRate(0-2)
// vec1 uColor:   x=heatHue(0-60), y=coolHue(200-300), z=emissive(0-3), w=smokeDensity(0-1)
// vec2 uAnim:    x=time(absTime), y=speed(0.1-3), z=pulse(0-1), w=turbulence(0-2)
// vec3 uAudio:   x=bass, y=mid, z=high, w=overall
// vec4 uExtra:   x=globalScale(0.1-10)

out vec4 fragColor;

uniform vec4 uControl;
uniform vec4 uColor;
uniform vec4 uAnim;
uniform vec4 uAudio;
uniform vec4 uExtra;

float hash(vec2 p) {
    vec3 p3 = fract(vec3(p.xyx) * vec3(0.1031, 0.1030, 0.0973));
    p3 += dot(p3, p3.yzx + 33.33);
    return fract((p3.x + p3.y) * p3.z);
}

float vnoise(vec2 p) {
    vec2 i = floor(p), f = fract(p);
    f = f * f * f * (f * (f * 6.0 - 15.0) + 10.0);
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

float fbm6(vec2 p) {
    float v = 0.0;
    v += vnoise(p) * 0.5;    p *= 2.01;
    v += vnoise(p) * 0.25;   p *= 2.02;
    v += vnoise(p) * 0.125;  p *= 2.03;
    v += vnoise(p) * 0.0625; p *= 2.01;
    v += vnoise(p) * 0.03125; p *= 1.98;
    v += vnoise(p) * 0.015625;
    return v;
}

// Voronoi cracks
vec3 voronoi(vec2 p) {
    vec2 i = floor(p), f = fract(p);
    float minD = 8.0, minD2 = 8.0;
    vec2 minPt = vec2(0.0);
    for (int y = -1; y <= 1; y++) {
        for (int x = -1; x <= 1; x++) {
            vec2 n = vec2(float(x), float(y));
            vec2 pt = vec2(hash(i+n+vec2(0,73)), hash(i+n+vec2(37,0)));
            float d = length(n + pt - f);
            float prev = minD;
            minD = min(minD, d);
            minD2 = min(minD2, max(d, prev));
            minPt = (d < prev) ? i + n : minPt;
        }
    }
    return vec3(minD, minD2 - minD, hash(minPt));
}

// Heat color ramp: black → deep red → orange → yellow → white
vec3 heatRamp(float t, float heatHue) {
    float h = heatHue / 360.0;
    vec3 black = vec3(0.0);
    vec3 deepRed = vec3(0.5, 0.02, 0.0);
    vec3 orange = vec3(1.0, 0.45, 0.05);
    vec3 yellow = vec3(1.0, 0.85, 0.3);
    vec3 white = vec3(1.0, 0.95, 0.85);

    // Rotate hue slightly based on heatHue param
    float hShift = (heatHue - 20.0) / 360.0;
    deepRed.rg = vec2(deepRed.r * cos(hShift * 6.28) - deepRed.g * sin(hShift * 6.28),
                      deepRed.r * sin(hShift * 6.28) + deepRed.g * cos(hShift * 6.28));

    vec3 c = mix(black, deepRed, smoothstep(0.0, 0.2, t));
    c = mix(c, orange, smoothstep(0.2, 0.45, t));
    c = mix(c, yellow, smoothstep(0.45, 0.7, t));
    c = mix(c, white, smoothstep(0.7, 1.0, t));
    return c;
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
    float crackScale = max(uControl.x, 3.0);
    float heatInt = max(uControl.y, 0.0);
    float crackDepth = clamp(uControl.z, 0.0, 1.0);
    float flowRate = max(uControl.w, 0.0);
    float heatHue = uColor.x;
    float coolHue = uColor.y;
    float emissive = max(uColor.z, 0.0);
    float smokeDensity = clamp(uColor.w, 0.0, 1.0);
    float pulse = clamp(uAnim.z, 0.0, 1.0);
    float turbulence = max(uAnim.w, 0.0);
    float audioBass = uAudio.x;
    float audioMid = uAudio.y;
    float audioAll = uAudio.w;

    // organic flow distortion
    float fw1 = fbm(p * 1.5 + t * 0.06 * flowRate);
    float fw2 = fbm(p * 1.5 + vec2(7, 3) + t * 0.05 * flowRate);
    vec2 wp = p + vec2(fw1, fw2) * turbulence * 0.3;

    // audio modulation
    wp += vec2(audioBass * 0.05, audioMid * 0.03);

    // voronoi crack network
    vec3 vor = voronoi(wp * crackScale);
    float crackDist = vor.x;     // distance to nearest cell center
    float crackEdge = vor.y;     // distance between edges (crack width)
    float cellId = vor.z;        // cell identity

    // second scale of cracks (finer detail)
    vec3 vor2 = voronoi(wp * crackScale * 2.5 + t * 0.04);
    float fineCrack = vor2.y;

    // terrain height from noise
    float terrain = fbm6(wp * 2.0 + t * 0.02);

    // optional image as height source
    vec3 imgSample = texture(sTD2DInputs[0], uv).rgb;
    float imgLuma = dot(imgSample, vec3(0.2126, 0.7152, 0.0722));
    if (imgLuma > 0.01) {
        terrain = mix(terrain, imgLuma, 0.5);
    }

    // heat value: combination of terrain height and cell position
    float heat = terrain * 0.6 + (1.0 - crackDist) * 0.4;
    heat = pow(heat, mix(1.0, 0.5, heatInt / 3.0));

    // crack darkness (cracks are dark fissures) — wider smoothstep for anti-aliasing
    float isCrack = smoothstep(mix(0.15, 0.06, crackDepth), 0.005, crackEdge);
    float isFineCrack = smoothstep(0.10, 0.005, fineCrack);
    float totalCrack = max(isCrack, isFineCrack * 0.6);

    // pulsing heat animation
    float pulseVal = 1.0 + sin(t * 1.5 + cellId * 6.28) * pulse * 0.3;
    pulseVal += audioBass * 0.2;
    heat *= pulseVal;

    // color from heat ramp
    vec3 color = heatRamp(clamp(heat * heatInt, 0.0, 1.0), heatHue);

    // emissive glow in hot areas
    color += color * emissive * pow(heat, 2.0) * 0.5;

    // crack darkness
    vec3 crackColor = vec3(0.01, 0.005, 0.005);
    color = mix(color, crackColor, totalCrack * crackDepth);

    // ember glow at crack edges (lava visible through cracks)
    float crackGlow = smoothstep(0.0, 0.1, crackEdge) * (1.0 - smoothstep(0.1, 0.2, crackEdge));
    vec3 lavaGlow = heatRamp(0.6 + cellId * 0.3, heatHue) * 1.5;
    color += lavaGlow * crackGlow * crackDepth * (1.0 + audioBass * 1.5);

    // cool regions (dark blue/purple in shadows)
    float coolMask = smoothstep(0.3, 0.0, heat);
    vec3 coolColor;
    float ch = coolHue / 360.0;
    coolColor = vec3(0.03, 0.01, 0.05) + vec3(
        0.05 * sin(ch * 6.28),
        0.03 * cos(ch * 6.28),
        0.08 * sin(ch * 6.28 + 1.0)
    );
    color = mix(color, coolColor, coolMask);

    // smoke/haze in dark areas
    if (smokeDensity > 0.001) {
        float smoke = fbm(wp * 3.0 + t * 0.15);
        smoke = pow(smoke, 2.0);
        vec3 smokeColor = vec3(0.08, 0.05, 0.03);
        color = mix(color, smokeColor, smoke * smokeDensity * (1.0 - heat));
    }

    // image color blending
    if (imgLuma > 0.01) {
        color = mix(color, color * imgSample * 2.0, 0.2);
    }

    // subtle vignette
    float vig = 1.0 - dot(p * 0.4, p * 0.4) * 0.2;
    color *= vig;

    // audio brightness
    color *= 1.0 + audioAll * 0.3;

    fragColor = TDOutputSwizzle(vec4(clamp(color, 0.0, 1.0), 1.0));
}
