#!/usr/bin/env python3
"""Transform preset message box stacks into compact umenu dropdowns."""
import json
import copy

PATCH = "/mnt/d/Music/Max Msp/Projects/Feedback/max/step6_chaos_resonator.maxpat"

# --- Objects to REMOVE (varnames) ---
REMOVE = set()

# Rho presets
for i in range(1, 7):
    REMOVE.add(f"obj-rp{i}")
    REMOVE.add(f"obj-rp{i}-l")
REMOVE.update(["obj-rp-label", "obj-rp-label-send"])

# Chaos Gain
for i in range(1, 6):
    REMOVE.add(f"obj-cgp{i}")
    REMOVE.add(f"obj-cgp{i}-l")
REMOVE.update(["obj-cgp-label", "obj-cgp-label-send"])

# Glide
for i in range(1, 4):
    REMOVE.add(f"obj-gp{i}")
    REMOVE.add(f"obj-gp{i}-l")
REMOVE.update(["obj-gp-label", "obj-gp-label-send"])

# ADSR Presets
for i in range(1, 6):
    REMOVE.add(f"obj-ep{i}")
    REMOVE.add(f"obj-ep{i}-l")
REMOVE.update(["obj-ep-label", "obj-ep-label-send"])

# African Roots
for i in range(0, 6):
    REMOVE.add(f"obj-ar{i}")
    REMOVE.add(f"obj-ar{i}-l")
REMOVE.update(["obj-ar-label", "obj-ar-label-send"])

# Pattern Presets
for i in range(1, 9):
    REMOVE.add(f"obj-pp{i}")
    REMOVE.add(f"obj-pp{i}-l")
REMOVE.update(["obj-pp-label", "obj-pp-label-send"])

# Root Spring Presets
for i in range(1, 5):
    REMOVE.add(f"obj-rsp{i}")
    REMOVE.add(f"obj-rsp{i}-l")
REMOVE.update(["obj-rsp-preset-label", "obj-rsp-preset-label-send"])

# Tuning Systems (all message boxes + region labels)
for i in range(0, 19):
    REMOVE.add(f"obj-tsp-{i}")
    REMOVE.add(f"obj-tsp-{i}-l")
REMOVE.update([
    "obj-tsp-label", "obj-tsp-send",
    "obj-tsr-wes", "obj-tsr-man", "obj-tsr-cen", "obj-tsr-eas", "obj-tsr-sou"
])

# --- Umenu definitions ---
# (varname, label, x, y, width, items_list)
X_LABEL = 852
X_MENU = 945
MENU_W = 160
MENU_H = 20
ROW_H = 25
Y_START = 50

UMENUS = [
    ("pm-tuning", "Tuning", 0, [
        "Yoruba Pentatonic", "Dundun 3-Tone", "Balafon Equi-Penta",
        "Equi-Heptatonic 7-TET", "BaAka/Pygmy 5-TET", "Shona Nyamaropa",
        "Shona Gandanga", "Kora Silaba", "Kora Sauta", "Tizita Major",
        "Tizita Minor", "Bati", "Ambassel", "Anchihoye", "Amadinda",
        "Chopi Timbila", "San Musical Bow", "Wagogo Ilimba", "Igbo Pentatonic"
    ]),
    ("pm-pattern", "Pattern", 1, [
        "Bembe 12/8", "Shiko", "Poly 3:2", "Call/Response",
        "Gahu 15-step", "Son Clave 3:2", "Fume Fume", "Kassa"
    ]),
    ("pm-rho", "Rho", 2, [
        "Converging (20)", "Edge (24.74)", "Classic (28)",
        "Periodic (100)", "Stable (166)", "Bursts (50)"
    ]),
    ("pm-roots", "Root", 3, [
        "Dundun Low (61)", "Iya Ilu (82)", "Dundun Mid (125)",
        "Dundun High (172)", "Balafon (220)", "Agogo (350)"
    ]),
    ("pm-adsr", "ADSR", 4, [
        "Pluck", "Pad", "Swell", "Staccato", "Default"
    ]),
    ("pm-chaos", "Chaos", 5, [
        "Whisper (0.002)", "Gentle (0.005)", "Balanced (0.01)",
        "Aggressive (0.03)", "Full (0.1)"
    ]),
    ("pm-spring", "Spring", 6, [
        "Tight", "Elastic", "Slow", "Latch"
    ]),
    ("pm-glide", "Glide", 7, [
        "Slow (porta)", "Default", "Fast (snap)"
    ]),
]

def make_umenu_items(items):
    """Build Max-format umenu items list with comma separators."""
    result = []
    for i, item in enumerate(items):
        if i > 0:
            result.append(",")
        result.append(item)
    return result

def build_new_objects():
    """Build all new box objects."""
    boxes = []
    y = Y_START

    # Header
    boxes.append({
        "box": {
            "fontface": 1,
            "fontsize": 12.0,
            "id": "obj-pm-header",
            "maxclass": "comment",
            "numinlets": 1,
            "numoutlets": 0,
            "patching_rect": [X_LABEL, y, 200.0, 20.0],
            "text": "—— PRESETS ——",
            "varname": "obj-pm-header"
        }
    })
    y += 25

    # Each umenu row: label + umenu
    for varname, label, inlet_idx, items in UMENUS:
        # Label
        boxes.append({
            "box": {
                "fontsize": 11.0,
                "id": f"obj-{varname}-l",
                "maxclass": "comment",
                "numinlets": 1,
                "numoutlets": 0,
                "patching_rect": [X_LABEL, y + 2, 90.0, 19.0],
                "text": label,
                "varname": f"obj-{varname}-l"
            }
        })
        # Umenu
        boxes.append({
            "box": {
                "id": f"obj-{varname}",
                "maxclass": "umenu",
                "numinlets": 1,
                "numoutlets": 3,
                "outlettype": ["int", "", ""],
                "parameter_enable": 0,
                "patching_rect": [X_MENU, y, MENU_W, MENU_H],
                "items": make_umenu_items(items),
                "varname": f"obj-{varname}"
            }
        })
        y += ROW_H

    y += 10

    # JS object (8 inlets, 1 outlet)
    js_w = 200
    boxes.append({
        "box": {
            "id": "obj-pm-js",
            "maxclass": "newobj",
            "numinlets": 8,
            "numoutlets": 1,
            "outlettype": [""],
            "patching_rect": [X_MENU, y, js_w, 22.0],
            "text": "js preset_menu.js",
            "varname": "obj-pm-js"
        }
    })
    y += 28

    # s toGen
    boxes.append({
        "box": {
            "id": "obj-pm-send",
            "maxclass": "newobj",
            "numinlets": 1,
            "numoutlets": 0,
            "patching_rect": [X_MENU, y, 52.0, 22.0],
            "text": "s toGen",
            "varname": "obj-pm-send"
        }
    })

    return boxes, y + 30  # return objects and next available y

def build_new_lines():
    """Build patchlines: each umenu outlet 0 → JS inlet N, JS → s toGen."""
    lines = []
    for varname, label, inlet_idx, items in UMENUS:
        lines.append({
            "patchline": {
                "destination": ["obj-pm-js", inlet_idx],
                "source": [f"obj-{varname}", 0]
            }
        })
    # JS → s toGen
    lines.append({
        "patchline": {
            "destination": ["obj-pm-send", 0],
            "source": ["obj-pm-js", 0]
        }
    })
    return lines

def relocate_kept_sections(patch, next_y):
    """Move Chord, Drone, Attractor sections up to fill the freed space."""
    # Map of section labels → their varname prefixes
    sections_to_move = {
        "obj-cp-label": 900,      # Chord was at y=900
        "obj-dr-label": 1046,     # Drone was at y=1046
        "obj-ac-label": 1144,     # Attractor was at y=1144
    }

    # Calculate how much to shift each section
    # Chord starts at 900, we want it at next_y + 10
    chord_shift = 900 - (next_y + 10)
    # Drone starts at 1046, relative to chord
    drone_y_new = next_y + 10 + (1046 - 900)
    # Attractor starts at 1144, relative to chord
    attractor_y_new = next_y + 10 + (1144 - 900)

    # Shift all kept section objects down by the difference
    # Objects in range y=900-1406 (chord+drone+attractor) need to move up
    shift_amount = chord_shift  # positive = move up

    kept_prefixes = [
        "obj-cp-", "obj-dr-", "obj-ac-",
        "obj-cp1", "obj-cp2", "obj-cp3", "obj-cp4",
        "obj-dr1", "obj-dr2",
        "obj-ac1", "obj-ac2", "obj-ac3", "obj-ac4", "obj-ac5",
        "obj-ac6", "obj-ac7", "obj-ac8", "obj-ac9", "obj-ac10",
    ]

    for box_wrapper in patch["patcher"]["boxes"]:
        box = box_wrapper["box"]
        vn = box.get("varname", "")
        # Check if this is a kept preset section object
        if any(vn.startswith(p) or vn == p.rstrip("-") for p in kept_prefixes):
            rect = box["patching_rect"]
            if rect[1] >= 900 and rect[1] <= 1410:
                rect[1] -= shift_amount

def main():
    with open(PATCH, "r") as f:
        patch = json.load(f)

    # Build ID set for objects being removed
    remove_ids = set()
    for box_wrapper in patch["patcher"]["boxes"]:
        box = box_wrapper["box"]
        vn = box.get("varname", "")
        if vn in REMOVE:
            remove_ids.add(box["id"])

    # Count before
    n_boxes_before = len(patch["patcher"]["boxes"])
    n_lines_before = len(patch["patcher"]["lines"])

    # Remove boxes
    patch["patcher"]["boxes"] = [
        bw for bw in patch["patcher"]["boxes"]
        if bw["box"].get("varname", "") not in REMOVE
    ]

    # Remove patchlines referencing removed objects
    patch["patcher"]["lines"] = [
        lw for lw in patch["patcher"]["lines"]
        if (lw["patchline"]["source"][0] not in remove_ids and
            lw["patchline"]["destination"][0] not in remove_ids)
    ]

    n_boxes_removed = n_boxes_before - len(patch["patcher"]["boxes"])
    n_lines_removed = n_lines_before - len(patch["patcher"]["lines"])

    # Build new objects
    new_boxes, next_y = build_new_objects()
    patch["patcher"]["boxes"].extend(new_boxes)

    # Build new patchlines
    new_lines = build_new_lines()
    patch["patcher"]["lines"].extend(new_lines)

    # Relocate kept sections (chord, drone, attractor combos)
    relocate_kept_sections(patch, next_y)

    n_boxes_after = len(patch["patcher"]["boxes"])
    n_lines_after = len(patch["patcher"]["lines"])

    print(f"Removed {n_boxes_removed} boxes, {n_lines_removed} lines")
    print(f"Added {len(new_boxes)} boxes, {len(new_lines)} lines")
    print(f"Total: {n_boxes_after} boxes, {n_lines_after} lines (was {n_boxes_before}/{n_lines_before})")

    with open(PATCH, "w") as f:
        json.dump(patch, f, indent=4, ensure_ascii=False)

    print("Done — patch saved.")

if __name__ == "__main__":
    main()
