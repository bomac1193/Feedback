// Alien Depth Shader - 6 modes inspired by bioluminescent/chemical/molten aesthetics
// Modes: 0=Bioluminescent Flora, 1=Chemical Decay, 2=Deep Coral,
//        3=Erosion Map, 4=Liquid Chrome, 5=Molten Organic

out vec4 fragColor;

// Existing uniforms
uniform vec4 uFx1;        // x=driftAmt, y=driftSpd, z=fog, w=chroma
uniform vec4 uFx2;        // x=feedback, y=bloom, z=fxEnabled, w=bypass
uniform vec4 uTimeData;   // x=time, y=edgeGuard, z=edgePad, w=bloomSize
uniform vec4 uBloomData;  // x=threshold, y=blur, z=shape
uniform vec4 uDofData;    // x=dofOn, y=focusDepth, z=focusRange, w=dofBlur
uniform vec4 uBloomTint;  // rgb tint
uniform vec4 uGradeData;  // x=hueShift, y=sat, z=contrast

// Alien uniforms
uniform vec4 uAlienMode;  // x=mode(0-5), y=intensity(0-1), z=edgeGlow(0-5), w=distort(0-1)
uniform vec4 uAlienColor; // x=hueRotate(deg), y=edgeWidth(1-10), z=glowPower(0.5-5), w=depthContrast(0-1)
uniform vec4 uAlienAnim;  // x=pulseSpd, y=flowSpd, z=organicScale(0.5-8), w=colorCycleSpd

const vec2 kCircle[8] = vec2[](
    vec2(1.0, 0.0), vec2(0.7071, 0.7071),
    vec2(0.0, 1.0), vec2(-0.7071, 0.7071),
    vec2(-1.0, 0.0), vec2(-0.7071, -0.7071),
    vec2(0.0, -1.0), vec2(0.7071, -0.7071)
);

vec2 safeUV(vec2 uv) { return clamp(uv, vec2(0.001), vec2(0.999)); }
float luma(vec3 c) { return dot(c, vec3(0.2126, 0.7152, 0.0722)); }

// =========== NOISE ===========
float hash21(vec2 p) {
    p = fract(p * vec2(123.34, 456.21));
    p += dot(p, p + 45.32);
    return fract(p.x * p.y);
}

float vnoise(vec2 p) {
    vec2 i = floor(p), f = fract(p);
    f = f * f * (3.0 - 2.0 * f);
    return mix(mix(hash21(i), hash21(i + vec2(1,0)), f.x),
               mix(hash21(i + vec2(0,1)), hash21(i + vec2(1,1)), f.x), f.y);
}

float fbm4(vec2 p) {
    float v = 0.0, a = 0.5;
    v += vnoise(p) * a; a *= 0.5; p *= 2.01;
    v += vnoise(p) * a; a *= 0.5; p *= 2.02;
    v += vnoise(p) * a; a *= 0.5; p *= 2.03;
    v += vnoise(p) * a;
    return v;
}

// =========== DEPTH TOOLS ===========
float sobelEdge(vec2 uv, vec2 px, float s) {
    float tl=texture(sTD2DInputs[1],safeUV(uv+vec2(-px.x,px.y)*s)).r;
    float tc=texture(sTD2DInputs[1],safeUV(uv+vec2(0,px.y)*s)).r;
    float tr=texture(sTD2DInputs[1],safeUV(uv+vec2(px.x,px.y)*s)).r;
    float ml=texture(sTD2DInputs[1],safeUV(uv+vec2(-px.x,0)*s)).r;
    float mr=texture(sTD2DInputs[1],safeUV(uv+vec2(px.x,0)*s)).r;
    float bl=texture(sTD2DInputs[1],safeUV(uv+vec2(-px.x,-px.y)*s)).r;
    float bc=texture(sTD2DInputs[1],safeUV(uv+vec2(0,-px.y)*s)).r;
    float br=texture(sTD2DInputs[1],safeUV(uv+vec2(px.x,-px.y)*s)).r;
    float gx = -tl - 2.0*ml - bl + tr + 2.0*mr + br;
    float gy = -tl - 2.0*tc - tr + bl + 2.0*bc + br;
    return sqrt(gx*gx + gy*gy);
}

vec2 depthGrad(vec2 uv, vec2 px) {
    float l=texture(sTD2DInputs[1],safeUV(uv-vec2(px.x,0))).r;
    float r=texture(sTD2DInputs[1],safeUV(uv+vec2(px.x,0))).r;
    float d=texture(sTD2DInputs[1],safeUV(uv-vec2(0,px.y))).r;
    float u=texture(sTD2DInputs[1],safeUV(uv+vec2(0,px.y))).r;
    return vec2(r-l, u-d);
}

// =========== COLOR UTILS ===========
vec3 rgb2hsv(vec3 c) {
    vec4 K=vec4(0,-1.0/3.0,2.0/3.0,-1);
    vec4 p=mix(vec4(c.bg,K.wz),vec4(c.gb,K.xy),step(c.b,c.g));
    vec4 q=mix(vec4(p.xyw,c.r),vec4(c.r,p.yzx),step(p.x,c.r));
    float d=q.x-min(q.w,q.y), e=1e-10;
    return vec3(abs(q.z+(q.w-q.y)/(6.0*d+e)), d/(q.x+e), q.x);
}

vec3 hsv2rgb(vec3 c) {
    vec3 p=abs(fract(c.xxx+vec3(0,2.0/3.0,1.0/3.0))*6.0-3.0);
    return c.z*mix(vec3(1),clamp(p-1.0,0.0,1.0),c.y);
}

// =========== ALIEN MODE 0: BIOLUMINESCENT FLORA ===========
// Ref: orchid with electric green edge glow, magenta/pink forms on black
vec3 modeBioFlora(float d, float e1, float e2, vec3 src, float t) {
    vec3 edgeGlow = vec3(0.15, 1.0, 0.45) * pow(e1, 0.7) * 3.0;
    vec3 edgeWarm = vec3(1.0, 0.85, 0.2) * pow(e2, 0.9) * 1.2;
    vec3 interior = src * vec3(1.2, 0.5, 0.85);
    float pulse = 0.85 + 0.15 * sin(t * 1.5 + d * 6.28);
    float mask = smoothstep(0.02, 0.35, d);
    vec3 deep = vec3(0.01, 0.005, 0.02);
    vec3 result = mix(deep, interior * pulse, mask);
    result += edgeGlow + edgeWarm;
    result += vec3(0.7, 0.15, 0.4) * (1.0 - d) * mask * 0.15;
    return result;
}

// =========== ALIEN MODE 1: CHEMICAL DECAY ===========
// Ref: psychedelic fluid silhouette, magenta/green/orange/black film decay
vec3 modeChemDecay(float d, float e1, vec3 src, float t, vec2 uv) {
    float chem = d + fbm4(uv * 4.0 + t * 0.1) * 0.25;
    chem = clamp(chem, 0.0, 1.0);
    vec3 hot = vec3(1.0, 0.4, 0.1);
    vec3 mid = vec3(0.8, 0.0, 0.6);
    vec3 cool = vec3(0.1, 0.7, 0.3);
    vec3 dark = vec3(0.0);
    float band = fract(chem * 3.0 + t * 0.05);
    vec3 color = mix(dark, cool, smoothstep(0.0, 0.25, band));
    color = mix(color, mid, smoothstep(0.25, 0.5, band));
    color = mix(color, hot, smoothstep(0.5, 0.75, band));
    color = mix(color, dark, smoothstep(0.75, 1.0, band));
    color += vec3(1.0, 0.6, 0.2) * e1 * 1.5;
    float sil = smoothstep(0.3, 0.5, abs(chem - 0.5));
    color *= (0.3 + 0.7 * sil);
    color += src * vec3(0.3, 0.1, 0.2) * (1.0 - d) * 0.15;
    return color;
}

// =========== ALIEN MODE 2: DEEP CORAL ===========
// Ref: ruffled bioluminescent coral, cyan-teal edges, red/pink interior on black
vec3 modeDeepCoral(float d, float e1, float e2, vec3 src, float t) {
    vec3 edgeCyan = vec3(0.2, 0.95, 0.85) * pow(e1, 0.6) * 3.5;
    vec3 interior = vec3(0.9, 0.2, 0.25) * d * 0.8;
    interior += vec3(1.0, 0.6, 0.7) * pow(d, 2.0) * 0.6;
    vec3 ruffled = vec3(0.3, 0.8, 0.7) * e2 * 2.0;
    ruffled += vec3(0.9, 0.3, 0.5) * pow(e2, 2.0) * 1.5;
    vec3 translucent = src * vec3(0.9, 0.5, 0.55) * 0.35;
    float mask = smoothstep(0.03, 0.2, d);
    vec3 result = mix(vec3(0.005, 0.005, 0.01), interior + translucent, mask);
    result += edgeCyan + ruffled;
    float sss = pow(max(d - 0.3, 0.0) / 0.7, 1.5);
    result += vec3(1.0, 0.4, 0.5) * sss * 0.2;
    float pulse = 0.9 + 0.1 * sin(t * 0.8 + d * 12.0);
    result *= pulse;
    return result;
}

// =========== ALIEN MODE 3: EROSION MAP ===========
// Ref: sharp organic coastline boundaries, teal/green vs dark red/black
vec3 modeErosion(float d, float e1, vec3 src, float t, vec2 uv) {
    float contours = fract(d * 12.0);
    float line = 1.0 - smoothstep(0.02, 0.06, min(contours, 1.0 - contours));
    vec3 lit = vec3(0.15, 0.55, 0.45);
    vec3 shadow = vec3(0.08, 0.02, 0.01);
    vec3 green = vec3(0.3, 0.6, 0.2);
    float split = 0.45 + fbm4(uv * 2.0 + t * 0.02) * 0.15;
    vec3 region = mix(shadow, lit, smoothstep(split - 0.05, split + 0.05, d));
    region = mix(region, green, smoothstep(0.3, 0.6, d) * (1.0 - smoothstep(0.6, 0.8, d)));
    vec3 burn = vec3(0.6, 0.3, 0.1) * e1 * 2.0;
    float splitEdge = 1.0 - smoothstep(0.0, 0.08, abs(d - split));
    vec3 splitGlow = vec3(0.8, 0.5, 0.2) * splitEdge * 1.5;
    vec3 contourC = vec3(0.4, 0.7, 0.6) * line * 0.3;
    return region + burn + splitGlow + contourC;
}

// =========== ALIEN MODE 4: LIQUID CHROME ===========
// Ref: metallic chromatic aberration, bronze/teal/blue vertical smearing
vec3 modeLiquidChrome(float d, float e1, vec3 src, float t, vec2 uv, vec2 px) {
    float srcLuma = luma(src);
    vec2 grad = depthGrad(uv, px);
    float gradMag = length(grad);
    vec2 splitDir = vec2(grad.x, grad.y) / max(gradMag, 0.001);
    splitDir = mix(vec2(0.0, 1.0), splitDir, clamp(gradMag * 50.0, 0.0, 1.0));
    float split = gradMag * 18.0;
    float cr = texture(sTD2DInputs[0], safeUV(uv + splitDir * px * split)).r;
    float cg = src.g;
    float cb = texture(sTD2DInputs[0], safeUV(uv - splitDir * px * split)).b;
    vec3 chrome = vec3(cr, cg, cb);
    vec3 bronze = vec3(0.55, 0.38, 0.2);
    vec3 teal = vec3(0.15, 0.45, 0.55);
    vec3 steel = vec3(0.25, 0.28, 0.35);
    float md = d * 0.7 + srcLuma * 0.3;
    vec3 tint = mix(steel, bronze, smoothstep(0.3, 0.7, md));
    tint = mix(tint, teal, smoothstep(0.1, 0.4, 1.0 - md) * 0.6);
    chrome *= 0.4 + 0.6 * tint / max(luma(tint), 0.01);
    float smear = (1.0 - d) * 0.5;
    vec3 sm = chrome;
    sm += texture(sTD2DInputs[0], safeUV(uv + vec2(0, px.y * 3.0 * smear))).rgb * 0.3;
    sm += texture(sTD2DInputs[0], safeUV(uv - vec2(0, px.y * 6.0 * smear))).rgb * 0.2;
    chrome = mix(chrome, sm / 1.5, 0.5);
    chrome += vec3(0.5, 0.6, 0.8) * pow(e1, 1.2) * 1.5;
    float fringe = sin(d * 40.0 + t * 0.5) * 0.03;
    chrome += vec3(fringe, -fringe * 0.5, fringe * 0.7);
    return chrome;
}

// =========== ALIEN MODE 5: MOLTEN ORGANIC ===========
// Ref: orange/ember glow through dark cracks, volcanic texture
vec3 modeMolten(float d, float e1, vec3 src, float t, vec2 uv) {
    float crack = pow(e1, 0.5);
    float heat = pow(d, 1.5);
    vec3 ember = vec3(1.0, 0.45, 0.05) * heat;
    ember += vec3(1.0, 0.7, 0.2) * pow(heat, 3.0) * 0.5;
    float organic = fbm4(uv * 6.0 + t * 0.08);
    float crackMask = smoothstep(0.15, 0.45, crack * (0.7 + organic * 0.6));
    vec3 result = mix(ember, vec3(0.01, 0.005, 0.005), crackMask);
    float srcHeat = luma(src);
    result += vec3(0.9, 0.35, 0.05) * pow(srcHeat, 2.0) * d * 0.4;
    float cooled = smoothstep(0.0, 0.15, d);
    result = mix(vec3(0.03, 0.01, 0.04), result, cooled);
    result += vec3(0.08, 0.04, 0.02) * (1.0 - d) * organic * 0.3;
    float pulse = 0.9 + 0.1 * sin(t * 2.0 + organic * 6.28);
    result *= pulse;
    return result;
}

// =========== EXISTING POST-FX HELPERS ===========
vec3 thresholdedColor(vec2 uv, float thresh) {
    return max(texture(sTD2DInputs[0], safeUV(uv)).rgb - vec3(thresh), vec3(0.0));
}

vec3 circularBlur(vec2 uv, vec2 invR, float rad) {
    float r = max(rad, 0.001);
    vec2 step_ = invR * r;
    vec3 acc = texture(sTD2DInputs[0], safeUV(uv)).rgb * 0.22;
    float tot = 0.22;
    for (int i = 0; i < 8; ++i) {
        vec2 dir = kCircle[i] * step_;
        acc += texture(sTD2DInputs[0], safeUV(uv + dir * 0.35)).rgb * 0.44;
        acc += texture(sTD2DInputs[0], safeUV(uv + dir * 0.78)).rgb * 0.82;
        acc += texture(sTD2DInputs[0], safeUV(uv + dir * 1.2)).rgb * 0.52;
        tot += 1.78;
    }
    return acc / max(tot, 0.001);
}

float bilateralDepth(vec2 uv, vec2 invR, float rad) {
    float cen = texture(sTD2DInputs[1], safeUV(uv)).r;
    vec2 step_ = invR * max(rad, 0.85);
    float rk = mix(16.0, 40.0, clamp(rad / 8.0, 0.0, 1.0));
    float acc = cen * 0.34, tot = 0.34;
    for (int i = 0; i < 8; ++i) {
        vec2 dir = kCircle[i] * step_;
        float dA = texture(sTD2DInputs[1], safeUV(uv + dir * 0.55)).r;
        float wA = 0.14 * exp(-abs(dA - cen) * rk);
        acc += dA * wA; tot += wA;
        float dB = texture(sTD2DInputs[1], safeUV(uv + dir * 1.15)).r;
        float wB = 0.07 * exp(-abs(dB - cen) * (rk * 1.2));
        acc += dB * wB; tot += wB;
    }
    return acc / max(tot, 0.001);
}

float focusMask(vec2 uv, vec2 invR, float focD, float fIn, float fOut, float rad) {
    float cd = bilateralDepth(uv, invR, rad);
    float cl = luma(texture(sTD2DInputs[0], safeUV(uv)).rgb);
    float cm = smoothstep(fIn, fOut, abs(cd - focD)) * 0.44;
    float tot = 0.44;
    float cs = max(rad * 0.6, 0.75);
    vec2 step_ = invR * cs;
    for (int i = 0; i < 4; ++i) {
        vec2 dir = kCircle[i * 2] * step_;
        vec2 sUV = uv + dir;
        float nd = bilateralDepth(sUV, invR, rad * 0.8);
        float nm = smoothstep(fIn, fOut, abs(nd - focD));
        float nl = luma(texture(sTD2DInputs[0], safeUV(sUV)).rgb);
        float ew = exp(-abs(nl - cl) * 18.0) * exp(-abs(nd - cd) * 26.0);
        float w = 0.145 * ew;
        cm += nm * w; tot += w;
    }
    return smoothstep(0.08, 0.94, cm / max(tot, 0.001));
}

vec3 bloomGlow(vec2 uv, vec2 invR, float rad, float thresh, float blur, float shape) {
    float bd = clamp(blur / 8.0, 0.0, 1.0);
    float sd = clamp(shape, 0.0, 1.0);
    float cw = mix(0.54, 0.18, sd) * mix(0.95, 0.72, bd);
    float iw = mix(0.46, 0.32, sd);
    float mw = mix(0.74, 0.92, sd);
    float ow = mix(0.34, 1.05, sd) * mix(0.72, 1.0, bd);
    float is_ = mix(0.2, 0.08, sd);
    float ms = mix(0.62, 0.88, sd);
    float os_ = mix(1.15, 1.6, sd) * mix(1.0, 1.18, bd);
    vec3 glow = thresholdedColor(uv, thresh) * cw;
    float tot = cw;
    for (int i = 0; i < 8; ++i) {
        vec2 dir = kCircle[i] * invR * rad;
        glow += thresholdedColor(uv + dir * is_, thresh) * iw;
        glow += thresholdedColor(uv + dir * ms, thresh) * mw;
        glow += thresholdedColor(uv + dir * os_, thresh) * ow;
        tot += iw + mw + ow;
    }
    return glow / max(tot, 0.001);
}

// =========== MAIN ===========
void main() {
    vec2 uv = vUV.st;
    vec4 base = texture(sTD2DInputs[0], safeUV(uv));
    ivec2 texSize = textureSize(sTD2DInputs[0], 0);
    vec2 invRes = 1.0 / vec2(max(texSize.x, 1), max(texSize.y, 1));
    float depth = texture(sTD2DInputs[1], safeUV(uv)).r;
    float t = uTimeData.x;

    // Alien params
    int alienModeI = int(floor(uAlienMode.x + 0.01));
    float alienInt = clamp(uAlienMode.y, 0.0, 1.0);
    float alienEdge = max(uAlienMode.z, 0.0);
    float alienDist = max(uAlienMode.w, 0.0);
    float alienHue = uAlienColor.x;
    float alienEW = max(uAlienColor.y, 1.0);
    float alienGP = max(uAlienColor.z, 0.5);
    float alienDC = clamp(uAlienColor.w, 0.0, 1.0);
    float alienPS = max(uAlienAnim.x, 0.1);
    float alienFS = uAlienAnim.y;
    float alienOS = max(uAlienAnim.z, 0.5);
    float alienCC = uAlienAnim.w;

    // ===== ALIEN VISUALIZATION =====
    if (alienInt > 0.001) {
        // Remap depth for more contrast
        float d = pow(depth, mix(1.0, 0.5, alienDC));
        d = smoothstep(0.02, 0.98, d);

        // Organic flow distortion
        vec2 dUV = uv;
        if (alienDist > 0.001) {
            float n1 = fbm4(uv * alienOS * 3.0 + t * alienFS * 0.1);
            float n2 = fbm4(uv * alienOS * 3.0 + t * alienFS * 0.1 + vec2(17.3, 31.7));
            dUV = safeUV(uv + vec2(n1 - 0.5, n2 - 0.5) * alienDist * 0.03 * d);
            d = pow(texture(sTD2DInputs[1], dUV).r, mix(1.0, 0.5, alienDC));
            d = smoothstep(0.02, 0.98, d);
        }

        vec3 src = texture(sTD2DInputs[0], dUV).rgb;

        // Multi-scale edges
        float e1 = sobelEdge(dUV, invRes, alienEW);
        float e2 = sobelEdge(dUV, invRes, alienEW * 2.5);
        e1 = pow(clamp(e1 * alienEdge, 0.0, 1.0), 1.0 / alienGP);
        e2 = pow(clamp(e2 * alienEdge * 0.5, 0.0, 1.0), 1.0 / (alienGP * 0.8));

        float at = t * alienPS;
        vec2 auv = dUV * alienOS;

        vec3 alien;
        if (alienModeI <= 0)      alien = modeBioFlora(d, e1, e2, src, at);
        else if (alienModeI == 1) alien = modeChemDecay(d, e1, src, at, auv);
        else if (alienModeI == 2) alien = modeDeepCoral(d, e1, e2, src, at);
        else if (alienModeI == 3) alien = modeErosion(d, e1, src, at, auv);
        else if (alienModeI == 4) alien = modeLiquidChrome(d, e1, src, at, dUV, invRes);
        else                      alien = modeMolten(d, e1, src, at, auv);

        // Hue rotation + color cycling
        if (abs(alienHue) > 0.001 || abs(alienCC) > 0.001) {
            vec3 hsv = rgb2hsv(clamp(alien, 0.0, 1.0));
            hsv.x = fract(hsv.x + alienHue / 360.0 + t * alienCC * 0.01);
            alien = hsv2rgb(hsv);
        }

        base.rgb = mix(base.rgb, alien, alienInt);
    }

    // ===== EXISTING POST-FX =====
    float driftAmount = max(uFx1.x, 0.0);
    float driftSpeed = max(uFx1.y, 0.0001);
    float fogAmount = max(uFx1.z, 0.0);
    float chromaAmount = max(uFx1.w, 0.0);
    float feedbackAmount = max(uFx2.x, 0.0);
    float bloomAmount = max(uFx2.y, 0.0);
    bool fxEnabled = (uFx2.z > 0.5);
    bool bypassMode = (uFx2.w > 0.5);

    float bloomThreshold = clamp(uBloomData.x, 0.0, 1.0);
    float bloomBlur = max(uBloomData.y, 0.0);
    float bloomShape = clamp(uBloomData.z, 0.0, 1.0);
    vec3 bloomTint = max(uBloomTint.rgb, vec3(0.0));
    bool dofEnabled = (uDofData.x > 0.5);
    float focusDepth = clamp(uDofData.y, 0.0, 1.0);
    float focusRange = max(uDofData.z, 0.001);
    float dofBlur = max(uDofData.w, 0.0);
    float hueShift = uGradeData.x / 360.0;
    float saturation = max(uGradeData.y, 0.0);
    float contrast = max(uGradeData.z, 0.0);
    float gradeDrive = max(abs(hueShift), max(abs(saturation - 1.0), abs(contrast - 1.0)));

    if ((!fxEnabled) || bypassMode) {
        fragColor = TDOutputSwizzle(base);
        return;
    }

    float fxDrive = max(max(driftAmount, fogAmount), max(chromaAmount, max(feedbackAmount, bloomAmount)));
    if (max(max(fxDrive, dofEnabled ? dofBlur : 0.0), gradeDrive) <= 0.00001) {
        fragColor = TDOutputSwizzle(base);
        return;
    }

    float edgeGuard = clamp(uTimeData.y, 0.0, 0.45);
    float edgePadding = clamp(uTimeData.z, 0.0, 0.45);
    float bloomSize = max(uTimeData.w, 0.1);
    float borderProtect = clamp(max(edgeGuard, edgePadding * 0.55), 0.0, 0.45);
    float edgeDist = min(min(uv.x, 1.0 - uv.x), min(uv.y, 1.0 - uv.y));
    float fxMask = (borderProtect > 0.0001) ? smoothstep(0.0, borderProtect, edgeDist) : 1.0;
    fxMask *= fxMask;
    float borderBlend = (borderProtect > 0.0001) ? smoothstep(0.0, max(borderProtect * 0.75, 0.001), edgeDist) : 1.0;

    float driftX = sin(t * driftSpeed * 0.9) * 0.8 + sin(t * driftSpeed * 0.37 + 1.7) * 0.2;
    float driftY = (cos(t * driftSpeed * 0.73 + 0.9) * 0.75 + sin(t * driftSpeed * 0.41 + 2.2) * 0.25) * 0.7;
    float ripple = sin(uv.x * float(texSize.x) * 0.015 + uv.y * float(texSize.y) * 0.009 + t * driftSpeed * 1.2) * 0.12;
    float depthMask = (0.15 + 0.85 * depth) * (1.0 + ripple);
    vec2 driftDir = vec2(driftX, driftY);
    vec2 driftedUV = safeUV(uv + driftDir * driftAmount * depthMask * fxMask);

    vec4 warped = texture(sTD2DInputs[0], driftedUV);
    vec3 rgb = warped.rgb;
    float alpha = warped.a;

    // When alien is active, use transformed base for post-fx too
    if (alienInt > 0.001) {
        rgb = mix(warped.rgb, base.rgb, alienInt);
    }

    if (dofEnabled && dofBlur > 0.00001) {
        float sr = mix(1.1, 3.8, clamp(dofBlur / 8.0, 0.0, 1.0));
        float fIn = max(focusRange * 0.45, 0.0015);
        float fOut = max(focusRange * 1.55, fIn + 0.0015);
        float bm = focusMask(driftedUV, invRes, focusDepth, fIn, fOut, sr);
        bm *= bm;
        if (bm > 0.00001) {
            float rA = dofBlur * mix(0.7, 3.6, bm);
            float rB = dofBlur * mix(1.25, 7.2, bm);
            float rC = dofBlur * mix(1.8, 12.0, bm);
            vec3 dA = circularBlur(driftedUV, invRes, rA);
            vec3 dB = circularBlur(driftedUV, invRes, rB);
            vec3 dC = circularBlur(driftedUV, invRes, rC);
            vec3 dofRgb = mix(dA, dB, clamp(bm * 0.55, 0.0, 1.0));
            dofRgb = mix(dofRgb, dC, clamp((bm - 0.28) * 1.2, 0.0, 1.0));
            rgb = mix(rgb, dofRgb, bm * borderBlend);
        }
    }

    if (chromaAmount > 0.00001) {
        vec2 cDir = normalize(driftDir + vec2(0.35 * sin(t * 0.25 + 0.4), 0.35 * cos(t * 0.31 + 1.1)));
        vec2 cShift = cDir * chromaAmount * (0.2 + 0.8 * depth) * fxMask;
        float r = texture(sTD2DInputs[0], safeUV(driftedUV + cShift)).r;
        float b = texture(sTD2DInputs[0], safeUV(driftedUV - cShift)).b;
        rgb = vec3(r, rgb.g, b);
    }

    if (fogAmount > 0.00001) {
        float farM = smoothstep(0.0, 0.72, 1.0 - depth);
        float nearM = smoothstep(0.55, 1.0, depth);
        rgb = mix(rgb, vec3(0.10, 0.34, 0.58), farM * fogAmount * 0.55);
        rgb = clamp(rgb + vec3(1.0, 0.74, 0.42) * nearM * fogAmount * 0.10, 0.0, 1.0);
    }

    if (feedbackAmount > 0.00001) {
        vec3 trail = texture(sTD2DInputs[2], safeUV(uv)).rgb;
        float trailM = 0.15 + 0.85 * depth;
        rgb = clamp(mix(rgb, trail, feedbackAmount * 0.55 * trailM * fxMask), 0.0, 1.0);
    }

    if (bloomAmount > 0.00001) {
        float bd = clamp(bloomAmount / 8.0, 0.0, 1.0);
        float sd = clamp((bloomSize - 0.1) / 29.9, 0.0, 1.0);
        float rA = mix(1.0, 28.0, sd);
        float rB = mix(2.5, 120.0, sd);
        vec3 glow = bloomGlow(driftedUV, invRes, rA, bloomThreshold, bloomBlur, bloomShape) * (0.65 + bd * 0.55);
        glow += bloomGlow(driftedUV, invRes, rB, bloomThreshold, bloomBlur, bloomShape) * (1.1 + bd * 0.9);
        glow *= bloomTint;
        rgb = clamp(rgb + glow * (0.45 + bloomAmount * 0.95) * borderBlend, 0.0, 1.0);
    }

    rgb = mix(base.rgb, rgb, borderBlend);
    alpha = mix(base.a, alpha, borderBlend);

    if (gradeDrive > 0.00001) {
        vec3 graded = clamp(rgb, 0.0, 1.0);
        if (abs(hueShift) > 0.00001) {
            vec3 hsv = rgb2hsv(graded);
            hsv.x = fract(hsv.x + hueShift);
            graded = hsv2rgb(hsv);
        }
        float l = dot(graded, vec3(0.2126, 0.7152, 0.0722));
        graded = mix(vec3(l), graded, saturation);
        graded = (graded - 0.5) * contrast + 0.5;
        rgb = clamp(graded, 0.0, 1.0);
    }

    fragColor = TDOutputSwizzle(vec4(clamp(rgb, 0.0, 1.0), alpha));
}
