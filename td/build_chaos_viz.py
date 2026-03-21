# ============================================
# FEEDBACK — Chaos Attractor Visualization for Step6
# ============================================
#
# Run in TD Textport or Execute DAT:
#   exec(open('D:/Music/Max Msp/Projects/Feedback/td/build_chaos_viz.py').read())
#
# Builds a chaos attractor trajectory visualization:
#   - GLSL TOP renders bright point at projected XYZ
#   - Trail feedback chain creates persistent trajectory
#   - Bloom post-process
#   - Monochrome (white on black)
#
# OSC from Max step6_chaos_resonator (port 7000):
#   /chaos/x, /chaos/y, /chaos/z  — attractor state
#   /audio/amplitude               — audio level
#   /attractor/type                — 0=Lorenz 1=Rossler 2=Chua 3=Halvorsen 4=Aizawa
#   /chaos/gain                    — chaos intensity
#   /root/freq                     — root frequency
#   /tuning/system                 — tuning system index
#   /resonator/decay               — resonator decay
#   /resonator/drive               — excitation drive
#
# Also works with raw udpsend output:
#   /x, /y, /z, /L                — backward compatible
#
# ============================================

import math

# ============================================
# CONFIGURATION
# ============================================

OSC_PORT = 7000
BASE_PATH = '/project1'
RENDER_RES = (1280, 720)


# ============================================
# HELPERS
# ============================================

def wire(src, dst, src_out=0, dst_in=0):
    src.outputConnectors[src_out].connect(dst.inputConnectors[dst_in])


# ============================================
# GLSL CHAOS ATTRACTOR SHADER
# ============================================

CHAOS_GLSL = '''// Chaos Attractor Point — renders bright point at projected XYZ
// The trail feedback chain handles trajectory persistence

uniform float uChaosX;     // Attractor X state
uniform float uChaosY;     // Attractor Y state
uniform float uChaosZ;     // Attractor Z state
uniform float uAmp;        // Audio amplitude (0-1)
uniform float uAttractor;  // Attractor type (0-4)
uniform float uChaosGain;  // Chaos intensity (0-1)
uniform float uDecay;      // Resonator decay (0-1.5)
uniform float uDrive;      // Excitation drive (0-1)

out vec4 fragColor;

void main()
{
    vec2 uv = vUV.st;
    vec2 res = uTDOutputInfo.res.zw;
    float aspect = res.x / res.y;

    // Normalize attractor coords to screen space
    // Each attractor has different value ranges — auto-scale
    float scale = 0.025;
    int att = int(uAttractor);

    // Attractor-specific scaling (approximate orbit radii)
    if (att == 0) scale = 0.022;       // Lorenz: +-25
    else if (att == 1) scale = 0.035;  // Rossler: +-15
    else if (att == 2) scale = 0.15;   // Chua: +-3
    else if (att == 3) scale = 0.04;   // Halvorsen: +-10
    else if (att == 4) scale = 0.25;   // Aizawa: +-2

    // Project 3D → 2D (simple orthographic with slight Z depth)
    vec2 attPos = vec2(
        uChaosX * scale,
        uChaosY * scale + uChaosZ * scale * 0.15
    );

    // Correct for aspect ratio
    attPos.x /= aspect;

    // Center on screen
    attPos = attPos * 0.5 + 0.5;

    // Distance from current fragment to attractor point
    vec2 fragPos = uv;
    fragPos.x *= aspect;
    vec2 aPos = attPos;
    aPos.x *= aspect;
    float dist = length(fragPos - aPos);

    // Point size scales with amplitude and drive
    float baseSize = 0.003 + uDrive * 0.004;
    float pointSize = baseSize + uAmp * 0.008;

    // Soft gaussian point
    float intensity = exp(-dist * dist / (pointSize * pointSize * 2.0));

    // Core brightness from amplitude
    float brightness = 0.3 + uAmp * 0.7;

    // Glow halo (wider, dimmer)
    float haloSize = pointSize * 4.0;
    float halo = exp(-dist * dist / (haloSize * haloSize * 2.0)) * 0.15;

    // High chaos gain = slight glow boost
    float chaosGlow = uChaosGain * 0.1;

    float total = (intensity * brightness + halo + chaosGlow * intensity) * 1.2;

    // Monochrome: white on black
    vec3 color = vec3(total);

    // Subtle warm tint when decay is high (sustained = warm glow)
    float warmth = clamp(uDecay / 1.5, 0.0, 1.0) * 0.08;
    color.r += warmth * total;
    color.b -= warmth * total * 0.5;

    fragColor = TDOutputSwizzle(vec4(color, 1.0));
}
'''


# ============================================
# BUILD FUNCTION
# ============================================

def build_chaos_viz():
    """
    Build the chaos attractor visualization into /project1.
    Reuses existing trail feedback chain if present.
    """
    container = op(BASE_PATH)
    if container is None:
        print("[ERROR] /project1 not found")
        return

    print("=" * 50)
    print("CHAOS VIZ — Building attractor visualization...")
    print("=" * 50)

    # ========================================
    # 1. OSC INPUT
    # ========================================

    osc = container.op('osc_from_max')
    if osc is None:
        osc = container.create('oscinCHOP', 'osc_from_max')
        osc.par.port = OSC_PORT
        osc.par.active = True
        osc.nodeX = 0
        osc.nodeY = 600
        print(f"[OK] Created OSC In: port {OSC_PORT}")
    else:
        print(f"[OK] Using existing OSC In: {osc.path}")

    # ========================================
    # 2. SELECT CHOPS (extract channels)
    # ========================================

    base_x = -400
    base_y = 400

    # Chaos XYZ — handle both osc_send_step6.js and raw udpsend names
    chaos_sel = container.op('chaos_select')
    if chaos_sel is None:
        chaos_sel = container.create('selectCHOP', 'chaos_select')
    chaos_sel.par.chop = osc.path
    chaos_sel.par.channames = 'chaos/x chaos/y chaos/z x y z'
    chaos_sel.nodeX = base_x
    chaos_sel.nodeY = base_y

    # Amplitude
    amp_sel = container.op('amp_select')
    if amp_sel is None:
        amp_sel = container.create('selectCHOP', 'amp_select')
    amp_sel.par.chop = osc.path
    amp_sel.par.channames = 'audio/amplitude L'
    amp_sel.nodeX = base_x + 200
    amp_sel.nodeY = base_y

    # Attractor type
    att_sel = container.op('attractor_select')
    if att_sel is None:
        att_sel = container.create('selectCHOP', 'attractor_select')
    att_sel.par.chop = osc.path
    att_sel.par.channames = 'attractor/type'
    att_sel.nodeX = base_x + 400
    att_sel.nodeY = base_y

    # Chaos gain
    gain_sel = container.op('gain_select')
    if gain_sel is None:
        gain_sel = container.create('selectCHOP', 'gain_select')
    gain_sel.par.chop = osc.path
    gain_sel.par.channames = 'chaos/gain'
    gain_sel.nodeX = base_x + 600
    gain_sel.nodeY = base_y

    # Decay
    decay_sel = container.op('decay_select')
    if decay_sel is None:
        decay_sel = container.create('selectCHOP', 'decay_select')
    decay_sel.par.chop = osc.path
    decay_sel.par.channames = 'resonator/decay'
    decay_sel.nodeX = base_x + 800
    decay_sel.nodeY = base_y

    # Drive
    drive_sel = container.op('drive_select')
    if drive_sel is None:
        drive_sel = container.create('selectCHOP', 'drive_select')
    drive_sel.par.chop = osc.path
    drive_sel.par.channames = 'resonator/drive'
    drive_sel.nodeX = base_x + 1000
    drive_sel.nodeY = base_y

    print("[OK] Select CHOPs for chaos/amp/attractor/gain/decay/drive")

    # ========================================
    # 3. GLSL TOP — CHAOS ATTRACTOR POINT
    # ========================================

    # Remove old veve_viz if switching from veve to chaos
    old_viz = container.op('veve_viz')
    if old_viz is not None:
        print("  [--] Removing old veve_viz (replacing with chaos_viz)")
        old_viz.destroy()

    chaos_viz = container.op('chaos_viz')
    if chaos_viz is None:
        chaos_viz = container.create('glslTOP', 'chaos_viz')
    chaos_viz.par.resolutionw = RENDER_RES[0]
    chaos_viz.par.resolutionh = RENDER_RES[1]
    chaos_viz.par.outputresolution = 9  # Custom
    chaos_viz.par.format = 26  # RGBA 16-bit float
    chaos_viz.nodeX = base_x
    chaos_viz.nodeY = base_y - 200

    # Write GLSL code to Text DAT
    glsl_dat = container.op('chaos_glsl_code')
    if glsl_dat is None:
        glsl_dat = container.create('textDAT', 'chaos_glsl_code')
    glsl_dat.text = CHAOS_GLSL
    glsl_dat.nodeX = base_x + 200
    glsl_dat.nodeY = base_y - 300
    chaos_viz.par.glsl = glsl_dat.path

    # Wire CHOP uniforms to GLSL
    # Map channel names to uniform names
    chaos_viz.par.uniformtype0 = 'float'
    chaos_viz.par.uniformname0 = 'uChaosX'
    chaos_viz.par.value0x.mode = 2  # expression
    chaos_viz.par.value0x.expr = "(lambda c: c[0].eval() if c.numChans > 0 else 0.0)(op('" + chaos_sel.path + "'))"

    chaos_viz.par.uniformtype1 = 'float'
    chaos_viz.par.uniformname1 = 'uChaosY'
    chaos_viz.par.value1x.mode = 2
    chaos_viz.par.value1x.expr = "(lambda c: c[min(1, c.numChans-1)].eval() if c.numChans > 1 else 0.0)(op('" + chaos_sel.path + "'))"

    chaos_viz.par.uniformtype2 = 'float'
    chaos_viz.par.uniformname2 = 'uChaosZ'
    chaos_viz.par.value2x.mode = 2
    chaos_viz.par.value2x.expr = "(lambda c: c[min(2, c.numChans-1)].eval() if c.numChans > 2 else 0.0)(op('" + chaos_sel.path + "'))"

    chaos_viz.par.uniformtype3 = 'float'
    chaos_viz.par.uniformname3 = 'uAmp'
    chaos_viz.par.value3x.mode = 2
    chaos_viz.par.value3x.expr = "(lambda c: c[0].eval() if c.numChans > 0 else 0.3)(op('" + amp_sel.path + "'))"

    chaos_viz.par.uniformtype4 = 'float'
    chaos_viz.par.uniformname4 = 'uAttractor'
    chaos_viz.par.value4x.mode = 2
    chaos_viz.par.value4x.expr = "(lambda c: c[0].eval() if c.numChans > 0 else 0.0)(op('" + att_sel.path + "'))"

    chaos_viz.par.uniformtype5 = 'float'
    chaos_viz.par.uniformname5 = 'uChaosGain'
    chaos_viz.par.value5x.mode = 2
    chaos_viz.par.value5x.expr = "(lambda c: c[0].eval() if c.numChans > 0 else 0.5)(op('" + gain_sel.path + "'))"

    chaos_viz.par.uniformtype6 = 'float'
    chaos_viz.par.uniformname6 = 'uDecay'
    chaos_viz.par.value6x.mode = 2
    chaos_viz.par.value6x.expr = "(lambda c: c[0].eval() if c.numChans > 0 else 0.3)(op('" + decay_sel.path + "'))"

    chaos_viz.par.uniformtype7 = 'float'
    chaos_viz.par.uniformname7 = 'uDrive'
    chaos_viz.par.value7x.mode = 2
    chaos_viz.par.value7x.expr = "(lambda c: c[0].eval() if c.numChans > 0 else 0.5)(op('" + drive_sel.path + "'))"

    print("[OK] GLSL chaos attractor shader with 8 uniforms")

    # ========================================
    # 4. TRAIL FEEDBACK CHAIN
    # ========================================
    # Reuse existing chain if it exists (from veve session)
    # Otherwise create new one

    trail_fb = container.op('trail_fb')
    if trail_fb is not None:
        # Existing trail chain — just rewire input from chaos_viz
        print("[OK] Reusing existing trail feedback chain")

        # Disconnect old source from trail_fb and trail_mix
        trail_mix = container.op('trail_mix')
        if trail_mix is not None:
            # Wire chaos_viz as the source for trail_mix input 0
            for conn in trail_mix.inputConnectors[0].connections:
                conn.disconnect()
            wire(chaos_viz, trail_mix, 0, 0)
            print("  [OK] Rewired trail_mix input 0 → chaos_viz")

    else:
        # Build new trail feedback chain
        print("[NEW] Building trail feedback chain...")

        trail_fb = container.create('feedbackTOP', 'trail_fb')
        trail_fb.par.resolutionw = RENDER_RES[0]
        trail_fb.par.resolutionh = RENDER_RES[1]
        trail_fb.par.outputresolution = 9
        trail_fb.par.format = 26  # RGBA16Float
        trail_fb.nodeX = base_x
        trail_fb.nodeY = base_y - 400

        # Blur for smooth transitions
        trail_blur = container.create('blurTOP', 'trail_blur')
        trail_blur.par.size = 1.5
        wire(trail_fb, trail_blur)
        trail_blur.nodeX = base_x + 200
        trail_blur.nodeY = base_y - 400

        # Fade (decay-responsive trail persistence)
        trail_fade = container.create('levelTOP', 'trail_fade')
        trail_fade.par.opacity = 0.95  # Base persistence
        wire(trail_blur, trail_fade)
        trail_fade.nodeX = base_x + 400
        trail_fade.nodeY = base_y - 400

        # Decay-responsive opacity expression
        trail_fade.par.opacity.mode = 2
        trail_fade.par.opacity.expr = (
            "(lambda d: min(min(d/0.05, 1.0)*0.93 + "
            "max(0.0, min((d-0.05)/0.85, 1.0))*0.005 + "
            "max(0.0, min((d-0.9)/0.1, 1.0))*0.063, 0.999))"
            "(min(op('" + osc.path + "')['resonator/decay'].eval() "
            "if op('" + osc.path + "').chan('resonator/decay') is not None else 0.3, 1.5))"
        )

        # Mix (composite: faded trail + new frame)
        trail_mix = container.create('compositeTOP', 'trail_mix')
        trail_mix.par.operand = 0  # Add
        wire(chaos_viz, trail_mix, 0, 0)
        wire(trail_fade, trail_mix, 0, 1)
        trail_mix.nodeX = base_x + 600
        trail_mix.nodeY = base_y - 400

        # Output null (feedback target)
        trail_out = container.create('nullTOP', 'trail_out')
        wire(trail_mix, trail_out)
        trail_out.nodeX = base_x + 800
        trail_out.nodeY = base_y - 400

        # Set feedback target (DOWNSTREAM)
        trail_fb.par.top = trail_out.path

        print("[OK] Trail feedback chain built")

    # ========================================
    # 5. BLOOM + OUTPUT
    # ========================================

    trail_out = container.op('trail_out')

    bloom = container.op('bloom1')
    if bloom is None:
        bloom = container.create('blurTOP', 'bloom1')
        bloom.par.size = 8
    if trail_out:
        # Disconnect old inputs
        for conn in bloom.inputConnectors[0].connections:
            conn.disconnect()
        wire(trail_out, bloom)
    bloom.nodeX = base_x + 1000
    bloom.nodeY = base_y - 400

    # Bloom level
    bloom_level = container.op('bloom_level')
    if bloom_level is None:
        bloom_level = container.create('levelTOP', 'bloom_level')
        bloom_level.par.brightness1 = 1.2
        bloom_level.par.gamma1 = 0.85
    wire(bloom, bloom_level)
    bloom_level.nodeX = base_x + 1200
    bloom_level.nodeY = base_y - 400

    # Bloom composite
    bloom_comp = container.op('bloom_comp')
    if bloom_comp is None:
        bloom_comp = container.create('compositeTOP', 'bloom_comp')
        bloom_comp.par.operand = 0  # Add
    if trail_out:
        for conn in bloom_comp.inputConnectors[0].connections:
            conn.disconnect()
        for conn in bloom_comp.inputConnectors[1].connections:
            conn.disconnect()
        wire(trail_out, bloom_comp, 0, 0)
        wire(bloom_level, bloom_comp, 0, 1)
    bloom_comp.nodeX = base_x + 1400
    bloom_comp.nodeY = base_y - 400

    # Main output
    main_out = container.op('main_out')
    if main_out is None:
        main_out = container.create('nullTOP', 'main_out')
    for conn in main_out.inputConnectors[0].connections:
        conn.disconnect()
    wire(bloom_comp, main_out)
    main_out.nodeX = base_x + 1600
    main_out.nodeY = base_y - 400

    print("[OK] Bloom + output chain")

    # ========================================
    # DONE
    # ========================================

    print("")
    print("=" * 50)
    print("CHAOS VIZ BUILD COMPLETE")
    print(f"  Container: {container.path}")
    print(f"  Output: {main_out.path}")
    print("")
    print("Signal flow:")
    print("  OSC (port 7000) → Select CHOPs → GLSL (chaos point)")
    print("  → Trail feedback (persistence) → Bloom → Output")
    print("")
    print("OSC channels:")
    print("  chaos/x, chaos/y, chaos/z  (or x, y, z)")
    print("  audio/amplitude  (or L)")
    print("  attractor/type, chaos/gain, resonator/decay, resonator/drive")
    print("")
    print("Attractors (uAttractor uniform):")
    print("  0: Lorenz (butterfly)")
    print("  1: Rossler (spiral)")
    print("  2: Chua (scroll)")
    print("  3: Halvorsen (3D knot)")
    print("  4: Aizawa (torus)")
    print("")
    print("To add ComfyUI layer, run build_comfyui_layer.py after this.")
    print("=" * 50)


# ============================================
# RUN
# ============================================

build_chaos_viz()
