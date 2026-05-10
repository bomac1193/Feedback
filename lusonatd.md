# Lusona TD (parked)

Refactor of the TouchDesigner real-time layer away from cymatics toward a geomantic-field primitive. Parked while ComfyUI inheritance moat (father-art LoRA + geomantic prompt fusion) is being built. Revisit once the ComfyUI bridge is producing frames worth carrying.

## Why move off cymatics

Cymatics is the most literal audio-to-visual primitive that exists (Chladni, 18th c. European acoustics). It works against two things we already committed to:

1. Nommo audio-visualist lineage, which resists direct sound illustration.
2. Geomancy as cross-project root (lusona, veve, ifa odu, sikidy, khatt al-raml). The visual primitive should *be* one of those, not borrow from a different tradition.

Cymatics also locks us into a "reactive visualizer" reading that competes with a saturated field of audio-reactive shader work. Geomantic primitives are unclaimed.

## What replaces it

TD becomes a live geomantic-field generator. Sound modulates *what* is drawn and *how fast*, not *what shape* the field takes. The shape carries its own grammar from the divinatory tradition.

Candidate primitives (pick one or layer):

- **Lusona Eulerian path tracer.** A closed sand-drawing path drawn in one continuous stroke, animated as it forms. Sound peaks advance the trace head; idle holds the figure. Path library: `kasanga`, `chinyangwa`, etc.
- **Ifa odu binary marks.** Sixteen four-line glyphs cast live. Audio events (peak / Kuramoto coherence threshold / FFT band) cast a new odu. Holds, then casts again on next event.
- **Sikidy tableau.** 4x4 grid of seed marks, generated and reduced live. Each cell has its own micro-pulse.
- **Veve sigil layer.** Pre-traced veve sigils for specific lwa, fading in / out on event triggers. Closer to mythic stills than animated field.

## Sound modulation rules

Audio never sets the shape. It chooses *which* figure and *when* to advance.

- Loudness peak (existing gate envelope): advance trace head, cast new odu, redraw veve.
- Kuramoto coherence (vec1.x): selects which figure family is drawn (high coherence = closed lusona, low = scattered odu marks).
- Spectral centroid / brightness: tints the line color along the lineage palette already in shader.
- Existing scale / contrast / idle envelopes: carry over to control draw-trail decay and ground darkness.

## Implementation outline

- Replace `chaos_viz_pixel_textured.glsl` body with a path-tracer pass.
- New input: `sTD2DInputs[1]` is a CHOP-to-TOP table of lusona path vertices (or generated procedurally).
- `osc_update` computes which figure index is active and writes a `figureIndex` uniform plus a `traceProgress` 0..1.
- Cymatics retires entirely or demotes to a faint dust substrate that nodal lines emerge from.

## Open questions

- Generate lusona procedurally from a graph (more flexible) vs. ship a curated SVG library (more authentic).
- One figure at a time vs. tableau of small multiples (sikidy logic).
- Whether ComfyUI frames composite *under* the TD geomantic layer or vice versa.

## Trigger to unpark

Revisit once at least one of the following holds:

- Father-art LoRA produces frames where the visual signature is recognizable as inheritance.
- ComfyUI bridge can deliver a new frame in under 6 seconds reliably.
- A live show or gallery date forces the question.
