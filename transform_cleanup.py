#!/usr/bin/env python3
"""
transform_cleanup.py - Clean up step6_chaos_resonator.maxpat

1. Remove 20 arp_mode buttons (obj-arp-0..19) + 3 row labels
2. Remove 6 arp_div buttons (obj-div-0..5) + label + hint
3. Add Arp Mode umenu (21 items) + message + wiring
4. Shift Euclidean / BPM / freeHz controls up to fill freed space
5. Keep obj-s-arp (shared by BPM, freeHz, Euclidean)
"""

import json
import copy
import os
import shutil

PATCH_PATH = "/mnt/d/Music/Max Msp/Projects/Feedback/max/step6_chaos_resonator.maxpat"
BACKUP_PATH = PATCH_PATH + ".bak"
COPY_PATH = os.path.expanduser("~/Feedback/max/step6_chaos_resonator.maxpat")

# ── Objects to REMOVE ──────────────────────────────────────────────

# 20 arp_mode buttons
ARP_MODE_BUTTONS = {f"obj-arp-{i}" for i in range(20)}

# 3 row labels for the arp_mode buttons
ARP_ROW_LABELS = {"obj-afr-labels", "obj-afr2-labels", "obj-luso-labels"}

# 6 arp_div buttons + label + hint
ARP_DIV_BUTTONS = {f"obj-div-{i}" for i in range(6)}
ARP_DIV_EXTRAS = {"obj-div-label", "obj-div-hint"}

ALL_REMOVE = ARP_MODE_BUTTONS | ARP_ROW_LABELS | ARP_DIV_BUTTONS | ARP_DIV_EXTRAS

# ── Objects to SHIFT UP ────────────────────────────────────────────
# These are in the y range 1368-1535 and should move up after we
# remove the 4 rows of arp_mode buttons (y 1257-1411) and
# the arp_div row (y 1436-1456).
#
# Strategy: The old arp_mode buttons span y=1257 to y=1411 (bottom of eucl messages).
# The old arp_div buttons are at y=1436-1456.
# The BPM/freeHz row is at y=1483-1535.
# The Euclidean controls are at y=1368-1411.
#
# IMPORTANT: x=383 column is occupied by the rcc chain (ctlin->scale->
# prepend root_offset->s toGen) at y=1231-1310. The new umenu must go
# to x=540 to avoid overlap. Euclidean controls stay at x>=653.
#
# New layout:
#   y=1235: "-- ARPEGGIATOR --" label (obj-arp-label) - KEEP as-is
#   x=540, y=1257: "Arp Mode" label (NEW)
#   x=540, y=1280: umenu (NEW)
#   x=540, y=1310: "arp_mode $1" message (NEW)
#
#   y=1340: Euclidean hint + labels (x>=653)
#   y=1360: Euclidean number boxes
#   y=1385: Euclidean messages
#
#   y=1415: BPM label + number / freeHz label + number
#   y=1440: BPM message / freeHz message
#   y=1467: obj-s-arp (s toGen)

# Euclidean objects and their new Y coordinates
# Move up from y=1368-1411 range to y=1345-1395 range
EUCL_OBJECTS_YNEW = {
    # Row 1: labels (currently y=1368)
    "obj-eucl-hint": 1345,
    "obj-ep-l": 1345,
    "obj-es-l": 1345,
    # Row 2: number boxes (currently y=1386)
    "obj-ep-n": 1365,
    "obj-es-n": 1365,
    # Row 3: messages (currently y=1411)
    "obj-ep-m": 1390,
    "obj-es-m": 1390,
}

# BPM / freeHz objects and their new Y coordinates
# Move up from y=1483-1535 range to y=1420-1470 range
BPM_OBJECTS_YNEW = {
    # Labels (currently y=1483)
    "obj-bpm-l": 1420,
    "obj-arpr-l": 1420,
    # Number boxes (currently y=1483)
    "obj-bpm-n": 1420,
    "obj-arpr-n": 1420,
    # Messages (currently y=1508)
    "obj-bpm-m": 1445,
    "obj-arpr-m": 1445,
    # s toGen (currently y=1535)
    "obj-s-arp": 1470,
}

SHIFT_MAP = {}
SHIFT_MAP.update(EUCL_OBJECTS_YNEW)
SHIFT_MAP.update(BPM_OBJECTS_YNEW)


def load_patch(path):
    with open(path, "r", encoding="utf-8") as f:
        return json.load(f)


def save_patch(patch, path):
    with open(path, "w", encoding="utf-8") as f:
        json.dump(patch, f, indent=4, ensure_ascii=False)
    print(f"  Saved: {path}")


def get_varname(box_entry):
    """Get varname from a box entry."""
    return box_entry.get("box", {}).get("varname", "")


def get_id(box_entry):
    """Get id from a box entry."""
    return box_entry.get("box", {}).get("id", "")


def remove_boxes(patch, ids_to_remove):
    """Remove boxes whose varname or id is in ids_to_remove."""
    original_count = len(patch["patcher"]["boxes"])
    patch["patcher"]["boxes"] = [
        b for b in patch["patcher"]["boxes"]
        if get_varname(b) not in ids_to_remove and get_id(b) not in ids_to_remove
    ]
    removed = original_count - len(patch["patcher"]["boxes"])
    print(f"  Removed {removed} boxes (expected {len(ids_to_remove)})")
    return removed


def remove_patchlines_involving(patch, ids_to_remove):
    """Remove patchlines where source or destination involves a removed object."""
    original_count = len(patch["patcher"]["lines"])
    patch["patcher"]["lines"] = [
        pl for pl in patch["patcher"]["lines"]
        if (pl["patchline"]["source"][0] not in ids_to_remove and
            pl["patchline"]["destination"][0] not in ids_to_remove)
    ]
    removed = original_count - len(patch["patcher"]["lines"])
    print(f"  Removed {removed} patchlines involving deleted objects")
    return removed


def shift_objects(patch, shift_map):
    """Shift objects to new Y positions."""
    shifted = 0
    for b in patch["patcher"]["boxes"]:
        vn = get_varname(b)
        if vn in shift_map:
            rect = b["box"]["patching_rect"]
            old_y = rect[1]
            new_y = float(shift_map[vn])
            rect[1] = new_y
            print(f"    {vn}: y {old_y} -> {new_y}")
            shifted += 1
    print(f"  Shifted {shifted} objects")
    return shifted


def make_umenu_items():
    """Build umenu items list with comma separators."""
    labels = [
        "All On", "Up", "Down", "Up/Down", "Random", "Chord",
        "Poly 3:2", "Triplet", "Bembe", "Shiko", "Call/Resp",
        "Gahu", "Son Clave", "Fume Fume", "Kassa",
        "Kuduro", "Semba", "Kizomba", "Marrabenta",
        "Euclidean", "Sequencer"
    ]
    items = []
    for i, label in enumerate(labels):
        items.append(label)
        if i < len(labels) - 1:
            items.append(",")
    return items


def add_new_objects(patch):
    """Add: Arp Mode label, umenu, 'arp_mode $1' message, and patchlines."""

    # ── New box: "Arp Mode" label ──
    # Positioned at x=540, y=1260 - right of the rcc chain (x=383, y=1231-1332)
    # The rcc chain (ctlin->scale->prepend->s toGen) occupies x=383 y=1231-1332
    label_box = {
        "box": {
            "fontface": 1,
            "fontsize": 11.0,
            "id": "obj-arpmode-label",
            "maxclass": "comment",
            "numinlets": 1,
            "numoutlets": 0,
            "patching_rect": [540.0, 1260.0, 75.0, 19.0],
            "text": "Arp Mode",
            "varname": "obj-arpmode-label"
        }
    }

    # ── New box: umenu (21 items) ──
    umenu_box = {
        "box": {
            "id": "obj-arpmode-umenu",
            "maxclass": "umenu",
            "numinlets": 1,
            "numoutlets": 3,
            "outlettype": ["int", "", ""],
            "parameter_enable": 0,
            "patching_rect": [540.0, 1280.0, 150.0, 22.0],
            "items": make_umenu_items(),
            "presentation": 1,
            "presentation_rect": [10.0, 160.0, 150.0, 22.0],
            "varname": "obj-arpmode-umenu"
        }
    }

    # ── New box: "arp_mode $1" message ──
    msg_box = {
        "box": {
            "id": "obj-arpmode-msg",
            "maxclass": "message",
            "numinlets": 2,
            "numoutlets": 1,
            "outlettype": [""],
            "patching_rect": [540.0, 1310.0, 90.0, 22.0],
            "text": "arp_mode $1",
            "varname": "obj-arpmode-msg"
        }
    }

    patch["patcher"]["boxes"].append(label_box)
    patch["patcher"]["boxes"].append(umenu_box)
    patch["patcher"]["boxes"].append(msg_box)
    print("  Added 3 new objects: label, umenu, message")

    # ── New patchlines ──
    # umenu outlet 0 (int index) -> message inlet 0
    pl1 = {
        "patchline": {
            "destination": ["obj-arpmode-msg", 0],
            "source": ["obj-arpmode-umenu", 0]
        }
    }
    # message outlet 0 -> s toGen (obj-s-arp) inlet 0
    pl2 = {
        "patchline": {
            "destination": ["obj-s-arp", 0],
            "source": ["obj-arpmode-msg", 0]
        }
    }
    patch["patcher"]["lines"].append(pl1)
    patch["patcher"]["lines"].append(pl2)
    print("  Added 2 new patchlines: umenu -> msg -> s toGen")


def verify_no_overlap(patch):
    """Quick check for obvious overlaps in the arp section (y 1235-1500)."""
    arp_objects = []
    for b in patch["patcher"]["boxes"]:
        rect = b["box"].get("patching_rect", [0, 0, 0, 0])
        vn = get_varname(b) or get_id(b)
        y = rect[1]
        if 1230 <= y <= 1500:
            arp_objects.append((vn, rect[0], y, rect[2], rect[3]))

    print("\n  Objects in arp zone (y 1230-1500):")
    for name, x, y, w, h in sorted(arp_objects, key=lambda t: (t[2], t[1])):
        print(f"    {name:25s}  x={x:6.0f}  y={y:6.0f}  w={w:5.0f}  h={h:5.0f}")

    # Check for Y overlaps within same X range
    for i, (n1, x1, y1, w1, h1) in enumerate(arp_objects):
        for n2, x2, y2, w2, h2 in arp_objects[i + 1:]:
            # Check if X ranges overlap
            if x1 < x2 + w2 and x2 < x1 + w1:
                # Check if Y ranges overlap
                if y1 < y2 + h2 and y2 < y1 + h1:
                    print(f"  WARNING: Overlap between {n1} and {n2}")


def verify_patchlines(patch):
    """Check that no patchlines reference removed objects."""
    box_ids = set()
    for b in patch["patcher"]["boxes"]:
        box_ids.add(get_id(b))
        # Also check sub-patchers
        inner = b.get("box", {}).get("patcher", {})
        if inner:
            for ib in inner.get("boxes", []):
                box_ids.add(ib.get("box", {}).get("id", ""))

    orphaned = 0
    for pl in patch["patcher"]["lines"]:
        src = pl["patchline"]["source"][0]
        dst = pl["patchline"]["destination"][0]
        if src not in box_ids:
            print(f"  ORPHAN patchline source: {src}")
            orphaned += 1
        if dst not in box_ids:
            print(f"  ORPHAN patchline dest: {dst}")
            orphaned += 1

    if orphaned == 0:
        print("  All patchlines reference valid objects.")
    else:
        print(f"  WARNING: {orphaned} orphaned patchline references!")


def main():
    print("=" * 60)
    print("PATCH CLEANUP: step6_chaos_resonator.maxpat")
    print("=" * 60)

    # ── Load ──
    print("\n[1] Loading patch...")
    patch = load_patch(PATCH_PATH)
    total_boxes = len(patch["patcher"]["boxes"])
    total_lines = len(patch["patcher"]["lines"])
    print(f"  {total_boxes} boxes, {total_lines} patchlines")

    # ── Backup ──
    print("\n[2] Creating backup...")
    shutil.copy2(PATCH_PATH, BACKUP_PATH)
    print(f"  Backup: {BACKUP_PATH}")

    # ── Remove old arp_mode buttons + labels ──
    print("\n[3] Removing arp_mode buttons + row labels...")
    remove_boxes(patch, ARP_MODE_BUTTONS | ARP_ROW_LABELS)

    # ── Remove old arp_div buttons + label + hint ──
    print("\n[4] Removing arp_div buttons + label + hint...")
    remove_boxes(patch, ARP_DIV_BUTTONS | ARP_DIV_EXTRAS)

    # ── Remove orphaned patchlines ──
    print("\n[5] Removing patchlines for deleted objects...")
    remove_patchlines_involving(patch, ALL_REMOVE)

    # ── Add new umenu + message ──
    print("\n[6] Adding Arp Mode umenu + message...")
    add_new_objects(patch)

    # ── Shift Euclidean + BPM + freeHz up ──
    print("\n[7] Shifting Euclidean/BPM/freeHz controls up...")
    shift_objects(patch, SHIFT_MAP)

    # ── Verify ──
    print("\n[8] Verifying layout...")
    verify_no_overlap(patch)

    print("\n[9] Verifying patchline integrity...")
    verify_patchlines(patch)

    # ── Summary ──
    final_boxes = len(patch["patcher"]["boxes"])
    final_lines = len(patch["patcher"]["lines"])
    print(f"\n  Final: {final_boxes} boxes ({total_boxes - final_boxes + 3} net change), "
          f"{final_lines} patchlines ({total_lines - final_lines + 2} net change)")

    # ── Save ──
    print("\n[10] Saving...")
    save_patch(patch, PATCH_PATH)

    # ── Copy to ~/Feedback/max/ ──
    print("\n[11] Copying to ~/Feedback/max/...")
    os.makedirs(os.path.dirname(COPY_PATH), exist_ok=True)
    shutil.copy2(PATCH_PATH, COPY_PATH)
    print(f"  Copied: {COPY_PATH}")

    print("\n" + "=" * 60)
    print("DONE. Open in Max to verify.")
    print("=" * 60)


if __name__ == "__main__":
    main()
