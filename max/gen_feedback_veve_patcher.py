#!/usr/bin/env python3
"""
Generate feedback_veve.maxpat — the master Max patcher for the Feedback
veve-topology Kuramoto→Resonator instrument.

Signal flow:
  buffer~ veve_adj ← js veve_loader.js ← umenu (6 presets)
  K/tempo/trig_width → gen~ kuramoto_veve (14 outs)
  kuramoto out0-5 (triggers) → gen~ resonator_ensemble in0-5
  root/flex/tuning/drive → gen~ resonator_ensemble
  resonator out0/1 (stereo) → gain → dac~ 1 2
  r/phases/veve_preset → snapshot~ → node.script osc_send.js → port 7000
"""

import json
import os

# ============================================
# HELPERS
# ============================================

def box(id, maxclass, text=None, numinlets=1, numoutlets=0,
        outlettype=None, patching_rect=None, **kwargs):
    """Create a Max box dict."""
    b = {
        "id": id,
        "maxclass": maxclass,
        "numinlets": numinlets,
        "numoutlets": numoutlets,
    }
    if outlettype is not None:
        b["outlettype"] = outlettype
    if text is not None:
        b["text"] = text
    if patching_rect is not None:
        b["patching_rect"] = patching_rect
    b.update(kwargs)
    return {"box": b}


def dial(id, short, long_name, pmin, pmax, init, x, y,
         param_type=0, unitstyle=1, presentation=False, pres_rect=None):
    """Create a live.dial box."""
    b = {
        "id": id,
        "maxclass": "live.dial",
        "numinlets": 1,
        "numoutlets": 2,
        "outlettype": ["", "float"],
        "parameter_enable": 1,
        "patching_rect": [x, y, 50.0, 48.0],
        "saved_attribute_attributes": {
            "valueof": {
                "parameter_longname": long_name,
                "parameter_shortname": short,
                "parameter_type": param_type,
                "parameter_mmin": pmin,
                "parameter_mmax": pmax,
                "parameter_initial": [init],
                "parameter_initial_enable": 1,
                "parameter_unitstyle": unitstyle,
            }
        },
    }
    if presentation:
        b["presentation"] = 1
        if pres_rect:
            b["presentation_rect"] = pres_rect
    return {"box": b}


def wire(src_id, src_out, dst_id, dst_in):
    """Create a patchline dict."""
    return {
        "patchline": {
            "source": [src_id, src_out],
            "destination": [dst_id, dst_in],
        }
    }


# ============================================
# BUILD PATCHER
# ============================================

boxes = []
lines = []

# ------------------------------------------
# 1. HEADER
# ------------------------------------------

boxes.append(box(
    "obj-title", "comment",
    text=(
        "FEEDBACK \u2014 VEVE TOPOLOGY INSTRUMENT\n"
        "\n"
        "Kuramoto coupled oscillators with veve adjacency matrices\n"
        "drive 6 heterogeneous Karplus-Strong resonators.\n"
        "19 African tuning systems. OSC \u2192 TouchDesigner (port 7000).\n"
        "\n"
        "1. Turn on ezdac~\n"
        "2. Select veve preset (topology)\n"
        "3. Adjust K (coupling) \u2014 sweet spot 0.3-0.7\n"
        "4. Adjust Root, Tuning, Drive"
    ),
    patching_rect=[15, 15, 420, 150],
    fontsize=12.0,
    linecount=10,
))

boxes.append(box(
    "obj-ezdac", "ezdac~",
    numinlets=2, numoutlets=0,
    patching_rect=[15, 180, 45, 45],
    presentation=1,
    presentation_rect=[10, 10, 45, 45],
))

boxes.append(box(
    "obj-loadbang", "newobj",
    text="loadbang",
    numinlets=1, numoutlets=1,
    outlettype=["bang"],
    patching_rect=[200, 180, 55, 22],
))

boxes.append(box(
    "obj-startdsp", "message",
    text="startwindow",
    numinlets=2, numoutlets=1,
    outlettype=[""],
    patching_rect=[200, 210, 75, 22],
))

boxes.append(box(
    "obj-dac-msg", "newobj",
    text="dac~",
    numinlets=1, numoutlets=0,
    patching_rect=[200, 240, 35, 22],
))

# loadbang → startwindow → dac~
lines.append(wire("obj-loadbang", 0, "obj-startdsp", 0))
lines.append(wire("obj-startdsp", 0, "obj-dac-msg", 0))

# ------------------------------------------
# 2. VEVE PRESET SECTION
# ------------------------------------------

boxes.append(box(
    "obj-comment-veve", "comment",
    text="\u2500\u2500 VEVE TOPOLOGY (adjacency matrix) \u2500\u2500",
    patching_rect=[15, 275, 350, 20],
    fontface=1, fontsize=14.0,
))

boxes.append(box(
    "obj-veve-buf", "newobj",
    text="buffer~ veve_adj 6 6",
    numinlets=1, numoutlets=2,
    outlettype=["float", "bang"],
    patching_rect=[15, 305, 130, 22],
))

boxes.append(box(
    "obj-veve-loader", "newobj",
    text="js veve_loader.js",
    numinlets=1, numoutlets=2,
    outlettype=["", ""],
    patching_rect=[160, 305, 110, 22],
))

# umenu for preset selection
umenu_items = [
    "All-to-all",
    "Legba Carrefour",
    "Carrefour Diamond",
    "Ferraille",
    "Ogou Bhathalah",
    "Legba co-sou",
]
boxes.append(box(
    "obj-veve-menu", "umenu",
    numinlets=1, numoutlets=3,
    outlettype=["int", "", ""],
    patching_rect=[290, 305, 140, 22],
    items=umenu_items,
    presentation=1,
    presentation_rect=[70, 10, 140, 22],
))

# Label for menu
boxes.append(box(
    "obj-veve-label", "comment",
    text="Veve:",
    patching_rect=[290, 288, 40, 18],
    fontsize=11.0,
))

# "init" message (sent on loadbang)
boxes.append(box(
    "obj-veve-init", "message",
    text="init",
    numinlets=2, numoutlets=1,
    outlettype=[""],
    patching_rect=[160, 280, 35, 22],
))

# Status display from veve_loader (outlet 0: "loaded <idx> <name>")
boxes.append(box(
    "obj-veve-status", "message",
    text="",
    numinlets=2, numoutlets=1,
    outlettype=[""],
    patching_rect=[160, 335, 180, 22],
))

# Wiring: loadbang → init → js veve_loader
lines.append(wire("obj-loadbang", 0, "obj-veve-init", 0))
lines.append(wire("obj-veve-init", 0, "obj-veve-loader", 0))

# umenu → js veve_loader (int index triggers load)
lines.append(wire("obj-veve-menu", 0, "obj-veve-loader", 0))

# js veve_loader outlet 0 → status display
lines.append(wire("obj-veve-loader", 0, "obj-veve-status", 1))

# ------------------------------------------
# 3. KURAMOTO CONTROLS
# ------------------------------------------

boxes.append(box(
    "obj-comment-kuramoto", "comment",
    text="\u2500\u2500 KURAMOTO COUPLED RHYTHM ENGINE \u2500\u2500",
    patching_rect=[15, 370, 400, 20],
    fontface=1, fontsize=14.0,
))

Y_K = 400
boxes.append(dial("obj-K", "K", "K", 0.0, 2.0, 0.5, 15, Y_K,
                   presentation=True, pres_rect=[10, 50, 50, 48]))
boxes.append(dial("obj-tempo", "Tempo", "Tempo", 30.0, 300.0, 120, 80, Y_K,
                   unitstyle=4,
                   presentation=True, pres_rect=[70, 50, 50, 48]))
boxes.append(dial("obj-trigwidth", "Trig", "TrigWidth", 0.0001, 0.05, 0.001, 145, Y_K,
                   presentation=True, pres_rect=[130, 50, 50, 48]))

# Prepend objects for Kuramoto params
for param, pid, x in [("K", "obj-K-prep", 15),
                       ("tempo", "obj-tempo-prep", 80),
                       ("trig_width", "obj-trig-prep", 145)]:
    boxes.append(box(
        pid, "newobj",
        text=f"prepend {param}",
        numinlets=1, numoutlets=1,
        outlettype=[""],
        patching_rect=[x, Y_K + 55, max(len(f"prepend {param}") * 7, 55), 22],
    ))

# Dial → prepend wiring
lines.append(wire("obj-K", 0, "obj-K-prep", 0))
lines.append(wire("obj-tempo", 0, "obj-tempo-prep", 0))
lines.append(wire("obj-trigwidth", 0, "obj-trig-prep", 0))

# ------------------------------------------
# 4. KURAMOTO ENGINE
# ------------------------------------------

kuramoto_outs = 14
boxes.append(box(
    "obj-kuramoto", "newobj",
    text="gen~ @gen kuramoto_veve",
    numinlets=1,
    numoutlets=kuramoto_outs,
    outlettype=["signal"] * kuramoto_outs,
    patching_rect=[15, 490, 560, 22],
))

# Prepend → kuramoto
lines.append(wire("obj-K-prep", 0, "obj-kuramoto", 0))
lines.append(wire("obj-tempo-prep", 0, "obj-kuramoto", 0))
lines.append(wire("obj-trig-prep", 0, "obj-kuramoto", 0))

# ------------------------------------------
# 5. RESONATOR CONTROLS
# ------------------------------------------

boxes.append(box(
    "obj-comment-resonator", "comment",
    text="\u2500\u2500 RESONATOR ENSEMBLE (6 voices, 19 tuning systems) \u2500\u2500",
    patching_rect=[15, 525, 450, 20],
    fontface=1, fontsize=14.0,
))

Y_R = 555
boxes.append(dial("obj-root", "Root", "Root", 20.0, 880.0, 110, 15, Y_R,
                   unitstyle=3,
                   presentation=True, pres_rect=[10, 110, 50, 48]))
boxes.append(dial("obj-flex", "Flex", "Flex", 0.0, 1.0, 0.5, 80, Y_R,
                   presentation=True, pres_rect=[70, 110, 50, 48]))
boxes.append(dial("obj-tuning", "Tuning", "Tuning", 0, 18, 0, 145, Y_R,
                   param_type=1, unitstyle=0,
                   presentation=True, pres_rect=[130, 110, 50, 48]))
boxes.append(dial("obj-drive", "Drive", "Drive", 0.0, 1.0, 0.5, 210, Y_R,
                   presentation=True, pres_rect=[190, 110, 50, 48]))

# Prepend objects for resonator params
for param, pid, x in [("root", "obj-root-prep", 15),
                       ("flex", "obj-flex-prep", 80),
                       ("tuning_system", "obj-tuning-prep", 145),
                       ("drive", "obj-drive-prep", 210)]:
    boxes.append(box(
        pid, "newobj",
        text=f"prepend {param}",
        numinlets=1, numoutlets=1,
        outlettype=[""],
        patching_rect=[x, Y_R + 55, max(len(f"prepend {param}") * 7, 55), 22],
    ))

# Dial → prepend
lines.append(wire("obj-root", 0, "obj-root-prep", 0))
lines.append(wire("obj-flex", 0, "obj-flex-prep", 0))
lines.append(wire("obj-tuning", 0, "obj-tuning-prep", 0))
lines.append(wire("obj-drive", 0, "obj-drive-prep", 0))

# ------------------------------------------
# 6. RESONATOR ENGINE
# ------------------------------------------

boxes.append(box(
    "obj-resonator", "newobj",
    text="gen~ @gen resonator_ensemble",
    numinlets=6,
    numoutlets=2,
    outlettype=["signal", "signal"],
    patching_rect=[15, 645, 560, 22],
))

# Kuramoto triggers (out0-5) → resonator (in0-5)
for i in range(6):
    lines.append(wire("obj-kuramoto", i, "obj-resonator", i))

# Resonator params (messages go to inlet 0)
lines.append(wire("obj-root-prep", 0, "obj-resonator", 0))
lines.append(wire("obj-flex-prep", 0, "obj-resonator", 0))
lines.append(wire("obj-tuning-prep", 0, "obj-resonator", 0))
lines.append(wire("obj-drive-prep", 0, "obj-resonator", 0))

# ------------------------------------------
# 7. OUTPUT
# ------------------------------------------

boxes.append(box(
    "obj-comment-output", "comment",
    text="\u2500\u2500 OUTPUT \u2500\u2500",
    patching_rect=[15, 680, 200, 20],
    fontface=1, fontsize=14.0,
))

boxes.append(dial("obj-master", "Vol", "Master", 0.0, 1.0, 0.7, 15, 710,
                   presentation=True, pres_rect=[10, 170, 50, 48]))

boxes.append(box(
    "obj-gain-L", "newobj",
    text="*~ 0.7",
    numinlets=2, numoutlets=1,
    outlettype=["signal"],
    patching_rect=[15, 770, 45, 22],
))

boxes.append(box(
    "obj-gain-R", "newobj",
    text="*~ 0.7",
    numinlets=2, numoutlets=1,
    outlettype=["signal"],
    patching_rect=[115, 770, 45, 22],
))

boxes.append(box(
    "obj-output-dac", "newobj",
    text="dac~ 1 2",
    numinlets=2, numoutlets=0,
    patching_rect=[15, 810, 55, 22],
))

boxes.append(box(
    "obj-meter-L", "meter~",
    numinlets=1, numoutlets=1,
    outlettype=["float"],
    patching_rect=[15, 845, 200, 20],
    presentation=1, presentation_rect=[10, 230, 200, 20],
))

boxes.append(box(
    "obj-meter-R", "meter~",
    numinlets=1, numoutlets=1,
    outlettype=["float"],
    patching_rect=[230, 845, 200, 20],
    presentation=1, presentation_rect=[220, 230, 200, 20],
))

# Resonator → gain → dac + meters
lines.append(wire("obj-resonator", 0, "obj-gain-L", 0))
lines.append(wire("obj-resonator", 1, "obj-gain-R", 0))
lines.append(wire("obj-master", 0, "obj-gain-L", 1))
lines.append(wire("obj-master", 0, "obj-gain-R", 1))
lines.append(wire("obj-gain-L", 0, "obj-output-dac", 0))
lines.append(wire("obj-gain-R", 0, "obj-output-dac", 1))
lines.append(wire("obj-gain-L", 0, "obj-ezdac", 0))
lines.append(wire("obj-gain-R", 0, "obj-ezdac", 1))
lines.append(wire("obj-gain-L", 0, "obj-meter-L", 0))
lines.append(wire("obj-gain-R", 0, "obj-meter-R", 0))

# ------------------------------------------
# 8. OSC TO TOUCHDESIGNER
# ------------------------------------------

OSC_X = 700  # Right side of patcher

boxes.append(box(
    "obj-comment-osc", "comment",
    text="\u2500\u2500 OSC \u2192 TOUCHDESIGNER (port 7000) \u2500\u2500",
    patching_rect=[OSC_X, 370, 350, 20],
    fontface=1, fontsize=14.0,
))

# Metro for snapshot triggers
boxes.append(box(
    "obj-osc-metro", "newobj",
    text="metro 50",
    numinlets=2, numoutlets=1,
    outlettype=["bang"],
    patching_rect=[OSC_X, 400, 55, 22],
))

# loadbang → metro
lines.append(wire("obj-loadbang", 0, "obj-osc-metro", 0))

# --- OSC: r (order parameter) --- out6
boxes.append(box(
    "obj-r-snap", "newobj",
    text="snapshot~ 50",
    numinlets=2, numoutlets=1,
    outlettype=["float"],
    patching_rect=[OSC_X, 435, 72, 22],
))

boxes.append(box(
    "obj-r-prep", "newobj",
    text="prepend kuramoto_r",
    numinlets=1, numoutlets=1,
    outlettype=[""],
    patching_rect=[OSC_X, 465, 110, 22],
))

# kuramoto out6 → snapshot~, metro → snapshot~
lines.append(wire("obj-kuramoto", 6, "obj-r-snap", 0))
lines.append(wire("obj-osc-metro", 0, "obj-r-snap", 0))
lines.append(wire("obj-r-snap", 0, "obj-r-prep", 0))

# Also display r value
boxes.append(box(
    "obj-r-display", "flonum",
    numinlets=1, numoutlets=2,
    outlettype=["", "bang"],
    patching_rect=[OSC_X + 120, 435, 55, 22],
    presentation=1, presentation_rect=[250, 55, 55, 22],
))
boxes.append(box(
    "obj-r-label", "comment",
    text="r:",
    patching_rect=[OSC_X + 120, 418, 20, 18],
    fontsize=11.0,
    presentation=1, presentation_rect=[235, 57, 20, 18],
))
lines.append(wire("obj-r-snap", 0, "obj-r-display", 0))

# --- OSC: phases (6 floats) --- out7-12
Y_PHASE = 500
for i in range(6):
    snap_id = f"obj-phase-snap{i+1}"
    boxes.append(box(
        snap_id, "newobj",
        text="snapshot~ 50",
        numinlets=2, numoutlets=1,
        outlettype=["float"],
        patching_rect=[OSC_X + i * 70, Y_PHASE, 65, 22],
    ))
    # kuramoto out7+i → snapshot~, metro → snapshot~
    lines.append(wire("obj-kuramoto", 7 + i, snap_id, 0))
    lines.append(wire("obj-osc-metro", 0, snap_id, 0))

# pak to combine 6 phases into a list
boxes.append(box(
    "obj-phase-pak", "newobj",
    text="pak 0. 0. 0. 0. 0. 0.",
    numinlets=6, numoutlets=1,
    outlettype=[""],
    patching_rect=[OSC_X, Y_PHASE + 35, 200, 22],
))

for i in range(6):
    lines.append(wire(f"obj-phase-snap{i+1}", 0, "obj-phase-pak", i))

boxes.append(box(
    "obj-phase-prep", "newobj",
    text="prepend kuramoto_phases",
    numinlets=1, numoutlets=1,
    outlettype=[""],
    patching_rect=[OSC_X, Y_PHASE + 65, 140, 22],
))

lines.append(wire("obj-phase-pak", 0, "obj-phase-prep", 0))

# --- OSC: veve preset --- out13
Y_VEVE_OSC = Y_PHASE + 100
boxes.append(box(
    "obj-veve-snap", "newobj",
    text="snapshot~ 50",
    numinlets=2, numoutlets=1,
    outlettype=["float"],
    patching_rect=[OSC_X, Y_VEVE_OSC, 72, 22],
))

boxes.append(box(
    "obj-veve-prep", "newobj",
    text="prepend veve_preset",
    numinlets=1, numoutlets=1,
    outlettype=[""],
    patching_rect=[OSC_X, Y_VEVE_OSC + 30, 110, 22],
))

# kuramoto out13 → snapshot~, metro → snapshot~
lines.append(wire("obj-kuramoto", 13, "obj-veve-snap", 0))
lines.append(wire("obj-osc-metro", 0, "obj-veve-snap", 0))
lines.append(wire("obj-veve-snap", 0, "obj-veve-prep", 0))

# --- Node.js OSC sender ---
Y_OSC_OUT = Y_VEVE_OSC + 70
boxes.append(box(
    "obj-osc-node", "newobj",
    text="node.script osc_send.js",
    numinlets=1, numoutlets=2,
    outlettype=["", ""],
    patching_rect=[OSC_X, Y_OSC_OUT, 140, 22],
))

# All OSC prepend outputs → node.script
lines.append(wire("obj-r-prep", 0, "obj-osc-node", 0))
lines.append(wire("obj-phase-prep", 0, "obj-osc-node", 0))
lines.append(wire("obj-veve-prep", 0, "obj-osc-node", 0))

# ============================================
# ASSEMBLE PATCHER
# ============================================

patcher = {
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 8,
            "minor": 6,
            "revision": 0,
            "architecture": "x64",
            "modernui": 1,
        },
        "classnamespace": "box",
        "rect": [34, 76, 1400, 900],
        "bglocked": 0,
        "openinpresentation": 1,
        "default_fontsize": 12.0,
        "default_fontface": 0,
        "default_fontname": "Arial",
        "gridonopen": 1,
        "gridsize": [15.0, 15.0],
        "gridsnaponopen": 1,
        "objectsnaponopen": 1,
        "statusbarvisible": 2,
        "toolbarvisible": 1,
        "boxes": boxes,
        "lines": lines,
    }
}

# ============================================
# WRITE OUTPUT
# ============================================

output_path = os.path.join(os.path.dirname(os.path.abspath(__file__)),
                           "feedback_veve.maxpat")

with open(output_path, "w") as f:
    json.dump(patcher, f, indent="\t")

print(f"Generated: {output_path}")
print(f"  Boxes:      {len(boxes)}")
print(f"  Patchlines: {len(lines)}")
print(f"  Sections:   Header, Veve, Kuramoto, Resonator, Output, OSC")
