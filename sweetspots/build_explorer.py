#!/usr/bin/env python3
"""
Build sweetspot_explorer.maxpat — a FluCoMa-based Max patch that:
1. Auto-sweeps 50 presets through the real Chaos Resonator
2. Captures post-waveguide audio via receive~ feedback_L/R
3. Analyzes each preset with FluCoMa descriptors (MFCC, spectral, loudness, pitch)
4. Builds a UMAP 2D map for interactive navigation via fluid.plotter

FluCoMa API notes (camelCase throughout):
  - Buffer attrs: @source, @features, @stats, @numCoeffs, @numChans
  - Compose attrs: @startFrame, @numFrames, @startChan, @numChans, @destStartFrame, @destStartChan
  - Dataset/ML objects use messages: fitTransform <src> <dst>, fit <dataset>
  - Plotter outlet 0 = x y floats. Use kdtree knearest for point ID lookup.
  - Plotter data loaded via fluid.dataset~ dump → dictionary → plotter

Reads presets from presets.txt, outputs to ../max/sweetspot_explorer.maxpat
"""

import json
import re
from pathlib import Path

PRESETS_FILE = Path(__file__).parent / "presets.txt"
OUT_FILE = Path(__file__).parent.parent / "max" / "sweetspot_explorer.maxpat"

ATTRACTOR_NAMES = {0: "Lorenz", 1: "Rossler", 2: "Chua", 3: "Halvorsen", 4: "Aizawa"}
ATTRACTOR_COLORS = {
    0: [0.9, 0.2, 0.2, 1.0],   # Red
    1: [0.2, 0.8, 0.2, 1.0],   # Green
    2: [0.3, 0.4, 0.9, 1.0],   # Blue
    3: [0.9, 0.8, 0.1, 1.0],   # Yellow
    4: [0.7, 0.3, 0.9, 1.0],   # Purple
}

NUM_FEATURES = 37  # 26 MFCC(13 means + 13 stddevs) + 7 spectral + 2 loudness + 2 pitch


def parse_presets():
    """Parse presets.txt into list of (index, attractor_id, params_string, label)."""
    presets = []
    idx = 0
    with open(PRESETS_FILE) as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            comment = ""
            if "#" in line:
                parts = line.split("#", 1)
                line_clean = parts[0].strip()
                comment = parts[1].strip()
            else:
                line_clean = line

            m = re.search(r"att_sel\s+(\d+)", line_clean)
            if not m:
                continue
            att_id = int(m.group(1))
            att_name = ATTRACTOR_NAMES.get(att_id, f"att{att_id}")
            label = f"{att_name}: {comment}" if comment else f"{att_name} preset {idx}"
            params = line_clean.rstrip(",").strip()

            presets.append((idx, att_id, params, label))
            idx += 1
    return presets


def box(id_, maxclass, text=None, numinlets=1, numoutlets=1,
        outlettype=None, patching_rect=None, **extra):
    """Create a Max box dict."""
    b = {
        "id": id_,
        "maxclass": maxclass,
        "numinlets": numinlets,
        "numoutlets": numoutlets,
    }
    if text is not None:
        b["text"] = text
    if outlettype is not None:
        b["outlettype"] = outlettype
    if patching_rect is not None:
        b["patching_rect"] = patching_rect
    b.update(extra)
    return {"box": b}


def patchline(src_id, src_outlet, dst_id, dst_inlet):
    """Create a patchline dict."""
    return {
        "patchline": {
            "source": [src_id, src_outlet],
            "destination": [dst_id, dst_inlet],
        }
    }


def build_patch():
    presets = parse_presets()
    num_presets = len(presets)

    boxes = []
    lines = []

    x0, y0 = 30, 30
    row_h = 30

    # ═══════════════════════════════════════════════════════════════
    # A. TITLE
    # ═══════════════════════════════════════════════════════════════
    boxes.append(box(
        "obj-title", "comment", numinlets=1, numoutlets=0,
        text=f"SWEETSPOT EXPLORER — {num_presets} presets\n"
             "FluCoMa analysis + UMAP navigation\n\n"
             "1. Open step6_chaos_resonator, turn on audio\n"
             "2. Click [Start Sweep] below\n"
             "3. Wait ~3.5 min for analysis\n"
             "4. Click points on the map to recall presets\n\n"
             "Requires: FluCoMa package (Max Package Manager)",
        patching_rect=[x0, y0, 500, 130],
        fontsize=12.0, linecount=8
    ))

    # ═══════════════════════════════════════════════════════════════
    # B. PRESET STORAGE (coll) — data loaded from presets.coll on loadbang
    # ═══════════════════════════════════════════════════════════════
    cx, cy = x0, y0 + 150

    boxes.append(box(
        "obj-coll", "newobj",
        text="coll presets",
        numinlets=1, numoutlets=4,
        outlettype=["", "", "int", ""],
        patching_rect=[cx, cy, 120, 22]
    ))

    boxes.append(box(
        "obj-coll-loadbang", "newobj",
        text="loadbang",
        numinlets=1, numoutlets=1,
        outlettype=["bang"],
        patching_rect=[cx + 200, cy - 50, 60, 22]
    ))
    boxes.append(box(
        "obj-coll-readmsg", "message",
        text="read presets.coll",
        numinlets=2, numoutlets=1,
        outlettype=[""],
        patching_rect=[cx + 200, cy - 25, 110, 22]
    ))
    lines.append(patchline("obj-coll-loadbang", 0, "obj-coll-readmsg", 0))
    lines.append(patchline("obj-coll-readmsg", 0, "obj-coll", 0))

    # ═══════════════════════════════════════════════════════════════
    # C. SWEEP ENGINE
    # ═══════════════════════════════════════════════════════════════
    sx, sy = x0, cy + 60

    boxes.append(box(
        "obj-sweep-tog", "toggle",
        numinlets=1, numoutlets=1,
        outlettype=["int"],
        patching_rect=[sx, sy, 24, 24],
        presentation=1, presentation_rect=[10, 150, 30, 30]
    ))
    boxes.append(box(
        "obj-sweep-label", "comment",
        text="Start/Stop Sweep", numinlets=1, numoutlets=0,
        patching_rect=[sx + 30, sy, 120, 22],
        presentation=1, presentation_rect=[45, 155, 120, 22]
    ))

    boxes.append(box(
        "obj-metro", "newobj",
        text="metro 4000",
        numinlets=2, numoutlets=1,
        outlettype=["bang"],
        patching_rect=[sx, sy + row_h, 80, 22]
    ))
    lines.append(patchline("obj-sweep-tog", 0, "obj-metro", 0))

    boxes.append(box(
        "obj-counter", "newobj",
        text=f"counter 0 {num_presets - 1}",
        numinlets=5, numoutlets=4,
        outlettype=["int", "", "", "int"],
        patching_rect=[sx, sy + 2 * row_h, 130, 22]
    ))
    lines.append(patchline("obj-metro", 0, "obj-counter", 0))

    # Counter overflow → stop sweep
    boxes.append(box(
        "obj-sweep-done", "message",
        text="0",
        numinlets=2, numoutlets=1,
        outlettype=[""],
        patching_rect=[sx + 140, sy + 2 * row_h, 25, 22]
    ))
    lines.append(patchline("obj-counter", 2, "obj-sweep-done", 0))
    lines.append(patchline("obj-sweep-done", 0, "obj-sweep-tog", 0))

    # State machine trigger: t b b b i
    # outlet 3 (i) → coll lookup (fires first, right-to-left)
    # outlet 2 (b) → record delay
    # outlet 1 (b) → record stop delay
    # outlet 0 (b) → analysis delay
    boxes.append(box(
        "obj-trig", "newobj",
        text="t b b b i",
        numinlets=1, numoutlets=4,
        outlettype=["bang", "bang", "bang", "int"],
        patching_rect=[sx, sy + 3 * row_h, 100, 22]
    ))
    lines.append(patchline("obj-counter", 0, "obj-trig", 0))
    lines.append(patchline("obj-trig", 3, "obj-coll", 0))

    # Progress display
    boxes.append(box(
        "obj-progress", "number",
        numinlets=1, numoutlets=2,
        outlettype=["", "bang"],
        patching_rect=[sx + 180, sy + 3 * row_h, 50, 22],
        presentation=1, presentation_rect=[170, 155, 50, 22]
    ))
    lines.append(patchline("obj-counter", 0, "obj-progress", 0))

    boxes.append(box(
        "obj-progress-label", "comment",
        text=f"/ {num_presets - 1}", numinlets=1, numoutlets=0,
        patching_rect=[sx + 235, sy + 3 * row_h, 50, 22],
        presentation=1, presentation_rect=[222, 155, 50, 22]
    ))

    # ═══════════════════════════════════════════════════════════════
    # D. PRESET RECALL — coll output → s toGen
    # ═══════════════════════════════════════════════════════════════
    px, py = sx, sy + 5 * row_h

    boxes.append(box(
        "obj-s-toGen", "newobj",
        text="s toGen",
        numinlets=1, numoutlets=0,
        patching_rect=[px, py, 55, 22]
    ))
    lines.append(patchline("obj-coll", 0, "obj-s-toGen", 0))

    boxes.append(box(
        "obj-preset-display", "message",
        text="",
        numinlets=2, numoutlets=1,
        outlettype=[""],
        patching_rect=[px + 80, py, 350, 22],
        presentation=1, presentation_rect=[10, 185, 470, 22]
    ))
    lines.append(patchline("obj-coll", 0, "obj-preset-display", 1))

    # ═══════════════════════════════════════════════════════════════
    # E. AUDIO CAPTURE — receive~ → buffer~ → record~
    # ═══════════════════════════════════════════════════════════════
    ax, ay = sx, py + 60

    boxes.append(box(
        "obj-recv-L", "newobj",
        text="receive~ feedback_L",
        numinlets=1, numoutlets=1,
        outlettype=["signal"],
        patching_rect=[ax, ay, 130, 22]
    ))

    boxes.append(box(
        "obj-capture-buf", "newobj",
        text="buffer~ capture_buf 2000",
        numinlets=1, numoutlets=2,
        outlettype=["float", "bang"],
        patching_rect=[ax + 250, ay, 160, 22]
    ))

    boxes.append(box(
        "obj-record", "newobj",
        text="record~ capture_buf 1",
        numinlets=2, numoutlets=1,
        outlettype=["signal"],
        patching_rect=[ax, ay + row_h, 130, 22]
    ))
    lines.append(patchline("obj-recv-L", 0, "obj-record", 0))

    # Record start: delay 500ms after preset change
    boxes.append(box(
        "obj-rec-delay", "newobj",
        text="delay 500",
        numinlets=2, numoutlets=1,
        outlettype=["bang"],
        patching_rect=[ax + 160, ay + row_h, 75, 22]
    ))
    lines.append(patchline("obj-trig", 2, "obj-rec-delay", 0))

    boxes.append(box(
        "obj-rec-start", "message",
        text="1",
        numinlets=2, numoutlets=1,
        outlettype=[""],
        patching_rect=[ax + 160, ay + 2 * row_h, 25, 22]
    ))
    lines.append(patchline("obj-rec-delay", 0, "obj-rec-start", 0))
    lines.append(patchline("obj-rec-start", 0, "obj-record", 1))

    # Record stop: 2500ms after preset change
    boxes.append(box(
        "obj-rec-stop-delay", "newobj",
        text="delay 2500",
        numinlets=2, numoutlets=1,
        outlettype=["bang"],
        patching_rect=[ax + 250, ay + row_h, 85, 22]
    ))
    lines.append(patchline("obj-trig", 2, "obj-rec-stop-delay", 0))

    boxes.append(box(
        "obj-rec-stop", "message",
        text="0",
        numinlets=2, numoutlets=1,
        outlettype=[""],
        patching_rect=[ax + 250, ay + 2 * row_h, 25, 22]
    ))
    lines.append(patchline("obj-rec-stop-delay", 0, "obj-rec-stop", 0))
    lines.append(patchline("obj-rec-stop", 0, "obj-record", 1))

    # ═══════════════════════════════════════════════════════════════
    # F. FluCoMa ANALYSIS CHAIN (camelCase attrs, chained via done-bang)
    # ═══════════════════════════════════════════════════════════════
    fx, fy = sx, ay + 4 * row_h

    # Analysis trigger — after recording stops
    boxes.append(box(
        "obj-analyze-delay", "newobj",
        text="delay 2600",
        numinlets=2, numoutlets=1,
        outlettype=["bang"],
        patching_rect=[fx, fy, 85, 22]
    ))
    lines.append(patchline("obj-trig", 0, "obj-analyze-delay", 0))

    # Feature buffers (FluCoMa resizes these as needed)
    buf_x = fx + 480
    buf_y = fy
    for buf_name in [
        "mfcc_buf", "mfcc_stats_buf",
        "shape_buf", "shape_stats_buf",
        "loud_buf", "loud_stats_buf",
        "pitch_buf", "pitch_stats_buf",
        "feature_row",
    ]:
        boxes.append(box(
            f"obj-{buf_name}", "newobj",
            text=f"buffer~ {buf_name}",
            numinlets=1, numoutlets=2,
            outlettype=["float", "bang"],
            patching_rect=[buf_x, buf_y, 140, 22]
        ))
        buf_y += row_h

    # 1. MFCC — @numCoeffs (camelCase)
    boxes.append(box(
        "obj-mfcc", "newobj",
        text="fluid.bufmfcc~ @source capture_buf @features mfcc_buf @numCoeffs 13 @numChans 1",
        numinlets=1, numoutlets=2,
        outlettype=["", "bang"],
        patching_rect=[fx, fy + row_h, 440, 22]
    ))
    lines.append(patchline("obj-analyze-delay", 0, "obj-mfcc", 0))

    # 2. MFCC stats — note: @stats not @features for bufstats~
    boxes.append(box(
        "obj-mfcc-stats", "newobj",
        text="fluid.bufstats~ @source mfcc_buf @stats mfcc_stats_buf @numChans 1",
        numinlets=1, numoutlets=2,
        outlettype=["", "bang"],
        patching_rect=[fx, fy + 2 * row_h, 440, 22]
    ))
    lines.append(patchline("obj-mfcc", 1, "obj-mfcc-stats", 0))

    # 3. Spectral Shape
    boxes.append(box(
        "obj-spectral", "newobj",
        text="fluid.bufspectralshape~ @source capture_buf @features shape_buf @numChans 1",
        numinlets=1, numoutlets=2,
        outlettype=["", "bang"],
        patching_rect=[fx, fy + 3 * row_h, 440, 22]
    ))
    lines.append(patchline("obj-mfcc-stats", 1, "obj-spectral", 0))

    # 4. Spectral stats
    boxes.append(box(
        "obj-spectral-stats", "newobj",
        text="fluid.bufstats~ @source shape_buf @stats shape_stats_buf @numChans 1",
        numinlets=1, numoutlets=2,
        outlettype=["", "bang"],
        patching_rect=[fx, fy + 4 * row_h, 440, 22]
    ))
    lines.append(patchline("obj-spectral", 1, "obj-spectral-stats", 0))

    # 5. Loudness
    boxes.append(box(
        "obj-loudness", "newobj",
        text="fluid.bufloudness~ @source capture_buf @features loud_buf @numChans 1",
        numinlets=1, numoutlets=2,
        outlettype=["", "bang"],
        patching_rect=[fx, fy + 5 * row_h, 440, 22]
    ))
    lines.append(patchline("obj-spectral-stats", 1, "obj-loudness", 0))

    # 6. Loudness stats
    boxes.append(box(
        "obj-loud-stats", "newobj",
        text="fluid.bufstats~ @source loud_buf @stats loud_stats_buf @numChans 1",
        numinlets=1, numoutlets=2,
        outlettype=["", "bang"],
        patching_rect=[fx, fy + 6 * row_h, 440, 22]
    ))
    lines.append(patchline("obj-loudness", 1, "obj-loud-stats", 0))

    # 7. Pitch
    boxes.append(box(
        "obj-pitch", "newobj",
        text="fluid.bufpitch~ @source capture_buf @features pitch_buf @numChans 1",
        numinlets=1, numoutlets=2,
        outlettype=["", "bang"],
        patching_rect=[fx, fy + 7 * row_h, 440, 22]
    ))
    lines.append(patchline("obj-loud-stats", 1, "obj-pitch", 0))

    # 8. Pitch stats
    boxes.append(box(
        "obj-pitch-stats", "newobj",
        text="fluid.bufstats~ @source pitch_buf @stats pitch_stats_buf @numChans 1",
        numinlets=1, numoutlets=2,
        outlettype=["", "bang"],
        patching_rect=[fx, fy + 8 * row_h, 440, 22]
    ))
    lines.append(patchline("obj-pitch", 1, "obj-pitch-stats", 0))

    # ═══════════════════════════════════════════════════════════════
    # G. FEATURE ASSEMBLY — bufcompose~ (camelCase params) → dataset
    # ═══════════════════════════════════════════════════════════════
    gx, gy = fx, fy + 10 * row_h

    # Step 1: MFCC means (13 values from frame 0 of stats) → feature_row chan 0..12
    boxes.append(box(
        "obj-comp-mfcc", "newobj",
        text="fluid.bufcompose~ @source mfcc_stats_buf @destination feature_row "
             "@startFrame 0 @numFrames 1 @startChan 0 @numChans 13 "
             "@destStartFrame 0 @destStartChan 0",
        numinlets=1, numoutlets=2,
        outlettype=["", "bang"],
        patching_rect=[gx, gy, 440, 22]
    ))
    lines.append(patchline("obj-pitch-stats", 1, "obj-comp-mfcc", 0))

    # Step 2: MFCC stddevs (frame 1 of stats) → feature_row chan 13..25
    boxes.append(box(
        "obj-comp-mfcc-std", "newobj",
        text="fluid.bufcompose~ @source mfcc_stats_buf @destination feature_row "
             "@startFrame 1 @numFrames 1 @startChan 0 @numChans 13 "
             "@destStartChan 13",
        numinlets=1, numoutlets=2,
        outlettype=["", "bang"],
        patching_rect=[gx, gy + row_h, 440, 22]
    ))
    lines.append(patchline("obj-comp-mfcc", 1, "obj-comp-mfcc-std", 0))

    # Step 3: Spectral shape means (7 values) → feature_row chan 26..32
    boxes.append(box(
        "obj-comp-shape", "newobj",
        text="fluid.bufcompose~ @source shape_stats_buf @destination feature_row "
             "@startFrame 0 @numFrames 1 @startChan 0 @numChans 7 "
             "@destStartChan 26",
        numinlets=1, numoutlets=2,
        outlettype=["", "bang"],
        patching_rect=[gx, gy + 2 * row_h, 440, 22]
    ))
    lines.append(patchline("obj-comp-mfcc-std", 1, "obj-comp-shape", 0))

    # Step 4: Loudness means (2 values) → feature_row chan 33..34
    boxes.append(box(
        "obj-comp-loud", "newobj",
        text="fluid.bufcompose~ @source loud_stats_buf @destination feature_row "
             "@startFrame 0 @numFrames 1 @startChan 0 @numChans 2 "
             "@destStartChan 33",
        numinlets=1, numoutlets=2,
        outlettype=["", "bang"],
        patching_rect=[gx, gy + 3 * row_h, 440, 22]
    ))
    lines.append(patchline("obj-comp-shape", 1, "obj-comp-loud", 0))

    # Step 5: Pitch means (2 values) → feature_row chan 35..36
    boxes.append(box(
        "obj-comp-pitch", "newobj",
        text="fluid.bufcompose~ @source pitch_stats_buf @destination feature_row "
             "@startFrame 0 @numFrames 1 @startChan 0 @numChans 2 "
             "@destStartChan 35",
        numinlets=1, numoutlets=2,
        outlettype=["", "bang"],
        patching_rect=[gx, gy + 4 * row_h, 440, 22]
    ))
    lines.append(patchline("obj-comp-loud", 1, "obj-comp-pitch", 0))

    # ─── Convert preset index → symbol for dataset point ID ───
    boxes.append(box(
        "obj-idx-hold", "newobj",
        text="i",
        numinlets=2, numoutlets=1,
        outlettype=["int"],
        patching_rect=[gx + 200, gy + 5 * row_h, 30, 22]
    ))
    lines.append(patchline("obj-counter", 0, "obj-idx-hold", 1))
    lines.append(patchline("obj-comp-pitch", 1, "obj-idx-hold", 0))

    boxes.append(box(
        "obj-idx-sym", "newobj",
        text="tosymbol",
        numinlets=1, numoutlets=1,
        outlettype=[""],
        patching_rect=[gx + 200, gy + 6 * row_h, 65, 22]
    ))
    lines.append(patchline("obj-idx-hold", 0, "obj-idx-sym", 0))

    # addpoint <id> feature_row → fluid.dataset~
    boxes.append(box(
        "obj-addpoint-msg", "message",
        text="addpoint $1 feature_row",
        numinlets=2, numoutlets=1,
        outlettype=[""],
        patching_rect=[gx, gy + 7 * row_h, 190, 22]
    ))
    lines.append(patchline("obj-idx-sym", 0, "obj-addpoint-msg", 0))

    boxes.append(box(
        "obj-dataset", "newobj",
        text="fluid.dataset~ sweetspots",
        numinlets=1, numoutlets=2,
        outlettype=["", ""],
        patching_rect=[gx, gy + 8 * row_h, 170, 22]
    ))
    lines.append(patchline("obj-addpoint-msg", 0, "obj-dataset", 0))

    # ─── Also store attractor label in labelset ───
    # We build a setlabel message: setlabel <id> <attractor_name>
    # Use the same idx-sym trigger to also label the point
    boxes.append(box(
        "obj-labelset", "newobj",
        text="fluid.labelset~ labels",
        numinlets=1, numoutlets=2,
        outlettype=["", ""],
        patching_rect=[gx + 250, gy + 8 * row_h, 160, 22]
    ))

    # ═══════════════════════════════════════════════════════════════
    # H. POST-SWEEP: Normalize → UMAP → KDTree → Plotter
    #    All ML objects use message-based API (not @attr for datasets)
    # ═══════════════════════════════════════════════════════════════
    hx, hy = fx, gy + 10 * row_h

    # Trigger post-sweep on counter overflow
    boxes.append(box(
        "obj-umap-delay", "newobj",
        text="delay 500",
        numinlets=2, numoutlets=1,
        outlettype=["bang"],
        patching_rect=[hx, hy, 75, 22]
    ))
    lines.append(patchline("obj-counter", 2, "obj-umap-delay", 0))

    # Manual "Build Map" button
    boxes.append(box(
        "obj-build-btn", "button",
        numinlets=1, numoutlets=1,
        outlettype=["bang"],
        patching_rect=[hx + 100, hy - 30, 24, 24],
        presentation=1, presentation_rect=[500, 150, 30, 30]
    ))
    boxes.append(box(
        "obj-build-label", "comment",
        text="Build Map", numinlets=1, numoutlets=0,
        patching_rect=[hx + 130, hy - 28, 70, 22],
        presentation=1, presentation_rect=[535, 155, 70, 22]
    ))

    # Trigger chain: normalize → umap → kdtree → plot
    boxes.append(box(
        "obj-post-trig", "newobj",
        text="t b",
        numinlets=1, numoutlets=1,
        outlettype=["bang"],
        patching_rect=[hx, hy + row_h, 35, 22]
    ))
    lines.append(patchline("obj-umap-delay", 0, "obj-post-trig", 0))
    lines.append(patchline("obj-build-btn", 0, "obj-post-trig", 0))

    # 1. Normalize — message: fitTransform sweetspots sweetspots_norm
    boxes.append(box(
        "obj-normalize", "newobj",
        text="fluid.normalize~",
        numinlets=1, numoutlets=2,
        outlettype=["", ""],
        patching_rect=[hx, hy + 3 * row_h, 120, 22]
    ))
    boxes.append(box(
        "obj-norm-msg", "message",
        text="fitTransform sweetspots sweetspots_norm",
        numinlets=2, numoutlets=1,
        outlettype=[""],
        patching_rect=[hx, hy + 2 * row_h, 270, 22]
    ))
    lines.append(patchline("obj-post-trig", 0, "obj-norm-msg", 0))
    lines.append(patchline("obj-norm-msg", 0, "obj-normalize", 0))

    # Normalized dataset (created implicitly by normalize)
    boxes.append(box(
        "obj-ds-norm", "newobj",
        text="fluid.dataset~ sweetspots_norm",
        numinlets=1, numoutlets=2,
        outlettype=["", ""],
        patching_rect=[hx + 450, hy + 3 * row_h, 190, 22]
    ))

    # 2. UMAP — camelCase: @numDimensions, @numNeighbours, @minDist
    #    Message: fitTransform sweetspots_norm sweetspots_2d
    boxes.append(box(
        "obj-umap", "newobj",
        text="fluid.umap~ @numDimensions 2 @numNeighbours 10 @minDist 0.3 @iterations 200",
        numinlets=1, numoutlets=2,
        outlettype=["", ""],
        patching_rect=[hx, hy + 5 * row_h, 440, 22]
    ))
    boxes.append(box(
        "obj-umap-msg", "message",
        text="fitTransform sweetspots_norm sweetspots_2d",
        numinlets=2, numoutlets=1,
        outlettype=[""],
        patching_rect=[hx, hy + 4 * row_h, 280, 22]
    ))
    # Normalize done-bang → trigger UMAP
    lines.append(patchline("obj-normalize", 1, "obj-umap-msg", 0))
    lines.append(patchline("obj-umap-msg", 0, "obj-umap", 0))

    # 2D dataset (created implicitly by UMAP)
    boxes.append(box(
        "obj-ds-2d", "newobj",
        text="fluid.dataset~ sweetspots_2d",
        numinlets=1, numoutlets=2,
        outlettype=["", ""],
        patching_rect=[hx + 450, hy + 5 * row_h, 180, 22]
    ))

    # 3. KDTree — no dataset arg on creation, uses "fit" message
    boxes.append(box(
        "obj-kdtree", "newobj",
        text="fluid.kdtree~",
        numinlets=1, numoutlets=2,
        outlettype=["", ""],
        patching_rect=[hx, hy + 7 * row_h, 100, 22]
    ))
    boxes.append(box(
        "obj-kdtree-msg", "message",
        text="fit sweetspots_2d",
        numinlets=2, numoutlets=1,
        outlettype=[""],
        patching_rect=[hx, hy + 6 * row_h, 120, 22]
    ))
    # UMAP done-bang → fit kdtree
    lines.append(patchline("obj-umap", 1, "obj-kdtree-msg", 0))
    lines.append(patchline("obj-kdtree-msg", 0, "obj-kdtree", 0))

    # ═══════════════════════════════════════════════════════════════
    # I. PLOTTER — load data via dataset dump → dict → plotter
    # ═══════════════════════════════════════════════════════════════
    ix, iy = hx, hy + 9 * row_h

    boxes.append(box(
        "obj-plotter", "newobj",
        text="fluid.plotter",
        numinlets=1, numoutlets=2,
        outlettype=["", ""],
        patching_rect=[ix, iy, 600, 400],
        presentation=1, presentation_rect=[10, 220, 600, 400]
    ))

    # After kdtree fit, dump the 2D dataset → plotter
    # fluid.dataset~ sweetspots_2d dump → dict name → plotter
    boxes.append(box(
        "obj-dump-2d-msg", "message",
        text="dump",
        numinlets=2, numoutlets=1,
        outlettype=[""],
        patching_rect=[ix, iy - 55, 40, 22]
    ))
    lines.append(patchline("obj-kdtree", 1, "obj-dump-2d-msg", 0))
    lines.append(patchline("obj-dump-2d-msg", 0, "obj-ds-2d", 0))
    # dataset dump outputs dict name from outlet 0 → plotter
    lines.append(patchline("obj-ds-2d", 0, "obj-plotter", 0))

    # ─── Color points by attractor type ───
    # After data loads, send pointcolor commands
    # We trigger colors after the dict arrives at plotter
    # Use a delay to ensure plotter has processed the dict
    boxes.append(box(
        "obj-color-delay", "newobj",
        text="delay 200",
        numinlets=2, numoutlets=1,
        outlettype=["bang"],
        patching_rect=[ix + 200, iy - 55, 75, 22]
    ))
    lines.append(patchline("obj-dump-2d-msg", 0, "obj-color-delay", 0))

    for att_id, color in ATTRACTOR_COLORS.items():
        att_presets = [p for p in presets if p[1] == att_id]
        if not att_presets:
            continue
        color_cmds = []
        for preset_idx, _, _, _ in att_presets:
            r, g, b, a = color
            color_cmds.append(f"pointcolor {preset_idx} {r} {g} {b} {a}")
        color_msg = ", ".join(color_cmds)
        boxes.append(box(
            f"obj-color-{att_id}", "message",
            text=color_msg,
            numinlets=2, numoutlets=1,
            outlettype=[""],
            patching_rect=[ix + 200 + att_id * 10, iy - 80 - att_id * 25, 300, 22]
        ))
        lines.append(patchline("obj-color-delay", 0, f"obj-color-{att_id}", 0))
        lines.append(patchline(f"obj-color-{att_id}", 0, "obj-plotter", 0))

    # Point labels
    label_cmds = []
    for idx, att_id, params, label in presets:
        safe_label = ATTRACTOR_NAMES[att_id]
        label_cmds.append(f"pointlabel {idx} {safe_label}")
    chunk_size = 10
    label_chunks = [label_cmds[i:i+chunk_size] for i in range(0, len(label_cmds), chunk_size)]
    for ci, chunk in enumerate(label_chunks):
        msg_text = ", ".join(chunk)
        boxes.append(box(
            f"obj-labels-{ci}", "message",
            text=msg_text,
            numinlets=2, numoutlets=1,
            outlettype=[""],
            patching_rect=[ix + 200, iy - 200 - ci * 25, 350, 22]
        ))
        lines.append(patchline("obj-color-delay", 0, f"obj-labels-{ci}", 0))
        lines.append(patchline(f"obj-labels-{ci}", 0, "obj-plotter", 0))

    # Legend
    boxes.append(box(
        "obj-legend", "comment",
        text="RED=Lorenz  GREEN=Rossler  BLUE=Chua  YELLOW=Halvorsen  PURPLE=Aizawa",
        numinlets=1, numoutlets=0,
        patching_rect=[ix, iy - 25, 500, 22],
        presentation=1, presentation_rect=[10, 200, 500, 18],
        fontsize=11.0
    ))

    # ═══════════════════════════════════════════════════════════════
    # J. PLOTTER CLICK → KDTREE LOOKUP → PRESET RECALL
    #    Plotter outlet 0 = x y floats (NOT point ID).
    #    Must pack into 2-elem buffer, query kdtree knearest.
    # ═══════════════════════════════════════════════════════════════
    jx, jy = ix, iy + 420

    # Plotter left outlet → "x y" as two floats
    # Pack into a 2-channel buffer for kdtree query
    boxes.append(box(
        "obj-click-buf", "newobj",
        text="buffer~ click_xy 1 2",
        numinlets=1, numoutlets=2,
        outlettype=["float", "bang"],
        patching_rect=[jx + 300, jy, 130, 22]
    ))

    # Use peek~ to write x and y into the buffer
    boxes.append(box(
        "obj-click-unpack", "newobj",
        text="unpack f f",
        numinlets=1, numoutlets=2,
        outlettype=["float", "float"],
        patching_rect=[jx, jy, 80, 22]
    ))
    lines.append(patchline("obj-plotter", 0, "obj-click-unpack", 0))

    # peek~ click_xy channel 1 (x)
    boxes.append(box(
        "obj-peek-x", "newobj",
        text="peek~ click_xy 1 0",
        numinlets=2, numoutlets=2,
        outlettype=["float", "bang"],
        patching_rect=[jx, jy + row_h, 130, 22]
    ))
    lines.append(patchline("obj-click-unpack", 0, "obj-peek-x", 0))

    # peek~ click_xy channel 2 (y)
    boxes.append(box(
        "obj-peek-y", "newobj",
        text="peek~ click_xy 2 0",
        numinlets=2, numoutlets=2,
        outlettype=["float", "bang"],
        patching_rect=[jx + 140, jy + row_h, 130, 22]
    ))
    lines.append(patchline("obj-click-unpack", 1, "obj-peek-y", 0))

    # After y is written, query kdtree: knearest click_xy 1
    boxes.append(box(
        "obj-knn-msg", "message",
        text="knearest click_xy 1",
        numinlets=2, numoutlets=1,
        outlettype=[""],
        patching_rect=[jx, jy + 2 * row_h, 130, 22]
    ))
    lines.append(patchline("obj-peek-y", 1, "obj-knn-msg", 0))

    # Route to kdtree
    boxes.append(box(
        "obj-kdtree-query", "newobj",
        text="fluid.kdtree~",
        numinlets=1, numoutlets=2,
        outlettype=["", ""],
        patching_rect=[jx, jy + 3 * row_h, 100, 22]
    ))
    lines.append(patchline("obj-knn-msg", 0, "obj-kdtree-query", 0))

    # kdtree also needs to be fitted — share the fit trigger
    boxes.append(box(
        "obj-kdtree-query-fit", "message",
        text="fit sweetspots_2d",
        numinlets=2, numoutlets=1,
        outlettype=[""],
        patching_rect=[jx + 120, jy + 3 * row_h, 120, 22]
    ))
    lines.append(patchline("obj-umap", 1, "obj-kdtree-query-fit", 0))
    lines.append(patchline("obj-kdtree-query-fit", 0, "obj-kdtree-query", 0))

    # kdtree output 0: nearest point ID (symbol)
    # Convert to int for coll lookup
    boxes.append(box(
        "obj-knn-fromsym", "newobj",
        text="fromsymbol",
        numinlets=1, numoutlets=1,
        outlettype=[""],
        patching_rect=[jx, jy + 4 * row_h, 80, 22]
    ))
    lines.append(patchline("obj-kdtree-query", 0, "obj-knn-fromsym", 0))

    # Coll lookup → recall preset
    boxes.append(box(
        "obj-recall-coll", "newobj",
        text="coll presets",
        numinlets=1, numoutlets=4,
        outlettype=["", "", "int", ""],
        patching_rect=[jx, jy + 5 * row_h, 120, 22]
    ))
    lines.append(patchline("obj-knn-fromsym", 0, "obj-recall-coll", 0))

    boxes.append(box(
        "obj-recall-send", "newobj",
        text="s toGen",
        numinlets=1, numoutlets=0,
        patching_rect=[jx, jy + 6 * row_h, 55, 22]
    ))
    lines.append(patchline("obj-recall-coll", 0, "obj-recall-send", 0))

    # Display recalled preset
    boxes.append(box(
        "obj-recall-display", "message",
        text="",
        numinlets=2, numoutlets=1,
        outlettype=[""],
        patching_rect=[jx + 80, jy + 6 * row_h, 350, 22],
        presentation=1, presentation_rect=[10, 630, 470, 22]
    ))
    lines.append(patchline("obj-recall-coll", 0, "obj-recall-display", 1))

    # Display recalled index
    boxes.append(box(
        "obj-recall-idx", "number",
        numinlets=1, numoutlets=2,
        outlettype=["", "bang"],
        patching_rect=[jx + 140, jy + 4 * row_h, 50, 22],
        presentation=1, presentation_rect=[490, 630, 50, 22]
    ))
    lines.append(patchline("obj-knn-fromsym", 0, "obj-recall-idx", 0))

    # ═══════════════════════════════════════════════════════════════
    # K. MANUAL EXPLORE — direct preset number entry
    # ═══════════════════════════════════════════════════════════════
    kx, ky = jx + 350, jy

    boxes.append(box(
        "obj-manual-label", "comment",
        text="Manual preset #:", numinlets=1, numoutlets=0,
        patching_rect=[kx, ky, 110, 22],
        presentation=1, presentation_rect=[10, 660, 110, 22]
    ))
    boxes.append(box(
        "obj-manual-num", "number",
        numinlets=1, numoutlets=2,
        outlettype=["", "bang"],
        minimum=0, maximum=num_presets - 1,
        patching_rect=[kx + 120, ky, 50, 22],
        presentation=1, presentation_rect=[120, 660, 50, 22]
    ))
    boxes.append(box(
        "obj-manual-coll", "newobj",
        text="coll presets",
        numinlets=1, numoutlets=4,
        outlettype=["", "", "int", ""],
        patching_rect=[kx + 120, ky + row_h, 120, 22]
    ))
    lines.append(patchline("obj-manual-num", 0, "obj-manual-coll", 0))

    boxes.append(box(
        "obj-manual-send", "newobj",
        text="s toGen",
        numinlets=1, numoutlets=0,
        patching_rect=[kx + 120, ky + 2 * row_h, 55, 22]
    ))
    lines.append(patchline("obj-manual-coll", 0, "obj-manual-send", 0))

    # ═══════════════════════════════════════════════════════════════
    # WRITE COLL DATA FILE
    # ═══════════════════════════════════════════════════════════════
    coll_file = OUT_FILE.parent / "presets.coll"
    with open(coll_file, "w") as f:
        for idx, att_id, params, label in presets:
            f.write(f"{idx}, {params};\n")
    print(f"  Wrote {coll_file}")

    # ═══════════════════════════════════════════════════════════════
    # ASSEMBLE PATCH
    # ═══════════════════════════════════════════════════════════════
    patch = {
        "patcher": {
            "fileversion": 1,
            "appversion": {
                "major": 8,
                "minor": 6,
                "revision": 0,
                "architecture": "x64",
                "modernui": 1
            },
            "classnamespace": "box",
            "rect": [50, 100, 1200, 900],
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
            "lefttoolbarpinned": 0,
            "toptoolbarpinned": 0,
            "righttoolbarpinned": 0,
            "bottomtoolbarpinned": 0,
            "toolbars_unpinned_last_save": 0,
            "tallnewobj": 0,
            "boxanimatetime": 200,
            "enablehscroll": 1,
            "enablevscroll": 1,
            "devicewidth": 0.0,
            "description": "",
            "digest": "",
            "tags": "",
            "style": "",
            "subpatcher_template": "",
            "assistshowspatchername": 0,
            "boxes": boxes,
            "lines": lines,
            "dependency_cache": [],
            "autosave": 0
        }
    }

    return patch


def main():
    print("Building sweetspot_explorer.maxpat...")
    patch = build_patch()

    with open(OUT_FILE, "w") as f:
        json.dump(patch, f, indent="\t")

    num_boxes = len(patch["patcher"]["boxes"])
    num_lines = len(patch["patcher"]["lines"])
    print(f"Generated {OUT_FILE}")
    print(f"  {num_boxes} objects, {num_lines} connections")
    print(f"  Open in Max alongside step6_chaos_resonator.maxpat")


if __name__ == "__main__":
    main()
