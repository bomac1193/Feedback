# ============================================
# FEEDBACK — ComfyUI Compositing Layer for TouchDesigner
# ============================================
#
# Run AFTER build_viz.py — adds the ComfyUI visual layer on top
# of the existing particle/Kuramoto/swarm visualization.
#
# WHAT IT ADDS:
#   - Movie File In TOP: loads ComfyUI generated frames
#   - Feedback TOP: temporal smearing for smooth frame transitions
#   - GLSL displacement: audio-reactive warping of ComfyUI frames
#   - Composite: layers ComfyUI frames behind particle visualizations
#   - Updated render pipeline with the combined output
#
# RUN:
#   exec(open('D:/path/to/build_comfyui_layer.py').read())
#
# REQUIRES:
#   - feedback_viz container from build_viz.py already built
#   - ComfyUI running and generating frames to output dir
#   - comfyui_bridge.py loaded in a Text DAT
#
# ============================================

import os

# ============================================
# CONFIG
# ============================================

BASE_PATH = '/project1'
CONTAINER_NAME = None  # Build directly in /project1 (no sub-container)
COMFYUI_OUTPUT_DIR = "C:/ComfyUI/output"
FRAME_PATTERN = "feedback_frame_00001_.png"
RENDER_RES = (1280, 720)


def wire(src, dst, src_out=0, dst_in=0):
    src.outputConnectors[src_out].connect(dst.inputConnectors[dst_in])


def build_comfyui_layer():
    if CONTAINER_NAME:
        container = op(f'{BASE_PATH}/{CONTAINER_NAME}')
    else:
        container = op(BASE_PATH)
    if container is None:
        print("[ERROR] Container not found.")
        return

    base_x = -300
    base_y = -800

    print("=" * 50)
    print("FEEDBACK — Adding ComfyUI compositing layer...")
    print("=" * 50)

    # ============================================
    # 1. COMFYUI FRAME INPUT
    # ============================================

    # Movie File In TOP — loads the latest generated frame
    frame_in = container.create(moviefileinTOP, 'comfyui_frame')
    frame_file = os.path.join(COMFYUI_OUTPUT_DIR, FRAME_PATTERN)
    frame_in.par.file = frame_file
    frame_in.par.reloadpulse = False  # Manual reload from bridge script
    frame_in.nodeX = base_x
    frame_in.nodeY = base_y
    print(f"[OK] Frame input: {frame_file}")

    # Resolution match
    res = container.create(resolutionTOP, 'comfyui_res')
    res.par.resolutionw = RENDER_RES[0]
    res.par.resolutionh = RENDER_RES[1]
    res.par.outputresolution = 9  # Custom
    wire(frame_in, res)
    res.nodeX = base_x + 200
    res.nodeY = base_y

    # ============================================
    # 2. FEEDBACK LOOP (temporal coherence)
    # ============================================
    # Blends current ComfyUI frame with previous output
    # Creates smooth transitions between discrete generation frames

    feedback = container.create(feedbackTOP, 'comfyui_feedback')
    feedback.nodeX = base_x + 400
    feedback.nodeY = base_y

    comp_fb = container.create(compositeTOP, 'comfyui_fb_comp')
    comp_fb.par.operand = 27  # Over
    wire(res, comp_fb, 0, 0)          # New frame on top
    wire(feedback, comp_fb, 0, 1)     # Previous frame underneath
    comp_fb.nodeX = base_x + 600
    comp_fb.nodeY = base_y

    # Opacity control — how much new frame shows vs old
    # Lower = smoother transitions, higher = more responsive
    level_fb = container.create(levelTOP, 'comfyui_fb_level')
    level_fb.par.opacity = 0.6  # 60% new frame, 40% old — smooth blend
    wire(comp_fb, level_fb)
    level_fb.nodeX = base_x + 800
    level_fb.nodeY = base_y

    # Wire feedback loop
    wire(level_fb, feedback)
    print("[OK] Feedback loop for temporal coherence")

    # ============================================
    # 3. AUDIO-REACTIVE GLSL DISPLACEMENT
    # ============================================
    # Warps the ComfyUI frame based on audio features
    # This provides frame-rate-independent responsiveness

    # Get audio features from OSC
    osc = container.op('osc_from_max')
    if osc is None:
        osc = container.op('osc_in')

    # Select key features for displacement
    feat_sel = container.create(selectCHOP, 'comfyui_feat_select')
    if osc:
        feat_sel.par.chop = osc.path
    feat_sel.par.channames = 'chaos/x chaos/y chaos/z audio/amplitude x y z L'
    feat_sel.nodeX = base_x + 400
    feat_sel.nodeY = base_y - 200

    # GLSL TOP for audio-reactive displacement
    glsl = container.create(glslTOP, 'comfyui_displace')
    glsl.par.resolutionw = RENDER_RES[0]
    glsl.par.resolutionh = RENDER_RES[1]
    glsl.par.outputresolution = 9  # Custom
    wire(level_fb, glsl)  # ComfyUI frame as input texture

    # Write GLSL shader code
    glsl_dat = container.create(textDAT, 'comfyui_displace_glsl')
    glsl_dat.text = '''// Feedback AV — Audio-reactive displacement of ComfyUI frames
// Uniforms from CHOP: chaos XYZ + amplitude

uniform float uChaosX;   // Chaos attractor X (or Lorenz X)
uniform float uChaosY;   // Chaos attractor Y
uniform float uChaosZ;   // Chaos attractor Z
uniform float uAmp;      // Audio amplitude (0-1)
uniform float uTime;     // Time

out vec4 fragColor;

void main()
{
    vec2 uv = vUV.st;

    // Displacement from chaos state
    float displace_amt = 0.02 + uAmp * 0.02;

    // Chaos XYZ create directional displacement
    vec2 offset = vec2(
        sin(uv.y * 10.0 + uChaosX * 0.5 + uTime) * displace_amt,
        cos(uv.x * 10.0 + uChaosY * 0.5 + uTime) * displace_amt
    );

    // More displacement at edges (vignette-like)
    float edge = length(uv - 0.5) * 2.0;
    offset *= (1.0 + edge * 0.5);

    // Sample displaced texture
    vec2 displaced_uv = uv + offset;
    vec4 color = texture(sTD2DInputs[0], displaced_uv);

    // Subtle color shift from chaos Z
    float hue_shift = uChaosZ * 0.01;
    color.r += hue_shift * 0.3;
    color.b -= hue_shift * 0.2;

    // Darken when quiet, brighten when loud
    float brightness = 0.6 + uAmp * 0.4;
    color.rgb *= brightness;

    fragColor = TDOutputSwizzle(color);
}
'''
    glsl_dat.nodeX = base_x + 800
    glsl_dat.nodeY = base_y - 300
    # Link the GLSL code to the GLSL TOP
    glsl.par.glsl = glsl_dat.path
    glsl.nodeX = base_x + 800
    glsl.nodeY = base_y - 100
    print("[OK] GLSL audio-reactive displacement shader")

    # ============================================
    # 4. COMPOSITING — ComfyUI + PARTICLE LAYERS
    # ============================================
    # ComfyUI frame = background (the dream layer)
    # Particle render = foreground (the data layer)

    # Get existing visualization output (trail feedback chain or render)
    # Try trail chain output first (from chaos_viz/veve_viz), then fall back
    particle_source = container.op('trail_out')
    if particle_source is None:
        particle_source = container.op('bloom1')
    if particle_source is None:
        particle_source = container.op('bloom_comp')
    if particle_source is None:
        particle_source = container.op('render')
    if particle_source is None:
        print("[WARN] No visualization source found — ComfyUI layer only")

    # Final composite: ComfyUI underneath, particles on top
    final_comp = container.create(compositeTOP, 'final_composite')
    final_comp.par.operand = 0  # Add (particles glow over ComfyUI)
    wire(glsl, final_comp, 0, 0)  # ComfyUI (displaced) as background
    if particle_source:
        wire(particle_source, final_comp, 0, 1)  # Particles on top
    final_comp.nodeX = base_x + 1000
    final_comp.nodeY = base_y

    # Color grade — subtle overall treatment
    grade = container.create(levelTOP, 'final_grade')
    grade.par.gamma1 = 0.9      # Slightly crushed — cinematic
    grade.par.brightness1 = 1.05  # Touch brighter
    grade.par.contrast = 1.1     # Punch
    wire(final_comp, grade)
    grade.nodeX = base_x + 1200
    grade.nodeY = base_y
    print("[OK] Final compositing pipeline")

    # ============================================
    # 5. OUTPUT
    # ============================================

    # Update the existing out TOP to use our new pipeline
    existing_out = container.op('out')
    if existing_out:
        # Disconnect old input and wire new
        for conn in existing_out.inputConnectors[0].connections:
            conn.disconnect()
        wire(grade, existing_out)
        print("[OK] Rewired output to include ComfyUI layer")
    else:
        # Create new output
        out = container.create(outTOP, 'out_av')
        wire(grade, out)
        out.nodeX = base_x + 1400
        out.nodeY = base_y
        print("[OK] Created new AV output")

    # ============================================
    # 6. TIMER FOR BRIDGE UPDATES
    # ============================================

    # Create Timer CHOP to call bridge.update() every frame
    timer_dat = container.create(textDAT, 'bridge_timer_callbacks')
    timer_dat.text = '''# Timer callback — calls ComfyUI bridge update
import importlib

def onStart(timerOp):
    pass

def whileTimerActive(timerOp, segment, cycle, fraction):
    pass

def onSegmentEnter(timerOp, segment, interrupt):
    pass

def onDone(timerOp, segment, interrupt):
    # Restart timer (loop)
    timerOp.par.start.pulse()

def onFrameStart(timerOp):
    try:
        bridge = op("comfyui_bridge_code")
        if bridge:
            exec(bridge.text)
            update()
    except Exception as e:
        pass
'''
    timer_dat.nodeX = base_x
    timer_dat.nodeY = base_y + 200

    # Load bridge code into a Text DAT
    bridge_code_dat = container.create(textDAT, 'comfyui_bridge_code')
    bridge_code_path = "D:/Music/Max Msp/Projects/Feedback/td/comfyui_bridge.py"
    bridge_code_dat.par.file = bridge_code_path
    bridge_code_dat.par.loadonstart = True
    bridge_code_dat.nodeX = base_x + 200
    bridge_code_dat.nodeY = base_y + 200
    print("[OK] Bridge code loaded")

    # ============================================
    # DONE
    # ============================================

    print("")
    print("=" * 50)
    print("COMFYUI LAYER COMPLETE")
    print(f"Container: {container.path}")
    print("")
    print("Signal flow:")
    print("  ComfyUI frame → Resolution match → Feedback loop")
    print("  → GLSL displacement (audio-reactive)")
    print("  → Composite with particle render")
    print("  → Color grade → Output")
    print("")
    print("To activate:")
    print("  1. Start ComfyUI: python main.py --listen 0.0.0.0 --port 8188")
    print("  2. Start Max/MSP with Feedback patch")
    print("  3. The bridge auto-generates frames from audio features")
    print("=" * 50)


# ============================================
# RUN
# ============================================

build_comfyui_layer()
