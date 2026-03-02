# Feedback — TouchDesigner Visualization

## Quick Start

1. Open TouchDesigner (Project1.toe or new project)
2. Open Textport (Alt+T)
3. Run:

```python
exec(open('D:/Visuals/Touchdesigner/Projects/Feedback/td/build_viz.py').read())
```

Adjust the path to wherever you put this file on the Windows side.

## What It Builds

A `feedback_viz` container inside `/project1/` with:

- **OSC In CHOP** on port 7000 (receives all Max data)
- **P1 Lorenz**: amber particle trail tracing the attractor path + head sphere
- **P3 Kuramoto**: 6 dots on a ring at their phase angles, color shifts blue→amber with sync
- **P4 Swarm**: N colored particles, 6 voice colors, flash on note triggers
- **Render pipeline**: camera + light + render + bloom (blur→level→composite) → output

## OSC from Max

Make sure Max is sending to the Windows host IP on port 7000:

```
[udpsend 172.24.64.1 7000]
```

## Modifying

The build script destroys and recreates the container each time. Safe to re-run.

Script CHOP callbacks contain the interesting logic:
- `kura_positions` — converts phase (0-1) to XY on ring, colors by order parameter r
- `kura_shuffle` — reformats indexed channels (tx0,ty0...) into instance format (tx,ty with N samples)
- `swarm_positions` — parses flat OSC position list into instance channels with per-voice colors and trigger flash
