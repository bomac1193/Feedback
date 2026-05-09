# build_alien_generators.py
# Creates a baseCOMP tool with 4 alien GLSL generators, custom params, and clean I/O
# Execute in TD: exec(open(r'\\wsl$\Ubuntu\home\sphinxy\Feedback\td\build_alien_generators.py').read())
# Or via MCP: execute_python_script with this file's contents

COMP_NAME = 'alien_generators'
BASE_PATH = '/project1'
RENDER_RES = (1920, 1080)

# Existing textDATs with shader code (will copy from these)
SHADER_SOURCES = {
    'bloom':  '/project1/alien_bloom_pixel',
    'decay':  '/project1/chem_decay_pixel',
    'chrome': '/project1/liquid_chrome_pixel',
    'molten': '/project1/molten_terrain_pixel',
}

GENERATORS = [
    {'key': 'bloom',  'label': 'Alien Bloom'},
    {'key': 'decay',  'label': 'Chemical Decay'},
    {'key': 'chrome', 'label': 'Liquid Chrome'},
    {'key': 'molten', 'label': 'Molten Terrain'},
]


def wire(src, dst, src_out=0, dst_in=0):
    src.outputConnectors[src_out].connect(dst.inputConnectors[dst_in])


def build_common_page(comp):
    page = comp.appendCustomPage('Common')

    m = page.appendMenu('Mode', label='Generator Mode')[0]
    m.menuNames = ['alien_bloom', 'chem_decay', 'liquid_chrome', 'molten_terrain']
    m.menuLabels = ['Alien Bloom', 'Chemical Decay', 'Liquid Chrome', 'Molten Terrain']
    m.default = 'alien_bloom'

    s = page.appendFloat('Speed', label='Anim Speed')[0]
    s.default = 1.0
    s.min = 0.1
    s.max = 5.0
    s.clampMin = True
    s.clampMax = True

    ag = page.appendFloat('Audiogain', label='Audio Gain')[0]
    ag.default = 1.0
    ag.min = 0.0
    ag.max = 3.0
    ag.clampMin = True
    ag.clampMax = True

    bp = page.appendToggle('Bypass', label='Bypass')[0]
    bp.default = False


def build_bloom_page(comp):
    page = comp.appendCustomPage('Bloom')

    p = page.appendFloat('Bpetalcount', label='Petal Count')[0]
    p.default = 6.0; p.min = 3.0; p.max = 12.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Blayers', label='Layers')[0]
    p.default = 3.0; p.min = 1.0; p.max = 5.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Bbloom', label='Bloom Amount')[0]
    p.default = 0.5; p.min = 0.0; p.max = 1.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Bsymmetry', label='Symmetry')[0]
    p.default = 0.5; p.min = 0.0; p.max = 1.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Bhuebase', label='Hue Base')[0]
    p.default = 120.0; p.min = 0.0; p.max = 360.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Bsaturation', label='Saturation')[0]
    p.default = 1.2; p.min = 0.0; p.max = 2.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Bglowpower', label='Glow Power')[0]
    p.default = 2.0; p.min = 0.5; p.max = 5.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Bedgewidth', label='Edge Width')[0]
    p.default = 2.0; p.min = 0.5; p.max = 5.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Bbreathe', label='Breathe')[0]
    p.default = 0.3; p.min = 0.0; p.max = 1.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Bwarp', label='Warp')[0]
    p.default = 0.8; p.min = 0.0; p.max = 2.0; p.clampMin = True; p.clampMax = True


def build_decay_page(comp):
    page = comp.appendCustomPage('Decay')

    p = page.appendFloat('Dcomplexity', label='Complexity')[0]
    p.default = 3.0; p.min = 1.0; p.max = 5.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Dsharpness', label='Sharpness')[0]
    p.default = 0.5; p.min = 0.0; p.max = 1.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Dbands', label='Bands')[0]
    p.default = 4.0; p.min = 2.0; p.max = 8.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Derosion', label='Erosion')[0]
    p.default = 0.3; p.min = 0.0; p.max = 1.0; p.clampMin = True; p.clampMax = True

    m = page.appendMenu('Dpalette', label='Palette')[0]
    m.menuNames = ['psychedelic', 'chemical', 'erosion', 'film_decay', 'bioluminescent', 'infrared']
    m.menuLabels = ['Psychedelic', 'Chemical', 'Erosion', 'Film Decay', 'Bioluminescent', 'Infrared']
    m.default = 'psychedelic'

    p = page.appendFloat('Dsaturation', label='Saturation')[0]
    p.default = 1.3; p.min = 0.0; p.max = 2.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Dbrightness', label='Brightness')[0]
    p.default = 1.0; p.min = 0.0; p.max = 2.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Dcontrast', label='Contrast')[0]
    p.default = 1.5; p.min = 0.5; p.max = 3.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Dflow', label='Flow')[0]
    p.default = 0.5; p.min = 0.0; p.max = 2.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Dturbulence', label='Turbulence')[0]
    p.default = 1.0; p.min = 0.0; p.max = 2.0; p.clampMin = True; p.clampMax = True


def build_chrome_page(comp):
    page = comp.appendCustomPage('Chrome')

    p = page.appendFloat('Ccellscale', label='Cell Scale')[0]
    p.default = 8.0; p.min = 2.0; p.max = 20.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Cmetallic', label='Metallic')[0]
    p.default = 0.7; p.min = 0.0; p.max = 1.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Ciridescence', label='Iridescence')[0]
    p.default = 1.0; p.min = 0.0; p.max = 2.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Csmear', label='Smear')[0]
    p.default = 0.3; p.min = 0.0; p.max = 1.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Chueshift', label='Hue Shift')[0]
    p.default = 0.0; p.min = 0.0; p.max = 360.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Cwarmth', label='Warmth')[0]
    p.default = 0.5; p.min = 0.0; p.max = 1.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Cspecular', label='Specular')[0]
    p.default = 1.5; p.min = 0.0; p.max = 3.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Cdarkness', label='Darkness')[0]
    p.default = 0.3; p.min = 0.0; p.max = 1.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Cflowdir', label='Flow Direction')[0]
    p.default = 0.5; p.min = 0.0; p.max = 1.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Cripple', label='Ripple')[0]
    p.default = 0.5; p.min = 0.0; p.max = 2.0; p.clampMin = True; p.clampMax = True


def build_molten_page(comp):
    page = comp.appendCustomPage('Molten')

    p = page.appendFloat('Mcrackscale', label='Crack Scale')[0]
    p.default = 6.0; p.min = 2.0; p.max = 15.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Mheatintensity', label='Heat Intensity')[0]
    p.default = 1.5; p.min = 0.0; p.max = 3.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Mcrackdepth', label='Crack Depth')[0]
    p.default = 0.7; p.min = 0.0; p.max = 1.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Mflowrate', label='Flow Rate')[0]
    p.default = 0.5; p.min = 0.0; p.max = 2.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Mheathue', label='Heat Hue')[0]
    p.default = 20.0; p.min = 0.0; p.max = 60.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Mcoolhue', label='Cool Hue')[0]
    p.default = 240.0; p.min = 200.0; p.max = 300.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Memissive', label='Emissive')[0]
    p.default = 1.5; p.min = 0.0; p.max = 3.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Msmokedensity', label='Smoke Density')[0]
    p.default = 0.3; p.min = 0.0; p.max = 1.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Mpulse', label='Pulse')[0]
    p.default = 0.4; p.min = 0.0; p.max = 1.0; p.clampMin = True; p.clampMax = True

    p = page.appendFloat('Mturbulence', label='Turbulence')[0]
    p.default = 1.0; p.min = 0.0; p.max = 2.0; p.clampMin = True; p.clampMax = True


def configure_glsl(glsl, code_dat, in_top):
    glsl.par.resolutionw = RENDER_RES[0]
    glsl.par.resolutionh = RENDER_RES[1]
    glsl.par.outputresolution = 9   # Custom
    glsl.par.format = 26            # RGBA 16-bit float
    glsl.par.pixeldat = code_dat.path
    # vec4 uniform names (vec params always exist on glslTOP)
    glsl.par.vec0name = 'uControl'
    glsl.par.vec1name = 'uColor'
    glsl.par.vec2name = 'uAnim'
    glsl.par.vec3name = 'uAudio'
    # Time expression on uAnim.x
    glsl.par.vec2valuex.expr = 'absTime.seconds'
    glsl.par.vec2valuex.mode = 2    # expression
    # Speed default on uAnim.y
    glsl.par.vec2valuey = 1.0
    # Wire optional image input
    wire(in_top, glsl)


PARAM_DRIVER_CODE = """# param_driver - Execute DAT
# Routes custom params from parent baseCOMP to active GLSL TOP uniforms

_prev_mode = -1

def onFrameStart(frame):
    global _prev_mode
    p = parent()
    mode = p.par.Mode.menuIndex

    tops = [op('bloom_glsl'), op('decay_glsl'), op('chrome_glsl'), op('molten_glsl')]

    # Mode change: update switch
    if mode != _prev_mode:
        _prev_mode = mode
        op('gen_switch').par.index = mode

    # Bypass
    if p.par.Bypass.eval():
        op('bypass_switch').par.index = 1
        return
    else:
        op('bypass_switch').par.index = 0

    speed = p.par.Speed.eval()
    g = tops[mode]

    # Audio
    audio_gain = p.par.Audiogain.eval()
    audio = op('audio_null')
    bass = mid = high = overall = 0.0
    if audio.numChans >= 4:
        bass = audio[0].eval() * audio_gain
        mid = audio[1].eval() * audio_gain
        high = audio[2].eval() * audio_gain
        overall = audio[3].eval() * audio_gain
    elif audio.numChans >= 1:
        overall = audio[0].eval() * audio_gain

    # Shared: uAnim.y = speed, uAudio = vec3
    g.par.vec2valuey = speed
    g.par.vec3valuex = bass
    g.par.vec3valuey = mid
    g.par.vec3valuez = high
    g.par.vec3valuew = overall

    if mode == 0:  # Bloom
        g.par.vec0valuex = p.par.Bpetalcount.eval()
        g.par.vec0valuey = p.par.Blayers.eval()
        g.par.vec0valuez = p.par.Bbloom.eval()
        g.par.vec0valuew = p.par.Bsymmetry.eval()
        g.par.vec1valuex = p.par.Bhuebase.eval()
        g.par.vec1valuey = p.par.Bsaturation.eval()
        g.par.vec1valuez = p.par.Bglowpower.eval()
        g.par.vec1valuew = p.par.Bedgewidth.eval()
        g.par.vec2valuez = p.par.Bbreathe.eval()
        g.par.vec2valuew = p.par.Bwarp.eval()

    elif mode == 1:  # Decay
        g.par.vec0valuex = p.par.Dcomplexity.eval()
        g.par.vec0valuey = p.par.Dsharpness.eval()
        g.par.vec0valuez = p.par.Dbands.eval()
        g.par.vec0valuew = p.par.Derosion.eval()
        g.par.vec1valuex = float(p.par.Dpalette.menuIndex)
        g.par.vec1valuey = p.par.Dsaturation.eval()
        g.par.vec1valuez = p.par.Dbrightness.eval()
        g.par.vec1valuew = p.par.Dcontrast.eval()
        g.par.vec2valuez = p.par.Dflow.eval()
        g.par.vec2valuew = p.par.Dturbulence.eval()

    elif mode == 2:  # Chrome
        g.par.vec0valuex = p.par.Ccellscale.eval()
        g.par.vec0valuey = p.par.Cmetallic.eval()
        g.par.vec0valuez = p.par.Ciridescence.eval()
        g.par.vec0valuew = p.par.Csmear.eval()
        g.par.vec1valuex = p.par.Chueshift.eval()
        g.par.vec1valuey = p.par.Cwarmth.eval()
        g.par.vec1valuez = p.par.Cspecular.eval()
        g.par.vec1valuew = p.par.Cdarkness.eval()
        g.par.vec2valuez = p.par.Cflowdir.eval()
        g.par.vec2valuew = p.par.Cripple.eval()

    elif mode == 3:  # Molten
        g.par.vec0valuex = p.par.Mcrackscale.eval()
        g.par.vec0valuey = p.par.Mheatintensity.eval()
        g.par.vec0valuez = p.par.Mcrackdepth.eval()
        g.par.vec0valuew = p.par.Mflowrate.eval()
        g.par.vec1valuex = p.par.Mheathue.eval()
        g.par.vec1valuey = p.par.Mcoolhue.eval()
        g.par.vec1valuez = p.par.Memissive.eval()
        g.par.vec1valuew = p.par.Msmokedensity.eval()
        g.par.vec2valuez = p.par.Mpulse.eval()
        g.par.vec2valuew = p.par.Mturbulence.eval()


def onFrameEnd(frame):
    return

def onPlayStateChange(state):
    return

def onDeviceChange():
    return

def onProjectPreSave():
    return

def onProjectPostSave():
    return
"""


def build():
    base = op(BASE_PATH)

    # Destroy old comp if exists
    old = base.op(COMP_NAME)
    if old is not None:
        old.destroy()

    # Create baseCOMP
    comp = base.create('baseCOMP', COMP_NAME)
    comp.nodeX = 800
    comp.nodeY = 0

    # Build custom parameter pages
    build_common_page(comp)
    build_bloom_page(comp)
    build_decay_page(comp)
    build_chrome_page(comp)
    build_molten_page(comp)

    # --- Inputs ---
    in_top = comp.create('inTOP', 'in1')
    in_top.nodeX = 0
    in_top.nodeY = 400

    audio_in = comp.create('inCHOP', 'audio_in')
    audio_in.nodeX = 700
    audio_in.nodeY = 400

    audio_null = comp.create('nullCHOP', 'audio_null')
    audio_null.nodeX = 700
    audio_null.nodeY = 300
    wire(audio_in, audio_null)

    # --- Generators ---
    glsl_tops = []
    for i, gen in enumerate(GENERATORS):
        key = gen['key']
        x_pos = i * 250

        # TextDAT with shader code
        code_dat = comp.create('textDAT', key + '_code')
        code_dat.nodeX = x_pos
        code_dat.nodeY = 200
        code_dat.par.language = 'glsl'
        code_dat.par.extension = 'frag'

        # Copy shader from existing loose textDAT
        src_path = SHADER_SOURCES[key]
        src = op(src_path)
        if src is not None:
            code_dat.text = src.text

        # GLSL TOP
        glsl = comp.create('glslTOP', key + '_glsl')
        glsl.nodeX = x_pos
        glsl.nodeY = 0
        configure_glsl(glsl, code_dat, in_top)

        glsl_tops.append(glsl)

    # --- Switch TOP (generator select) ---
    gen_switch = comp.create('switchTOP', 'gen_switch')
    gen_switch.nodeX = 375
    gen_switch.nodeY = -200
    for i, g in enumerate(glsl_tops):
        wire(g, gen_switch, 0, i)
    gen_switch.par.index = 0

    # --- Bypass switch (0=gen output, 1=passthrough image) ---
    bypass_sw = comp.create('switchTOP', 'bypass_switch')
    bypass_sw.nodeX = 375
    bypass_sw.nodeY = -350
    wire(gen_switch, bypass_sw, 0, 0)
    wire(in_top, bypass_sw, 0, 1)
    bypass_sw.par.index = 0

    # --- Output ---
    out = comp.create('outTOP', 'out1')
    out.nodeX = 375
    out.nodeY = -500
    wire(bypass_sw, out)

    # --- Execute DAT (param driver) ---
    exe = comp.create('executeDAT', 'param_driver')
    exe.nodeX = 800
    exe.nodeY = 0
    exe.par.active = True
    exe.par.framestart = True
    exe.text = PARAM_DRIVER_CODE

    return comp


build()
