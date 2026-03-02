# ============================================
# FEEDBACK VISUALIZATION — TouchDesigner Build Script
# ============================================
#
# Run this in TD's Textport or an Execute DAT:
#   exec(open('D:/path/to/build_viz.py').read())
#
# Or paste into a Text DAT and run:
#   exec(op('build_script').text)
#
# Creates the full visualization network for:
#   P1: Lorenz attractor trail (amber particles)
#   P3: Kuramoto phase ring (blue↔amber by sync)
#   P4: Swarm particle field (6 voice colors)
#   Render pipeline with bloom
#
# Receives OSC from Max on port 7000:
#   /lorenz/xyz      — 3 floats (x, y, z)
#   /kuramoto/r      — 1 float (order parameter)
#   /kuramoto/phases — 6 floats (0-1)
#   /swarm/positions — [N, x0, y0, x1, y1, ...]
#   /swarm/metrics   — [density, spread, order]
#   /swarm/trigger   — [voice_id, freq, vel]
#
# ============================================

import math

# ============================================
# CONFIGURATION
# ============================================

OSC_PORT = 7000
BASE_PATH = '/project1'
CONTAINER_NAME = 'feedback_viz'

# Colors (RGB 0-1)
BG_COLOR = (0.02, 0.02, 0.05)
LORENZ_COLOR = (1.0, 0.6, 0.1)        # Amber
KURAMOTO_SYNC = (1.0, 0.6, 0.1)       # Amber (synced)
KURAMOTO_FREE = (0.2, 0.4, 1.0)       # Blue (desynchronized)

# 6 voice colors for swarm (and Kuramoto dots)
VOICE_COLORS = [
    (0.9, 0.2, 0.2),   # v0: sub bass — red
    (1.0, 0.6, 0.1),   # v1: body — amber
    (0.1, 0.8, 0.8),   # v2: metallic — cyan
    (1.0, 0.9, 0.2),   # v3: transient — yellow
    (0.4, 0.2, 0.9),   # v4: drone — indigo
    (0.9, 0.3, 0.7),   # v5: crystalline — magenta
]

RENDER_RES = (1920, 1080)
TRAIL_LENGTH_SEC = 5.0
LORENZ_SCALE = 0.3
KURAMOTO_RING_RADIUS = 8.0
SWARM_SCALE = 0.15


# ============================================
# HELPERS
# ============================================

def get_or_create_container(parent_path, name):
    """Get existing container or create new one."""
    parent = op(parent_path)
    existing = parent.op(name)
    if existing is not None:
        existing.destroy()
    comp = parent.create(baseCOMP, name)
    return comp


def wire(src, dst, src_out=0, dst_in=0):
    """Connect src output to dst input."""
    src.outputConnectors[src_out].connect(dst.inputConnectors[dst_in])


# ============================================
# BUILD: OSC INPUT
# ============================================

def build_osc_input(container):
    """OSC In CHOP receiving all Max data on port 7000."""
    osc = container.create(oscinCHOP, 'osc_in')
    osc.par.port = OSC_PORT
    osc.par.active = True
    osc.nodeX = 0
    osc.nodeY = 400
    return osc


# ============================================
# BUILD: P1 — LORENZ ATTRACTOR TRAIL
# ============================================

def build_lorenz(container, osc_node):
    """
    Lorenz attractor visualization:
    - Trail of instanced small spheres tracing the attractor path
    - Current position = larger "head" sphere
    - Amber color throughout
    """
    base_x = -600
    base_y = 200

    # --- Select Lorenz channels ---
    sel = container.create(selectCHOP, 'lorenz_select')
    sel.par.chop = osc_node.path
    sel.par.channames = 'x y z'
    sel.nodeX = base_x
    sel.nodeY = base_y

    # --- Rename to instance channels ---
    rename = container.create(renameCHOP, 'lorenz_rename')
    rename.par.renamefrom = 'x y z'
    rename.par.renameto = 'tx ty tz'
    wire(sel, rename)
    rename.nodeX = base_x
    rename.nodeY = base_y - 100

    # --- Math: scale down (Lorenz coords are large) ---
    math = container.create(mathCHOP, 'lorenz_scale')
    math.par.gain = LORENZ_SCALE
    wire(rename, math)
    math.nodeX = base_x
    math.nodeY = base_y - 200

    # --- Trail: accumulate positions over time ---
    trail = container.create(trailCHOP, 'lorenz_trail')
    trail.par.wlength = TRAIL_LENGTH_SEC
    trail.par.wlengthunit = 2  # seconds
    wire(math, trail)
    trail.nodeX = base_x
    trail.nodeY = base_y - 300

    # --- Add color channels (constant amber) ---
    color_const = container.create(constantCHOP, 'lorenz_color')
    color_const.par.name0 = 'cr'
    color_const.par.value0 = LORENZ_COLOR[0]
    color_const.par.name1 = 'cg'
    color_const.par.value1 = LORENZ_COLOR[1]
    color_const.par.name2 = 'cb'
    color_const.par.value2 = LORENZ_COLOR[2]
    color_const.nodeX = base_x + 200
    color_const.nodeY = base_y - 200

    # --- Merge trail + color for instancing ---
    merge = container.create(mergeCHOP, 'lorenz_merge')
    wire(trail, merge, 0, 0)
    wire(color_const, merge, 0, 1)
    merge.nodeX = base_x
    merge.nodeY = base_y - 400

    # --- Null for clean reference ---
    null = container.create(nullCHOP, 'lorenz_instance_data')
    wire(merge, null)
    null.nodeX = base_x
    null.nodeY = base_y - 500

    # --- Sphere SOP (small) ---
    sphere = container.create(sphereSOP, 'lorenz_sphere')
    sphere.par.type = 2  # polygon
    sphere.par.rows = 6
    sphere.par.cols = 8
    sphere.par.radx = 0.08
    sphere.par.rady = 0.08
    sphere.par.radz = 0.08
    sphere.nodeX = base_x + 200
    sphere.nodeY = base_y - 500

    # --- Material ---
    mat = container.create(constantMAT, 'lorenz_mat')
    mat.par.colorr = LORENZ_COLOR[0]
    mat.par.colorg = LORENZ_COLOR[1]
    mat.par.colorb = LORENZ_COLOR[2]
    mat.par.alpha = 0.8
    mat.nodeX = base_x + 200
    mat.nodeY = base_y - 600

    # --- Geometry COMP (instanced trail) ---
    geo = container.create(geometryCOMP, 'lorenz_geo')
    geo.par.instancing = True
    geo.par.instancechop = null.path
    geo.par.material = mat.path
    geo.nodeX = base_x
    geo.nodeY = base_y - 700

    # --- Head position (current point, larger sphere) ---
    head_null = container.create(nullCHOP, 'lorenz_head_data')
    wire(math, head_null)
    head_null.nodeX = base_x - 200
    head_null.nodeY = base_y - 400

    head_sphere = container.create(sphereSOP, 'lorenz_head_sphere')
    head_sphere.par.type = 2
    head_sphere.par.rows = 12
    head_sphere.par.cols = 16
    head_sphere.par.radx = 0.25
    head_sphere.par.rady = 0.25
    head_sphere.par.radz = 0.25
    head_sphere.nodeX = base_x - 200
    head_sphere.nodeY = base_y - 600

    head_geo = container.create(geometryCOMP, 'lorenz_head_geo')
    head_geo.par.instancing = True
    head_geo.par.instancechop = head_null.path
    head_geo.par.material = mat.path
    head_geo.nodeX = base_x - 200
    head_geo.nodeY = base_y - 700

    return geo, head_geo


# ============================================
# BUILD: P3 — KURAMOTO PHASE RING
# ============================================

def build_kuramoto(container, osc_node):
    """
    Kuramoto visualization:
    - 6 dots arranged on a ring at their phase angles
    - Color interpolates blue (free) ↔ amber (synced) based on r
    - Ring drawn as a circle SOP
    - Order parameter r shown as ring brightness/glow
    """
    base_x = 0
    base_y = 200

    # --- Select phase channels ---
    phase_sel = container.create(selectCHOP, 'kura_phase_select')
    phase_sel.par.chop = osc_node.path
    phase_sel.par.channames = 'phase1 phase2 phase3 phase4 phase5 phase6'
    phase_sel.nodeX = base_x
    phase_sel.nodeY = base_y

    # --- Select order parameter ---
    r_sel = container.create(selectCHOP, 'kura_r_select')
    r_sel.par.chop = osc_node.path
    r_sel.par.channames = 'r'
    r_sel.nodeX = base_x + 200
    r_sel.nodeY = base_y

    # --- Script CHOP: compute XY positions from phases ---
    # Creates instance channels: tx0-5, ty0-5, cr0-5, cg0-5, cb0-5
    script = container.create(scriptCHOP, 'kura_positions')
    script.par.numchans = 18  # 6*(tx,ty,tz) ... we'll use the callbacks
    wire(phase_sel, script, 0, 0)
    wire(r_sel, script, 0, 1)
    script.nodeX = base_x
    script.nodeY = base_y - 150

    # Write the Script CHOP callbacks
    callbacks_dat = script.docked[0] if script.docked else None
    if callbacks_dat is None:
        # Find the auto-created callbacks DAT
        for child in script.children:
            if 'callbacks' in child.name.lower():
                callbacks_dat = child
                break

    kuramoto_script = '''
import math

RADIUS = {radius}
VOICE_COLORS = {voice_colors}
SYNC_COLOR = {sync_color}
FREE_COLOR = {free_color}

def onCook(scriptOp):
    scriptOp.clear()

    # Get phase inputs (0-1 normalized)
    phases = []
    if scriptOp.inputs and len(scriptOp.inputs) > 0:
        inp = scriptOp.inputs[0]
        for i in range(min(inp.numChans, 6)):
            phases.append(inp[i][0])

    # Get order parameter r
    r = 0.5
    if scriptOp.inputs and len(scriptOp.inputs) > 1:
        r_inp = scriptOp.inputs[1]
        if r_inp.numChans > 0:
            r = r_inp[0][0]

    # Pad to 6 phases if needed
    while len(phases) < 6:
        phases.append(0.0)

    # Create instance channels
    for i in range(6):
        angle = phases[i] * 2.0 * math.pi
        x = math.cos(angle) * RADIUS
        y = math.sin(angle) * RADIUS

        # Color: lerp between free (blue) and sync (amber) based on r
        cr = FREE_COLOR[0] + (SYNC_COLOR[0] - FREE_COLOR[0]) * r
        cg = FREE_COLOR[1] + (SYNC_COLOR[1] - FREE_COLOR[1]) * r
        cb = FREE_COLOR[2] + (SYNC_COLOR[2] - FREE_COLOR[2]) * r

        # Blend in per-voice color at low r (individuality when desynchronized)
        voice_blend = 1.0 - r
        cr = cr * (1.0 - voice_blend * 0.5) + VOICE_COLORS[i][0] * voice_blend * 0.5
        cg = cg * (1.0 - voice_blend * 0.5) + VOICE_COLORS[i][1] * voice_blend * 0.5
        cb = cb * (1.0 - voice_blend * 0.5) + VOICE_COLORS[i][2] * voice_blend * 0.5

        scriptOp.appendChan('tx' + str(i)).vals = [x]
        scriptOp.appendChan('ty' + str(i)).vals = [y]
        scriptOp.appendChan('tz' + str(i)).vals = [0]
        scriptOp.appendChan('cr' + str(i)).vals = [cr]
        scriptOp.appendChan('cg' + str(i)).vals = [cg]
        scriptOp.appendChan('cb' + str(i)).vals = [cb]

    # Scale: pulse slightly with r (bigger = more synced)
    scale = 0.3 + r * 0.2
    for i in range(6):
        scriptOp.appendChan('sx' + str(i)).vals = [scale]
        scriptOp.appendChan('sy' + str(i)).vals = [scale]
        scriptOp.appendChan('sz' + str(i)).vals = [scale]
    return
'''.format(
        radius=KURAMOTO_RING_RADIUS,
        voice_colors=VOICE_COLORS,
        sync_color=list(KURAMOTO_SYNC),
        free_color=list(KURAMOTO_FREE)
    )

    # --- Shuffle CHOP: reorganize channels into proper instance format ---
    # Script CHOP outputs tx0,ty0,tz0,...tx5,ty5,tz5
    # We need: 6 samples, channels named tx,ty,tz,cr,cg,cb,sx,sy,sz
    shuffle_script = container.create(scriptCHOP, 'kura_shuffle')
    wire(script, shuffle_script)
    shuffle_script.nodeX = base_x
    shuffle_script.nodeY = base_y - 300

    shuffle_code = '''
def onCook(scriptOp):
    scriptOp.clear()
    inp = scriptOp.inputs[0] if scriptOp.inputs else None
    if inp is None or inp.numChans == 0:
        return

    # Read per-oscillator data from indexed channels
    n = 6
    chan_names = ['tx', 'ty', 'tz', 'cr', 'cg', 'cb', 'sx', 'sy', 'sz']

    for name in chan_names:
        c = scriptOp.appendChan(name)
        vals = []
        for i in range(n):
            key = name + str(i)
            found = False
            for j in range(inp.numChans):
                if inp[j].name == key:
                    vals.append(inp[j][0])
                    found = True
                    break
            if not found:
                vals.append(0.0)
        c.vals = vals

    scriptOp.numSamples = n
    return
'''

    # --- Null ---
    kura_null = container.create(nullCHOP, 'kura_instance_data')
    wire(shuffle_script, kura_null)
    kura_null.nodeX = base_x
    kura_null.nodeY = base_y - 450

    # --- Sphere SOP ---
    kura_sphere = container.create(sphereSOP, 'kura_sphere')
    kura_sphere.par.type = 2
    kura_sphere.par.rows = 12
    kura_sphere.par.cols = 16
    kura_sphere.par.radx = 0.3
    kura_sphere.par.rady = 0.3
    kura_sphere.par.radz = 0.3
    kura_sphere.nodeX = base_x + 200
    kura_sphere.nodeY = base_y - 450

    # --- Material (per-instance color) ---
    kura_mat = container.create(constantMAT, 'kura_mat')
    kura_mat.par.colorr = 1.0
    kura_mat.par.colorg = 1.0
    kura_mat.par.colorb = 1.0
    kura_mat.par.alpha = 0.9
    # Enable per-point color so instances use cr/cg/cb
    kura_mat.nodeX = base_x + 200
    kura_mat.nodeY = base_y - 550

    # --- Geometry COMP ---
    kura_geo = container.create(geometryCOMP, 'kura_geo')
    kura_geo.par.instancing = True
    kura_geo.par.instancechop = kura_null.path
    kura_geo.par.material = kura_mat.path
    kura_geo.nodeX = base_x
    kura_geo.nodeY = base_y - 600

    # --- Ring guide (circle SOP, rendered as wireframe) ---
    ring = container.create(circleSOP, 'kura_ring')
    ring.par.type = 1  # polygon
    ring.par.radx = KURAMOTO_RING_RADIUS
    ring.par.rady = KURAMOTO_RING_RADIUS
    ring.nodeX = base_x + 400
    ring.nodeY = base_y - 450

    ring_mat = container.create(wireframeMAT, 'kura_ring_mat')
    ring_mat.par.colorr = 0.15
    ring_mat.par.colorg = 0.15
    ring_mat.par.colorb = 0.2
    ring_mat.nodeX = base_x + 400
    ring_mat.nodeY = base_y - 550

    ring_geo = container.create(geometryCOMP, 'kura_ring_geo')
    ring_geo.par.material = ring_mat.path
    ring_geo.nodeX = base_x + 400
    ring_geo.nodeY = base_y - 600

    # Store callbacks code in Text DATs
    # We'll write these after creation via a separate step
    return (script, kuramoto_script, shuffle_script, shuffle_code,
            kura_geo, ring_geo)


# ============================================
# BUILD: P4 — SWARM PARTICLE FIELD
# ============================================

def build_swarm(container, osc_node):
    """
    Swarm visualization:
    - N agents as instanced spheres
    - Per-voice color (6 voice colors, round-robin by agent_id)
    - Position data comes as flat list: [N, x0, y0, x1, y1, ...]
    - Trigger flash on note events
    """
    base_x = 600
    base_y = 200

    # --- Select position data ---
    pos_sel = container.create(selectCHOP, 'swarm_pos_select')
    pos_sel.par.chop = osc_node.path
    pos_sel.par.channames = 'positions*'
    pos_sel.nodeX = base_x
    pos_sel.nodeY = base_y

    # --- Select trigger data ---
    trig_sel = container.create(selectCHOP, 'swarm_trig_select')
    trig_sel.par.chop = osc_node.path
    trig_sel.par.channames = 'trigger*'
    trig_sel.nodeX = base_x + 200
    trig_sel.nodeY = base_y

    # --- Script CHOP: parse flat position list into instance channels ---
    swarm_script = container.create(scriptCHOP, 'swarm_positions')
    wire(pos_sel, swarm_script, 0, 0)
    wire(trig_sel, swarm_script, 0, 1)
    swarm_script.nodeX = base_x
    swarm_script.nodeY = base_y - 150

    swarm_parse_code = '''
import math

SCALE = {scale}
VOICE_COLORS = {voice_colors}

# Track flash states per voice
flash_timers = [0.0] * 6
FLASH_DURATION = 0.1  # seconds

def onCook(scriptOp):
    global flash_timers
    scriptOp.clear()

    inp = scriptOp.inputs[0] if scriptOp.inputs else None
    if inp is None or inp.numChans == 0:
        return

    # Parse flat position list from OSC
    # Format: channel 0 = N, then pairs of x,y values across channels
    # Or: all values in one channel as samples
    # Swarm.js sends: outlet(1, N, x0, y0, x1, y1, ...)

    # Try reading from multiple channels (OSC maps args to channels)
    all_vals = []
    for i in range(inp.numChans):
        all_vals.append(inp[i][0])

    if len(all_vals) < 3:
        return

    n_agents = int(all_vals[0])
    if n_agents < 1 or len(all_vals) < 1 + n_agents * 2:
        return

    # Check triggers
    trig_inp = scriptOp.inputs[1] if len(scriptOp.inputs) > 1 else None
    if trig_inp and trig_inp.numChans >= 3:
        voice_id = int(trig_inp[0][0])
        if 0 <= voice_id < 6:
            flash_timers[voice_id] = FLASH_DURATION

    # Decay flash timers
    dt = 1.0 / max(scriptOp.rate, 1)
    for i in range(6):
        flash_timers[i] = max(0, flash_timers[i] - dt)

    # Build instance channels
    tx_vals = []
    ty_vals = []
    tz_vals = []
    cr_vals = []
    cg_vals = []
    cb_vals = []
    sx_vals = []
    sy_vals = []
    sz_vals = []

    for i in range(n_agents):
        x = all_vals[1 + i * 2] * SCALE
        y = all_vals[2 + i * 2] * SCALE

        voice = i % 6
        vc = VOICE_COLORS[voice]

        # Flash: brighten on trigger
        flash = flash_timers[voice]
        brightness = 1.0 + flash * 5.0  # bright flash

        tx_vals.append(x)
        ty_vals.append(y)
        tz_vals.append(0)
        cr_vals.append(min(vc[0] * brightness, 1.0))
        cg_vals.append(min(vc[1] * brightness, 1.0))
        cb_vals.append(min(vc[2] * brightness, 1.0))

        base_scale = 0.15
        pulse = base_scale + flash * 0.3
        sx_vals.append(pulse)
        sy_vals.append(pulse)
        sz_vals.append(pulse)

    scriptOp.appendChan('tx').vals = tx_vals
    scriptOp.appendChan('ty').vals = ty_vals
    scriptOp.appendChan('tz').vals = tz_vals
    scriptOp.appendChan('cr').vals = cr_vals
    scriptOp.appendChan('cg').vals = cg_vals
    scriptOp.appendChan('cb').vals = cb_vals
    scriptOp.appendChan('sx').vals = sx_vals
    scriptOp.appendChan('sy').vals = sy_vals
    scriptOp.appendChan('sz').vals = sz_vals

    scriptOp.numSamples = n_agents
    return
'''.format(
        scale=SWARM_SCALE,
        voice_colors=VOICE_COLORS
    )

    # --- Null ---
    swarm_null = container.create(nullCHOP, 'swarm_instance_data')
    wire(swarm_script, swarm_null)
    swarm_null.nodeX = base_x
    swarm_null.nodeY = base_y - 350

    # --- Sphere SOP ---
    swarm_sphere = container.create(sphereSOP, 'swarm_sphere')
    swarm_sphere.par.type = 2
    swarm_sphere.par.rows = 8
    swarm_sphere.par.cols = 10
    swarm_sphere.par.radx = 0.15
    swarm_sphere.par.rady = 0.15
    swarm_sphere.par.radz = 0.15
    swarm_sphere.nodeX = base_x + 200
    swarm_sphere.nodeY = base_y - 350

    # --- Material (per-instance color) ---
    swarm_mat = container.create(constantMAT, 'swarm_mat')
    swarm_mat.par.colorr = 1.0
    swarm_mat.par.colorg = 1.0
    swarm_mat.par.colorb = 1.0
    swarm_mat.par.alpha = 0.85
    swarm_mat.nodeX = base_x + 200
    swarm_mat.nodeY = base_y - 450

    # --- Geometry COMP ---
    swarm_geo = container.create(geometryCOMP, 'swarm_geo')
    swarm_geo.par.instancing = True
    swarm_geo.par.instancechop = swarm_null.path
    swarm_geo.par.material = swarm_mat.path
    swarm_geo.nodeX = base_x
    swarm_geo.nodeY = base_y - 500

    return swarm_script, swarm_parse_code, swarm_geo


# ============================================
# BUILD: RENDER PIPELINE
# ============================================

def build_render(container, geo_nodes):
    """
    Camera + Light + Render + Bloom post-process.
    geo_nodes: list of Geometry COMPs to render.
    """
    base_x = 0
    base_y = -400

    # --- Camera ---
    cam = container.create(cameraCOMP, 'cam')
    cam.par.tx = 0
    cam.par.ty = 0
    cam.par.tz = 30
    cam.nodeX = base_x - 400
    cam.nodeY = base_y

    # --- Light ---
    light = container.create(lightCOMP, 'light')
    light.par.tx = 10
    light.par.ty = 15
    light.par.tz = 20
    light.par.dimmer = 1.2
    light.nodeX = base_x - 200
    light.nodeY = base_y

    # --- Render TOP ---
    render = container.create(renderTOP, 'render')
    render.par.resolutionw = RENDER_RES[0]
    render.par.resolutionh = RENDER_RES[1]
    render.par.camera = cam.path
    render.par.geometry = '*'
    render.par.light = light.path
    render.par.bgcolorr = BG_COLOR[0]
    render.par.bgcolorg = BG_COLOR[1]
    render.par.bgcolorb = BG_COLOR[2]
    render.par.near = 0.1
    render.par.far = 200
    render.nodeX = base_x
    render.nodeY = base_y

    # --- Bloom post-process ---
    # Step 1: Blur (glow extraction)
    blur = container.create(blurTOP, 'bloom_blur')
    blur.par.size = 20
    wire(render, blur)
    blur.nodeX = base_x + 200
    blur.nodeY = base_y

    # Step 2: Level (boost bloom brightness)
    level = container.create(levelTOP, 'bloom_level')
    level.par.brightness1 = 1.3
    level.par.gamma1 = 0.8
    wire(blur, level)
    level.nodeX = base_x + 400
    level.nodeY = base_y

    # Step 3: Composite (add bloom over original)
    comp = container.create(compositeTOP, 'bloom_comp')
    comp.par.operand = 0  # Add
    wire(render, comp, 0, 0)
    wire(level, comp, 0, 1)
    comp.nodeX = base_x + 600
    comp.nodeY = base_y

    # --- Output ---
    out = container.create(outTOP, 'out')
    wire(comp, out)
    out.nodeX = base_x + 800
    out.nodeY = base_y

    return render, out


# ============================================
# WRITE SCRIPT CALLBACKS
# ============================================

def write_callbacks(container, script_op, code, name):
    """
    Write callback code to a Text DAT and dock it to the Script CHOP.
    Script CHOPs auto-create a docked callbacks DAT, but we need to
    find it and write our code into it.
    """
    # Script CHOPs create a docked DAT automatically
    # Look for it in the docked list
    docked = script_op.docked
    if docked:
        callbacks_dat = docked[0]
        callbacks_dat.text = code
    else:
        # Create a Text DAT and set it as callbacks
        dat = container.create(textDAT, name + '_callbacks')
        dat.text = code
        dat.dock = script_op
        script_op.par.callbacks = dat.path
        dat.nodeX = script_op.nodeX + 200
        dat.nodeY = script_op.nodeY


# ============================================
# MAIN BUILD
# ============================================

def build_all():
    """Build the complete Feedback visualization network."""
    print("=" * 50)
    print("FEEDBACK VISUALIZATION — Building network...")
    print("=" * 50)

    # Create container
    container = get_or_create_container(BASE_PATH, CONTAINER_NAME)
    print(f"[OK] Container: {container.path}")

    # OSC input
    osc = build_osc_input(container)
    print(f"[OK] OSC In: port {OSC_PORT}")

    # P1: Lorenz
    lorenz_geo, lorenz_head = build_lorenz(container, osc)
    print("[OK] P1: Lorenz attractor trail")

    # P3: Kuramoto
    (kura_script, kura_code, kura_shuffle, shuffle_code,
     kura_geo, ring_geo) = build_kuramoto(container, osc)
    write_callbacks(container, kura_script, kura_code, 'kura')
    write_callbacks(container, kura_shuffle, shuffle_code, 'kura_shuffle')
    print("[OK] P3: Kuramoto phase ring")

    # P4: Swarm
    swarm_script, swarm_code, swarm_geo = build_swarm(container, osc)
    write_callbacks(container, swarm_script, swarm_code, 'swarm')
    print("[OK] P4: Swarm particle field")

    # Render pipeline
    all_geos = [lorenz_geo, lorenz_head, kura_geo, ring_geo, swarm_geo]
    render, out = build_render(container, all_geos)
    print("[OK] Render pipeline with bloom")

    # Layout: spread container view
    container.par.viewerwidth = 1920
    container.par.viewerheight = 1080

    print("")
    print("=" * 50)
    print("BUILD COMPLETE")
    print(f"Network: {container.path}")
    print(f"Output:  {out.path}")
    print("")
    print("Next steps:")
    print("  1. Open Max, load the Feedback patch")
    print("  2. Enable OSC output to port 7000")
    print("  3. Start the Lorenz/Kuramoto/Swarm engines")
    print("  4. Watch this network come alive")
    print("")
    print("Camera is at z=30, looking at origin.")
    print("Lorenz = left (amber trail)")
    print("Kuramoto = center (ring of dots)")
    print("Swarm = right (colored particles)")
    print("=" * 50)


# ============================================
# RUN
# ============================================

build_all()
