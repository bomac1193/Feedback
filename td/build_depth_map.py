# ============================================
# FEEDBACK — Attractor Depth Map for ControlNet
# ============================================
#
# Renders the chaos attractor trajectory as a greyscale depth map
# that ComfyUI uses as ControlNet conditioning.
#
# The attractor geometry BECOMES the image composition:
#   - Lorenz butterfly → bilateral symmetry, two lobes
#   - Rossler spiral → rotating spiral composition
#   - Chua scroll → double scroll, figure-8
#   - Halvorsen → 3D knot
#   - Aizawa → torus/ring
#
# The depth map is saved to D:/Visuals/ComfyUI/input/attractor_depth.png
# every N frames (configurable). The bridge reads it as ControlNet input.
#
# RUN in TD Textport:
#   exec(open('D:/Music/Max Msp/Projects/Feedback/td/build_depth_map.py').read())
#
# ============================================

RENDER_RES = (1024, 1024)  # Square for ControlNet
DEPTH_OUTPUT = "D:/Visuals/ComfyUI/input/attractor_depth.png"
SAVE_INTERVAL = 30  # Save depth map every N frames (at 60fps = 2x/sec)
BASE_PATH = '/project1'

def wire(src, dst, src_out=0, dst_in=0):
    src.outputConnectors[src_out].connect(dst.inputConnectors[dst_in])


# ============================================
# GLSL: Attractor Depth Map Shader
# ============================================

DEPTH_GLSL = '''// Attractor Depth Map — renders trail as greyscale depth for ControlNet
// White = close/foreground, black = far/background
// The attractor's shape IS the composition

uniform vec4 uChaos;    // x, y, z, loudness
uniform float uDecay;   // Controls trail persistence

layout(location = 0) out vec4 fragColor;

void main()
{
    vec2 uv = vUV.st;

    // Chaos position normalized to 0-1
    float cx = uChaos.x * 0.03 + 0.5;
    float cy = uChaos.y * 0.03 + 0.5;
    float cz = uChaos.z;
    float loudness = clamp(abs(uChaos.w), 0.0, 1.0);

    // === TRAIL (previous frame) ===
    vec4 prev = vec4(0.0);
    #if TD_NUM_2D_INPUTS > 0
        prev = texture(sTD2DInputs[0], uv);
        // Trail fade — controlled by decay param
        float fadeRate = 0.96 + uDecay * 0.03;  // 0.96 (fast fade) to 0.99 (long trail)
        prev.rgb *= fadeRate;
    #endif

    // === DEPTH VALUE ===
    // Z maps to brightness: use Z as depth indicator
    // Normalize Z to 0-1 range (Lorenz Z ranges ~5-45, centered ~25)
    float zDepth = clamp(cz * 0.5 + 0.5, 0.1, 1.0);

    // === POINT ===
    float dist = length(uv - vec2(cx, cy));

    // Soft gaussian — size controlled by loudness
    float pointSize = 0.006 + loudness * 0.012;
    float intensity = exp(-dist * dist / (pointSize * pointSize * 2.0));

    // Wider soft glow for ControlNet readability
    float glowSize = pointSize * 6.0;
    float glow = exp(-dist * dist / (glowSize * glowSize * 2.0)) * 0.4;

    float total = intensity + glow;

    // Depth-weighted brightness
    float depthValue = total * zDepth;

    // Composite with trail
    float result = max(prev.r, depthValue);

    fragColor = TDOutputSwizzle(vec4(result, result, result, 1.0));
}
'''


def build_depth_map():
    container = op(BASE_PATH)
    if container is None:
        print("[ERROR] /project1 not found")
        return

    # Check for existing feedback_viz
    viz = container.op('feedback_viz')
    if viz is None:
        print("[ERROR] feedback_viz container not found. Run build_chaos_viz.py first.")
        return

    print("=" * 50)
    print("DEPTH MAP — Building attractor depth map renderer...")
    print("=" * 50)

    # ========================================
    # 1. DEPTH MAP GLSL TOP
    # ========================================

    depth_viz = viz.op('depth_map')
    if depth_viz is None:
        depth_viz = viz.create('glslTOP', 'depth_map')
    depth_viz.par.resolutionw = RENDER_RES[0]
    depth_viz.par.resolutionh = RENDER_RES[1]
    depth_viz.par.outputresolution = 9  # Custom
    depth_viz.par.format = 26  # RGBA 16-bit float
    depth_viz.nodeX = -400
    depth_viz.nodeY = -200

    # Write GLSL code
    depth_glsl_dat = viz.op('depth_map_pixel')
    if depth_glsl_dat is None:
        depth_glsl_dat = viz.create('textDAT', 'depth_map_pixel')
    depth_glsl_dat.text = DEPTH_GLSL
    depth_glsl_dat.par.language = 'glsl'
    depth_glsl_dat.par.extension = 'frag'
    depth_glsl_dat.nodeX = -200
    depth_glsl_dat.nodeY = -300
    depth_viz.par.pixeldat = depth_glsl_dat.path

    # Set uniform — same chaos data as main viz
    depth_viz.par.vec = 1
    depth_viz.par.vec0name = 'uChaos'

    print("[OK] Depth map GLSL shader")

    # ========================================
    # 2. FEEDBACK LOOP (depth trail)
    # ========================================

    depth_fb = viz.op('depth_feedback')
    if depth_fb is None:
        depth_fb = viz.create('feedbackTOP', 'depth_feedback')
    depth_fb.par.top = depth_viz.path
    depth_fb.par.resolutionw = RENDER_RES[0]
    depth_fb.par.resolutionh = RENDER_RES[1]
    depth_fb.par.outputresolution = 9
    depth_fb.nodeX = -400
    depth_fb.nodeY = -400

    # Wire feedback into depth GLSL input
    wire(depth_fb, depth_viz)
    print("[OK] Depth feedback loop")

    # ========================================
    # 3. BLUR (soften depth edges for ControlNet)
    # ========================================

    depth_blur = viz.op('depth_blur')
    if depth_blur is None:
        depth_blur = viz.create('blurTOP', 'depth_blur')
    depth_blur.par.size = 3
    wire(depth_viz, depth_blur)
    depth_blur.nodeX = -200
    depth_blur.nodeY = -200
    print("[OK] Depth blur (soften edges)")

    # ========================================
    # 4. SAVE TO FILE (for ComfyUI)
    # ========================================

    depth_file = viz.op('depth_file_out')
    if depth_file is None:
        depth_file = viz.create('moviefileoutTOP', 'depth_file_out')
    depth_file.par.file = DEPTH_OUTPUT
    depth_file.par.type = 'PNG'
    wire(depth_blur, depth_file)
    depth_file.nodeX = 0
    depth_file.nodeY = -200
    print(f"[OK] Depth map output: {DEPTH_OUTPUT}")

    # ========================================
    # 5. UPDATE EXECUTE DAT (save periodically)
    # ========================================

    # Add depth map saving to the existing osc_update or create new
    save_dat = viz.op('depth_save_timer')
    if save_dat is None:
        save_dat = viz.create('executeDAT', 'depth_save_timer')
    save_dat.par.active = True
    save_dat.par.framestart = True

    save_code = '''# Save depth map every N frames for ComfyUI ControlNet
_frame_counter = 0
SAVE_INTERVAL = ''' + str(SAVE_INTERVAL) + '''

def onFrameStart(frame):
    global _frame_counter
    _frame_counter += 1
    if _frame_counter >= SAVE_INTERVAL:
        _frame_counter = 0
        fout = op("depth_file_out")
        if fout is not None:
            fout.par.record = True
            fout.par.record = False

    # Sync depth map uniforms from main viz storage
    s = parent().storage
    depth = op("depth_map")
    if depth is not None:
        x = s.get("x", 0.0)
        y = s.get("y", 0.0)
        z = s.get("z", 0.0)
        loudness = s.get("loudness", 0.0)
        depth.par.vec0valuex = x
        depth.par.vec0valuey = y
        depth.par.vec0valuez = z
        depth.par.vec0valuew = loudness
'''
    save_dat.text = save_code
    save_dat.nodeX = 0
    save_dat.nodeY = -400
    print("[OK] Periodic depth map save timer")

    # ========================================
    # DONE
    # ========================================

    print("")
    print("=" * 50)
    print("DEPTH MAP BUILD COMPLETE")
    print("")
    print("Signal flow:")
    print("  Storage (chaos xyz) → GLSL depth point → feedback trail")
    print("  → blur → save to D:/Visuals/ComfyUI/input/attractor_depth.png")
    print("")
    print("ComfyUI ControlNet reads this depth map as structural conditioning.")
    print("The attractor's shape becomes the IMAGE COMPOSITION.")
    print("=" * 50)


# ============================================
# RUN
# ============================================

build_depth_map()
