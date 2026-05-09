// LIQUID CHROME - Metallic depth material generator
// Treats input image as a height field → derives normals → metallic material
// Creates dramatic chrome/bronze/iridescent surfaces from any depth or image input
// Without input: procedural liquid metal. With input: image becomes the material surface.
//
// Inputs: 0=image (used as height field for normal derivation + color source)
// vec0 uControl: x=cellScale(2-50), y=metallic(0-1), z=iridescence(0-5), w=smear(0-1)
// vec1 uColor:   x=hueShift(0-360), y=warmth(0-1), z=specular(0-8), w=darkness(0-1)
// vec2 uAnim:    x=time(absTime), y=speed(0.1-3), z=flowDir(0=horiz,1=vert), w=ripple(0-5)
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
    v += vnoise(p) * 0.5;   p *= 2.03;
    v += vnoise(p) * 0.25;  p *= 2.01;
    v += vnoise(p) * 0.125; p *= 1.97;
    v += vnoise(p) * 0.0625;
    return v;
}

// Voronoi with cell ID
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
    return vec3(minD, minD2 - minD, hash(minPt + vec2(113, 71)));
}

// Thin-film interference (iridescent color from optical path difference)
vec3 thinFilm(float thickness, float cosAngle) {
    float delta = thickness * cosAngle * 2.0;
    vec3 c;
    c.r = 0.5 + 0.5 * cos(delta * 6.28 + 0.0);
    c.g = 0.5 + 0.5 * cos(delta * 6.28 + 2.09);
    c.b = 0.5 + 0.5 * cos(delta * 6.28 + 4.19);
    return c * c;
}

// Derive surface normal from height field (central differences)
vec3 heightToNormal(vec2 uv, vec2 texel, float strength) {
    float hL = dot(texture(sTD2DInputs[0], uv - vec2(texel.x, 0.0)).rgb, vec3(0.2126, 0.7152, 0.0722));
    float hR = dot(texture(sTD2DInputs[0], uv + vec2(texel.x, 0.0)).rgb, vec3(0.2126, 0.7152, 0.0722));
    float hD = dot(texture(sTD2DInputs[0], uv - vec2(0.0, texel.y)).rgb, vec3(0.2126, 0.7152, 0.0722));
    float hU = dot(texture(sTD2DInputs[0], uv + vec2(0.0, texel.y)).rgb, vec3(0.2126, 0.7152, 0.0722));
    vec3 n = normalize(vec3((hL - hR) * strength, (hD - hU) * strength, 1.0));
    return n;
}

// Fresnel approximation (Schlick)
float fresnel(float cosTheta, float f0) {
    return f0 + (1.0 - f0) * pow(1.0 - cosTheta, 5.0);
}

vec3 hsv2rgb(vec3 c) {
    vec3 p = abs(fract(c.xxx + vec3(0.0, 2.0/3.0, 1.0/3.0)) * 6.0 - 3.0);
    return c.z * mix(vec3(1.0), clamp(p - 1.0, 0.0, 1.0), c.y);
}

void main() {
    vec2 uv = vUV.st;
    vec2 res = vec2(textureSize(sTD2DInputs[0], 0));
    vec2 texel = 1.0 / max(res, vec2(1.0));
    vec2 p = uv * 2.0 - 1.0;
    p.x *= res.x / max(res.y, 1.0);
    float globalScale = max(uExtra.x, 0.1);
    if (globalScale < 0.05) globalScale = 1.0;
    p *= globalScale;

    float t = uAnim.x * uAnim.y;
    float cellScale = max(uControl.x, 2.0);
    float metallic = clamp(uControl.y, 0.0, 1.0);
    float iridescence = max(uControl.z, 0.0);
    float smear = clamp(uControl.w, 0.0, 1.0);
    float hueShift = uColor.x / 360.0;
    float warmth = clamp(uColor.y, 0.0, 1.0);
    float specular = max(uColor.z, 0.0);
    float darkness = clamp(uColor.w, 0.0, 1.0);
    float flowDir = clamp(uAnim.z, 0.0, 1.0);
    float ripple = max(uAnim.w, 0.0);
    float audioBass = uAudio.x;
    float audioMid = uAudio.y;
    float audioHigh = uAudio.z;
    float audioAll = uAudio.w;

    // --- Sample input image ---
    vec3 imgSample = texture(sTD2DInputs[0], uv).rgb;
    float imgLuma = dot(imgSample, vec3(0.2126, 0.7152, 0.0722));
    float hasImage = smoothstep(0.005, 0.02, imgLuma);

    // --- Derive surface normal from image as height field ---
    vec3 surfNormal = heightToNormal(uv, texel, 3.0 + specular * 2.0);

    // --- View direction (simple top-down camera) ---
    vec3 viewDir = normalize(vec3(p * 0.3, 1.0));
    float NdotV = max(dot(surfNormal, viewDir), 0.0);

    // --- Light directions (two-point lighting) ---
    vec3 lightDir1 = normalize(vec3(0.5 + sin(t * 0.1) * 0.3, 0.8, 1.0));
    vec3 lightDir2 = normalize(vec3(-0.7, -0.3, 0.8));
    float NdotL1 = max(dot(surfNormal, lightDir1), 0.0);
    float NdotL2 = max(dot(surfNormal, lightDir2), 0.0);

    // Half vectors for specular
    vec3 H1 = normalize(lightDir1 + viewDir);
    vec3 H2 = normalize(lightDir2 + viewDir);
    float NdotH1 = max(dot(surfNormal, H1), 0.0);
    float NdotH2 = max(dot(surfNormal, H2), 0.0);

    // --- Flow direction ---
    vec2 flowVec = mix(vec2(1.0, 0.0), vec2(0.0, 1.0), flowDir);

    // --- Organic domain warping ---
    float warp1 = fbm(p * 2.0 + t * 0.05 * flowVec);
    float warp2 = fbm(p * 2.0 + vec2(5.0, 3.0) + t * 0.04 * flowVec);
    vec2 wp = p + vec2(warp1, warp2) * 0.2;

    // ripple wave
    wp += flowVec * sin(dot(p, flowVec.yx) * ripple * 8.0 + t * 0.5) * 0.03;

    // audio warp
    wp += flowVec * audioBass * 0.05;

    // --- Voronoi structure ---
    vec3 vor = voronoi(wp * cellScale + t * 0.08 * flowVec);
    float cellDist = vor.x;
    float cellEdge = vor.y;
    float cellId = vor.z;

    // --- Metallic base colors ---
    vec3 bronze = vec3(0.65, 0.45, 0.22);
    vec3 teal = vec3(0.18, 0.52, 0.62);
    vec3 steel = vec3(0.28, 0.30, 0.35);
    vec3 baseColor = mix(steel, mix(teal, bronze, warmth), metallic);

    // --- Height field: combine image depth + procedural voronoi ---
    float height = mix(
        0.3 + cellDist * 0.4 + fbm(wp * 3.0 + t * 0.02) * 0.3,  // procedural
        imgLuma,                                                     // image height
        hasImage * 0.8
    );

    // --- Diffuse lighting ---
    float diffuse = NdotL1 * 0.7 + NdotL2 * 0.3;
    diffuse = mix(0.15, diffuse, hasImage);  // procedural mode gets ambient

    // --- Specular highlights (GGX-like) ---
    float specExp = specular * 20.0 + 4.0;
    float spec1 = pow(NdotH1, specExp) * specular;
    float spec2 = pow(NdotH2, specExp * 0.7) * specular * 0.5;
    float totalSpec = (spec1 + spec2) * (1.0 + audioHigh * 3.0);

    // Procedural specular from voronoi (when no image)
    float procSpec = pow(1.0 - cellDist, specular * 3.0 + 1.0) * specular;
    procSpec += pow(max(1.0 - cellEdge * 4.0, 0.0), 3.0) * specular * 0.5;
    totalSpec = mix(procSpec, totalSpec, hasImage);

    // --- Fresnel rim lighting ---
    float fres = fresnel(NdotV, mix(0.04, 0.6, metallic));
    fres *= mix(0.3, 1.0, hasImage);  // stronger with image normals

    // --- Build material color ---
    vec3 color;

    // Image-based material: image color tinted by metallic base
    vec3 imgMaterial = imgSample * baseColor * 2.0;
    imgMaterial = mix(imgSample, imgMaterial, metallic);

    // Procedural material: voronoi cells
    float baseLum = 0.12 + cellDist * 0.35;
    baseLum = pow(baseLum, mix(1.0, 2.0, darkness));
    vec3 procMaterial = baseColor * baseLum;

    // Blend based on image presence
    color = mix(procMaterial, imgMaterial * diffuse, hasImage);

    // --- Add specular ---
    vec3 specColor = mix(vec3(0.6, 0.7, 0.9), baseColor, metallic * 0.7);
    color += specColor * totalSpec;

    // --- Fresnel rim glow ---
    vec3 rimColor = mix(vec3(0.5, 0.6, 0.8), thinFilm(height * 3.0 + t * 0.05, NdotV), iridescence * 0.3);
    color += rimColor * fres * (0.8 + audioBass * 1.5);

    // --- Iridescent thin-film interference along surface contours ---
    float filmThickness = height * 2.5 + cellId * 1.5 + fbm(wp * 8.0) * 0.4 + t * 0.03;
    float filmAngle = mix(0.5 + 0.5 * (1.0 - cellDist), NdotV, hasImage);
    vec3 irid = thinFilm(filmThickness, filmAngle);
    color = mix(color, irid * (diffuse * 0.5 + 0.5) * 1.5, iridescence * 0.35);

    // --- Iridescent edge contours from depth gradients ---
    float depthEdge = length(surfNormal.xy) * hasImage;
    vec3 contourIrid = thinFilm(depthEdge * 5.0 + t * 0.08, 0.7);
    color += contourIrid * depthEdge * iridescence * 0.6;

    // --- Voronoi cell edge glow (subtle structure) ---
    float edgeGlow = smoothstep(0.08, 0.0, cellEdge);
    vec3 edgeColor = mix(vec3(0.3, 0.5, 0.7), baseColor * 2.0, metallic);
    color += edgeColor * edgeGlow * 0.25 * (1.0 - hasImage * 0.5);

    // --- Smear effect (chromatic streaking along flow) ---
    float smearStr = smear * 0.06 * (0.5 + height * 0.5);
    vec2 smearUV1 = uv + flowVec * smearStr;
    vec2 smearUV2 = uv - flowVec * smearStr * 1.5;
    vec3 s1 = texture(sTD2DInputs[0], clamp(smearUV1, 0.001, 0.999)).rgb;
    vec3 s2 = texture(sTD2DInputs[0], clamp(smearUV2, 0.001, 0.999)).rgb;
    // Chromatic smear: offset R/G/B channels along flow
    vec3 smearColor = vec3(s1.r, mix(s1.g, s2.g, 0.5), s2.b);
    color = mix(color, smearColor * baseColor * 2.5, smear * hasImage);

    // --- Interference fringe detail on surface ---
    float fringe = sin(height * 80.0 + t * 0.3) * 0.025;
    color += vec3(fringe, -fringe * 0.5, fringe * 0.7) * iridescence * (0.5 + hasImage);

    // --- Hue shift ---
    float angle = hueShift * 6.28318;
    float cosA = cos(angle), sinA = sin(angle);
    mat3 hueRot = mat3(
        0.299+0.701*cosA+0.168*sinA, 0.587-0.587*cosA+0.330*sinA, 0.114-0.114*cosA-0.497*sinA,
        0.299-0.299*cosA-0.328*sinA, 0.587+0.413*cosA+0.035*sinA, 0.114-0.114*cosA+0.292*sinA,
        0.299-0.299*cosA+1.250*sinA, 0.587-0.587*cosA-1.050*sinA, 0.114+0.886*cosA-0.203*sinA
    );
    color = hueRot * color;

    // --- Darkness control ---
    color *= mix(1.0, 0.35, darkness);

    // --- Audio brightness ---
    color *= 1.0 + audioAll * 0.35;

    fragColor = TDOutputSwizzle(vec4(clamp(color, 0.0, 1.0), 1.0));
}
