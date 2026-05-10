# osc_update — per-frame driver for chaos_viz + lusona progress
# Reads custom params on feedback_viz COMP + OSC In CHOP
import time as _time
import math as _math

_prev_x = 0.0
_prev_y = 0.0
_prev_z = 0.0
_lusona_progress = 0.0
_lusona_visible = 2
_lusona_preset = 3
_lusona_hold_timer = 0.0
_lusona_total_pts = 141
_last_veve = -1
_last_panel_preset = -1

def _set_lusona_preset(preset_idx, visible_count=2):
    global _lusona_total_pts, _lusona_preset, _lusona_visible
    _lusona_preset = preset_idx % 6
    engine = op('/project1/feedback_viz/lusona_engine')
    if engine is None:
        return
    npts, r, c, nm, vis = engine.module.update_visibility(_lusona_preset, visible_count, 0.08)
    _lusona_total_pts = npts
    _lusona_visible = vis
    viz = op('/project1/feedback_viz/chaos_viz')
    if viz is not None:
        viz.par.vec2valuex = float(r)
        viz.par.vec2valuey = float(c)
        viz.par.vec2valuez = 0.08
        viz.par.vec2valuew = float(npts)

def _update_progress(loudness, draw_speed, hold_time, auto_cycle):
    global _lusona_progress, _lusona_visible, _lusona_hold_timer
    
    if _lusona_progress >= 1.0:
        if not auto_cycle:
            return
        _lusona_hold_timer += 1.0 / 30.0
        if _lusona_hold_timer > hold_time:
            _lusona_hold_timer = 0.0
            _lusona_progress = 0.0
            _lusona_visible = 2
            _set_lusona_preset((_lusona_preset + 1) % 6, 2)
        return
    
    speed = draw_speed + loudness * draw_speed * 4.0
    _lusona_progress = min(_lusona_progress + speed, 1.0)
    
    new_visible = max(2, int(_lusona_progress * _lusona_total_pts))
    if new_visible >= _lusona_visible + 3 or _lusona_progress >= 1.0:
        if new_visible != _lusona_visible:
            _lusona_visible = new_visible
            engine = op('/project1/feedback_viz/lusona_engine')
            if engine is not None:
                engine.module.update_visibility(_lusona_preset, new_visible, 0.08)

def onFrameStart(frame):
    global _prev_x, _prev_y, _prev_z, _last_veve, _last_panel_preset
    global _lusona_progress, _lusona_visible, _lusona_hold_timer
    
    comp = op('/project1/feedback_viz')
    s = comp.storage
    s['_dbg_frame_count'] = s.get('_dbg_frame_count', 0) + 1
    
    # --- Read custom params ---
    line_bright = comp.par.Linebrightness.eval()
    line_width = comp.par.Linewidth.eval()
    dot_bright = comp.par.Dotbrightness.eval()
    head_glow_p = comp.par.Headglow.eval()
    draw_speed = comp.par.Drawspeed.eval()
    hold_time = comp.par.Holdtime.eval()
    panel_preset = comp.par.Lusonapreset.eval()
    lusona_on = comp.par.Lusonaon.eval()
    auto_cycle = comp.par.Autocycle.eval()
    cymatic_bright = comp.par.Cymaticbrightness.eval()
    chaos_scale = comp.par.Chaosscale.eval()
    cymatic_on = comp.par.Cymaticon.eval()
    master_bright = comp.par.Masterbrightness.eval()
    vignette = comp.par.Vignette.eval()
    reset = comp.par.Resetprogress.eval()
    
    # --- Reset pulse ---
    if reset:
        _lusona_progress = 0.0
        _lusona_visible = 2
        _lusona_hold_timer = 0.0
        _set_lusona_preset(_lusona_preset, 2)
    
    # --- Panel preset change ---
    if panel_preset != _last_panel_preset:
        _last_panel_preset = panel_preset
        _lusona_progress = 0.0
        _lusona_hold_timer = 0.0
        _lusona_visible = 2
        _set_lusona_preset(panel_preset, 2)
    
    # --- OSC In ---
    osc = op('/project1/feedback_viz/osc_in')
    if osc is not None and osc.numChans > 0:
        for i in range(osc.numChans):
            ch = osc.chan(i)
            name = ch.name
            val = ch.eval()
            if name == 'x' or name.endswith('/x'):
                s['x'] = val
            elif name == 'y' or name.endswith('/y'):
                s['y'] = val
            elif name == 'z' or name.endswith('/z'):
                s['z'] = val
            elif 'amplitude' in name or 'loudness' in name:
                s['loudness'] = val
            elif 'kuramoto' in name:
                s['kuramoto_r'] = val
            elif 'gain' in name:
                s['chaos_gain'] = val
            elif 'veve' in name or 'preset' in name:
                veve_val = int(val)
                if veve_val != _last_veve and veve_val >= 0:
                    _last_veve = veve_val
                    _lusona_progress = 0.0
                    _lusona_hold_timer = 0.0
                    _lusona_visible = 2
                    _set_lusona_preset(veve_val, 2)
                    comp.par.Lusonapreset = veve_val
    
    raw_x = s.get('x', 0.0)
    raw_y = s.get('y', 0.0)
    raw_z = s.get('z', 0.0)
    raw_loud = s.get('loudness', 0.0)
    loudness = min(abs(raw_loud) * 3.0, 1.0)
    
    dx = abs(raw_x - _prev_x)
    dy = abs(raw_y - _prev_y)
    dz = abs(raw_z - _prev_z)
    velocity = _math.sqrt(dx*dx + dy*dy + dz*dz)
    if 'kuramoto_r' not in s:
        s['kuramoto_r'] = 1.0 - min(velocity * 80.0, 1.0)
    _prev_x, _prev_y, _prev_z = raw_x, raw_y, raw_z
    
    # --- Lusona progress ---
    if lusona_on:
        _update_progress(loudness, draw_speed, hold_time, auto_cycle)
    
    # --- Drive chaos_viz vec params ---
    viz = op('/project1/feedback_viz/chaos_viz')
    if viz is not None:
        # vec0: uChaos (xyz, loudness)
        viz.par.vec0valuex = raw_x * chaos_scale
        viz.par.vec0valuey = raw_y * chaos_scale
        viz.par.vec0valuez = raw_z * chaos_scale
        viz.par.vec0valuew = loudness
        
        # vec1: uParams1 (kuramotoR, time=expr, chaosGain, progress)
        viz.par.vec1valuex = s.get('kuramoto_r', 0.5)
        viz.par.vec1valuez = s.get('chaos_gain', 0.5)
        viz.par.vec1valuew = _lusona_progress if lusona_on else 0.0
        
        # vec3: uParams3 (cymaticBright, lineBright, lineWidth, dotBright)
        viz.par.vec3valuex = cymatic_bright if cymatic_on else 0.0
        viz.par.vec3valuey = line_bright if lusona_on else 0.0
        viz.par.vec3valuez = line_width
        viz.par.vec3valuew = dot_bright if lusona_on else 0.0
        
        # vec4: uParams4 (headGlow, headX, headY, masterBright)
        head_x = s.get('lusona_head_x', 0.5)
        head_y = s.get('lusona_head_y', 0.5)
        glow = head_glow_p if (_lusona_progress < 1.0 and lusona_on) else 0.0
        viz.par.vec4valuex = glow
        viz.par.vec4valuey = head_x
        viz.par.vec4valuez = head_y
        viz.par.vec4valuew = master_bright
        
        # vec5: uParams5 (vignette, 0, 0, 0)
        viz.par.vec5valuex = vignette
    
    # --- Constant CHOP ---
    c = op('/project1/feedback_viz/osc_const')
    if c is not None:
        c.par.value0 = raw_x * chaos_scale
        c.par.value1 = raw_y * chaos_scale
        c.par.value2 = raw_z * chaos_scale
        c.par.value3 = loudness
    
    # --- ComfyUI bridge ---
    if s.get('comfyui_enabled', False):
        try:
            bridge = op('/project1/feedback_viz/comfyui_bridge')
            if bridge is not None:
                bridge.module.update()
        except:
            pass

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
