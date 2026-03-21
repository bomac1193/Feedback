# Feedback AV — The 15/10 Vision

> **Feedback + PERI + ComfyUI + TouchDesigner = emergent Afrofuturist AV from physics.**
> The same mathematics that generates the sound generates the image. Two trained neural models — one audio, one visual — both carrying your DNA. A self-organizing system the performer tunes, not plays.

---

## The Core Idea

Every existing AV performance falls into one of two traps:

1. **Visualizer trap**: Audio drives visuals reactively. The visuals illustrate the sound. Seen it a thousand times at MUTEK.
2. **Parallel track trap**: Audio and visuals are composed separately, synced manually. The connection is editorial, not structural.

**This is neither.** The Lorenz coordinates that excite the waveguides also condition the diffusion model. The Kuramoto phases that create the groove also structure the image. The swarm positions that produce polyphony also generate visual composition. **One mathematical system, two perceptual modalities.** Not illustration. Not parallel. Synesthetic translation.

---

## Architecture

```
MAX/MSP (Feedback Instruments + nn~ RAVE models)
│
│  All audio: P1 chaos resonator, P2 corpus resonance,
│  P3 Kuramoto rhythm, P4 swarm polyphony, RAVE voice(s)
│
│  OSC out (every frame):
│  ├── Lorenz/Rossler/Chua/Halvorsen/Aizawa XYZ coords
│  ├── chaos_gain, rho, sigma, beta, dt
│  ├── Kuramoto 6 phases + order parameter r
│  ├── Swarm agent positions (N × XY)
│  ├── FluCoMa: centroid, spread, loudness, pitch, MFCCs
│  ├── Trigger events (which voice, which freq)
│  └── RAVE latent vector (if active)
│
▼
TOUCHDESIGNER (brain — analysis, routing, compositing)
│
├── Feature extraction & conditioning
│   ├── Spectral centroid → color temperature
│   ├── Loudness → generation intensity/scale
│   ├── Kuramoto r (sync) → structural coherence
│   ├── Swarm density → visual complexity
│   ├── Attractor XYZ → ControlNet pose/depth
│   └── RAVE latent dims → style interpolation
│
├── ComfyUI API call (every N frames)
│   ├── Send: conditioning parameters as prompt + ControlNet
│   ├── Receive: generated frame(s)
│   └── Frame rate: 2-8 fps (diffusion) interpolated to 30/60fps in TD
│
├── Real-time GLSL layers (60fps, no latency)
│   ├── Attractor trail particles (data viz underlayer)
│   ├── Kuramoto ring (sync visualization)
│   ├── Audio-reactive feedback/distortion on ComfyUI frames
│   └── Swarm particles as overlay
│
├── Compositing
│   ├── ComfyUI frames (background/midground — the dream layer)
│   ├── GLSL layers (foreground — the data layer)
│   ├── Blend mode: ComfyUI opacity driven by chaos_gain
│   │   (more chaos = more hallucination, less chaos = more data viz)
│   └── Final color grading from FluCoMa spectral shape
│
▼
OUTPUT
├── NDI/Syphon → projector (live performance)
├── Screen (gallery/installation)
└── Recording (documentation)
```

### Why This Specific Stack

| Tool | Role | Why irreplaceable |
|------|------|-------------------|
| **Max/MSP** | All audio generation | gen~ chaos oscillators, FluCoMa, nn~ RAVE, waveguide resonators. No substitute. |
| **TouchDesigner** | Visual brain | Real-time compositing, OSC routing, GLSL shaders, API calls, projection. The conductor. |
| **ComfyUI** | Visual dreaming | Diffusion model generates imagery from audio features. Not a visualizer — a synesthetic translator. |
| **nn~ (RAVE)** | Neural audio voice | One voice in the network. Hot-swappable. Your timbre as a module. |

**No Unreal.** Photorealism is the wrong aesthetic. The diffusion artifacts — bleeding, morphing, latent space interpolation — ARE the visual language. They match the audio: impossible physical objects, emergent from mathematics. Unreal's precision would break the conceptual coherence.

---

## RAVE Model Hot-Swapping

nn~ loads any exported `.ts` RAVE model. PERI is the first. It won't be the last.

### How It Works

```
nn~ @model /path/to/model.ts

# Hot-swap during performance:
[message: nn~ @model /path/to/other_model.ts]
```

### Model Library (Current + Future)

| Model | Corpus | Character | Status |
|-------|--------|-----------|--------|
| **PERI** | Personal electronic productions | Your timbre, your textures | Training (v2_small, ~41k steps) |
| **Voice model** | 30-60 min vocal recordings | Your voice dissolved through chaos | Future (idea.md Phase 2) |
| **Field recording model** | Site-specific recordings | City/landscape as timbre | Future (per-residency) |
| **Archive model** | African music archive material | Cultural memory as neural voice | Future (grant-funded) |
| **Collaborative model** | Other artists' donated audio | Duo/ensemble performances | Future |

### The Design Principle

> "RAVE is ONE voice in the feedback network, not the whole instrument. When the next ML synthesis model drops, swap it in. The instrument persists."
> — Approaches.md

This means:
- **The instrument is the constant.** Chaos → waveguide → tuning → rhythm → polyphony. This architecture doesn't change.
- **The neural model is a module.** Like changing a reed on a clarinet. The clarinet persists.
- **Each model carries a different identity.** PERI = your electronic DNA. Voice model = your physical body. Field model = a place. Archive model = a history. The system speaks in different voices but the grammar (chaos math, African tuning, emergent rhythm) stays the same.
- **Multiple models simultaneously.** nn~ supports multiple instances. Run PERI on voice 1, Voice model on voice 5, archive model on voice 3. Three neural identities in one chaos-driven ensemble.

### ComfyUI LoRA Parallels

The same hot-swap logic applies to the visual side:

| Audio (nn~) | Visual (ComfyUI LoRA) | What it carries |
|-------------|----------------------|-----------------|
| PERI model | Your visual LoRA | Your aesthetic DNA |
| Voice model | Portrait LoRA | Your physical presence |
| Field model | Landscape LoRA | Site-specific visual language |
| Archive model | Historical LoRA | Visual memory of a culture/era |

**Two swappable neural layers — audio and visual — both carrying identity, both modulated by the same chaos mathematics.**

---

## The ComfyUI Pipeline

### What ComfyUI Does (and Doesn't Do)

**Does:**
- Generate frames conditioned on audio features (not "react to" — conditioned BY)
- Run a fine-tuned LoRA carrying your visual aesthetic
- Accept ControlNet conditioning from attractor geometry
- Produce 2-8 fps of novel imagery

**Doesn't:**
- Run in real-time (diffusion is inherently slow — 0.2-2 seconds per frame)
- Replace TouchDesigner (TD handles compositing, real-time layers, output)
- Generate "AI art" aesthetic (the LoRA + conditioning should produce YOUR look, not generic diffusion art)

### Conditioning Map

How audio features become visual parameters:

| Audio Feature | Source | ComfyUI Parameter | Visual Effect |
|---------------|--------|-------------------|---------------|
| **Spectral centroid** | FluCoMa | Color temperature (prompt weighting) | Bright sound = warm colors, dark sound = cool |
| **Loudness** | FluCoMa | Denoising strength | Loud = more abstraction, quiet = more structure |
| **Kuramoto order r** | P3 | ControlNet strength | Groove locked = structured image, free = dissolved |
| **Chaos regime** | Lorenz rho | CFG scale | Periodic orbit = coherent, chaotic = fragmented |
| **Attractor XYZ** | Any attractor | ControlNet depth/pose map | The attractor's shape IS the composition |
| **Swarm density** | P4 | Detail density / number of elements | Dense swarm = complex image, sparse = minimal |
| **RAVE latent** | nn~ | Style interpolation (LoRA weight blend) | Latent position = visual style morphing |
| **Pitch (Hz)** | FluCoMa | Hue rotation | Pitch maps to color wheel |
| **Trigger events** | P1/P3/P4 | Seed perturbation | Each trigger nudges the image |

### Frame Rate Strategy

Diffusion models can't run at 60fps. The solution:

```
ComfyUI generates: 2-8 fps (keyframes)
                    │
                    ▼
TouchDesigner interpolates: 30-60 fps
├── Optical flow interpolation between keyframes
├── GLSL displacement based on audio features (frame-rate independent)
├── Feedback TOP: previous frame feeds into current (creates temporal coherence)
└── Result: smooth, responsive visuals from slow generation
```

The latency (0.2-2 seconds) is actually a FEATURE, not a bug. The visuals respond to the sound with a slight delay — like a dream that follows the waking experience. The real-time GLSL layer provides immediate response. The ComfyUI layer provides deep response. Two temporal scales, one system.

### ComfyUI Workflow (API Mode)

```
Input:
├── Base prompt: "[your aesthetic keywords]" (static, from LoRA training)
├── Dynamic prompt suffix: generated from audio features per frame
├── ControlNet image: rendered attractor geometry from TD (depth map)
├── Seed: base seed + trigger event perturbation
├── Denoising strength: mapped from loudness
└── LoRA weight: mapped from RAVE latent position

Pipeline:
SDXL base → LoRA (your aesthetic) → ControlNet (attractor shape)
  → img2img from previous frame (temporal coherence)
  → output frame → TD via shared folder or websocket

Output:
├── Single frame (512×512 or 768×768)
├── Sent to TD as texture
└── TD upscales/composites to output resolution
```

---

## LoRA Training Plan

### Audio LoRA (RAVE/PERI) — Already Training

- **Corpus**: Your electronic productions
- **Architecture**: RAVE v2_small (CAPACITY=48)
- **Status**: Training in tmux `peri`, ~41k steps
- **Target**: 500k = test, 1.5M = clean realtime

### Visual LoRA (SDXL) — To Train

**Corpus preparation:**
1. Collect 50-200 reference images that define YOUR visual aesthetic
   - Album art you've made or admire
   - Performance stills / stage design references
   - Textures, materials, color palettes you're drawn to
   - Screenshots from your Clarosa taste vector (your Visual DNA)
   - Abstract/generative art that resonates
2. Caption each image (BLIP-2 auto-caption + manual refinement)
3. Train SDXL LoRA (kohya_ss or similar)
   - 50 images minimum, 200 ideal
   - ~1500 steps, learning rate 1e-4
   - Training time: ~30 min on A100, ~2 hours on RTX 4090
   - Can train on Modal for $2-5 total

**The result**: A diffusion model that generates images in YOUR visual language. Not "AI art." Not generic. Identifiable as yours the way PERI's output is identifiable as your sound.

---

## Performance Modes

### Mode 1: Full AV Set (60 min — CTM, Unsound, MUTEK, Atonal)

The complete system. Audio + ComfyUI visuals + TD compositing.

```
AUDIO ARC                          VISUAL ARC
────────────                       ──────────
0-10:  P4 sparse call-response     Minimal. Near-black. Single ComfyUI
       Single resonators           frames emerging slowly from darkness.
       PERI whispers               GLSL: faint attractor particles.

10-20: P3 enters. Low K.          ComfyUI frames more frequent.
       Sub-rhythmic pulses.        ControlNet strength rising (Kuramoto r).
       Cohesion building.          Color temperature warming.

20-35: GROOVE LOCKS. P3+P4.       Image structure locks with groove.
       Sub bass. Full ensemble.    ComfyUI + GLSL overlapping.
       Chaos through PERI.         Attractor geometry visible in images.
                                   Feedback TOP creates visual echoes.

35-45: PEAK. 200 voices sweep.    Maximum generation rate. Dense.
       Equiheptatonic tsunami.     Denoising strength high = abstract.
       Every resonator singing.    Color saturated. Composition complex.

45-55: P3 loosens. Voices scatter. ComfyUI slows. Images dissolve.
       Call-response returns.      Structure fragments.
       Individual notes.           GLSL particles scatter.

55-60: Single resonator.          Near-black. Last frame lingers.
       Silence.                    Darkness.
```

### Mode 2: Installation (Continuous — Serpentine, HKW, ZKM)

Self-regulating. No performer. ComfyUI generates frames continuously.

```
Aizawa attractor (smoothest, most bounded)
  → 6 resonators in Yoruba Pentatonic
  → FluCoMa feedback loop maintains energy homeostasis
  → ComfyUI generates 1 frame every 5-10 seconds
  → TD composites with slow feedback/accumulation
  → Projected in gallery space
  → Runs for days/weeks without intervention

Optional: camera/presence sensor modulates chaos_gain
  → More people = more chaos = more visual intensity
  → Empty room = calm = minimal generation
```

### Mode 3: Club Set (45 min — Boiler Room, Nyege Nyege, Atonal)

P3 Kuramoto focused. Groove-first. Visuals locked to rhythm.

```
Kuramoto at medium-high K (groove locked)
  → ComfyUI frames triggered ON Kuramoto pulses
  → Each trigger = new generation with perturbed seed
  → Visual rhythm matches audio rhythm
  → Sub bass = visual pulse
  → TD: heavy feedback, bloom, saturation
```

### Mode 4: Duo/Ensemble (with other musicians)

Audio input excites resonators. Other musician's sound enters the system.

```
External audio → FluCoMa analysis → modulates chaos parameters
  → Resonators excited by both chaos AND external signal
  → PERI encodes external signal → your timbre overlaid on theirs
  → ComfyUI conditioned by BOTH audio streams
  → The visual is the conversation between two sound sources
```

---

## The Curatorial Pitch

### For CTM Berlin

> Four instruments built from chaos mathematics and synchronization physics, tuned to 19 African tonal systems. Lorenz attractors excite waveguide resonators. Kuramoto coupled oscillators produce polyrhythm from phase transitions. A swarm of 200 agents generates emergent polyphony in equiheptatonic tuning. A RAVE neural model trained on the artist's corpus provides one voice in the network — swappable, modular, one identity among potential many. The same mathematical structures that generate the sound condition a diffusion model that generates the imagery. Nothing is illustrated. Nothing is synced. One system, two perceptual modalities. The performer tunes the relationship between order and emergence.

### For Serpentine Arts Technologies

> A self-organizing audiovisual system where trained neural models mediate between chaos mathematics and human perception. The audio layer: five strange attractors drive physically-modeled resonators through African tonal systems. A RAVE model trained on the artist's corpus provides neural voice synthesis. The visual layer: a diffusion model fine-tuned on the artist's visual language generates imagery conditioned by the same mathematical parameters that generate the sound. The system exhibits emergent behaviour at multiple scales — rhythmic groove from Kuramoto synchronization, melodic call-and-response from swarm dynamics, visual composition from audio-conditioned diffusion. The performer steers a living system. The audience inhabits a synesthetic field generated from first principles.

### For Unsound Krakow

> Chaos through African tuning through neural models through diffusion. A 60-minute AV performance where groove emerges from physics, polyphony emerges from collective behaviour, and visuals emerge from sound. Two neural models carry the artist's identity: one trained on their sound (RAVE), one trained on their visual language (SDXL LoRA). Both are modulated by the same Lorenz attractor. The performance arc: sparse call-and-response → sub-bass groove locks → 200-voice equiheptatonic peak → dissolution. The visuals follow the same arc through the same mathematics.

### The One Sentence

> **"A self-organizing instrument where chaos mathematics, African tuning systems, and trained neural models generate sound and image from the same equations."**

---

## Technical Implementation Steps

### Phase A: Audio → TD (You have most of this)

- [x] Chaos oscillators in gen~ (Lorenz working, 4 more planned)
- [x] Waveguide resonators in gen~ (6 voices, 19 tuning systems)
- [x] Polyrhythmic pattern engine (9 patterns, bitmask voice allocation)
- [x] Root snap-back, sub-bass waveguide, output saturation
- [x] 50 curated presets from attractor discovery agent
- [x] OSC output to TD (port 7000)
- [x] TD visualization script (build_viz.py)
- [ ] FluCoMa feedback loop (analysis → parameter modulation)
- [ ] Kuramoto engine in gen~ (P3)
- [ ] Swarm engine in JS/gen~ (P4)
- [ ] PERI integration via nn~ (when training hits 500k)
- [ ] FluCoMa feature extraction → OSC (centroid, loudness, MFCCs, pitch)

### Phase B: TD → ComfyUI Bridge

- [ ] Install ComfyUI on Windows side (SDXL + ControlNet)
- [ ] Set up ComfyUI API mode (`--listen 0.0.0.0 --port 8188`)
- [ ] Build TD → ComfyUI WebSocket connection (Script CHOP or Web Client DAT)
- [ ] Map audio features to ComfyUI API parameters
- [ ] Render attractor geometry as ControlNet depth map (TD Render TOP → image)
- [ ] Receive generated frames back into TD (Web Client DAT or shared folder)
- [ ] Frame interpolation in TD (Optical Flow TOP or GLSL interpolation)

### Phase C: ComfyUI Aesthetic

- [ ] Collect 50-200 visual reference images
- [ ] Train SDXL LoRA (Modal or local RTX 4090)
- [ ] Build ComfyUI workflow: SDXL + LoRA + ControlNet + img2img
- [ ] Test: audio features → conditioning → generation → TD composite
- [ ] Tune: find the aesthetic sweet spot (denoising strength, CFG, ControlNet weight)

### Phase D: Real-Time GLSL Layers (TD)

- [ ] Attractor particle trail (instanced SOPs from build_viz.py — already exists)
- [ ] Kuramoto ring visualization (from build_viz.py — already exists)
- [ ] Swarm particle field (from build_viz.py — already exists)
- [ ] Audio-reactive GLSL displacement on ComfyUI frames
- [ ] Feedback TOP chain (ComfyUI frame → feedback → composite)
- [ ] Color grading from FluCoMa spectral shape
- [ ] Compositing pipeline: ComfyUI bg + GLSL layers + final grade

### Phase E: Integration + Performance

- [ ] Full signal chain test: Max → TD → ComfyUI → TD → output
- [ ] Latency profiling: measure end-to-end from audio event to visual response
- [ ] Record 3-min AV documentation
- [ ] Record 15-min AV performance
- [ ] Build performance template (Max + TD project files, ComfyUI workflow)

---

## What This Pioneers

### The New Style

No name for it yet. The characteristics:

1. **Audio from first principles** — Not samples, not presets, not loops. Chaos mathematics through physical models in non-Western tuning. Every sound is generated live from equations.

2. **Visuals from the same first principles** — Not a visualizer, not pre-rendered, not illustration. The mathematical parameters that shape the sound shape the image through a trained neural model.

3. **Neural identity as module** — RAVE model = your audio DNA. SDXL LoRA = your visual DNA. Both swappable. The system can speak in different voices but the grammar (chaos, tuning, emergence) stays constant.

4. **Emergent everything** — Groove emerges from Kuramoto coupling. Melody emerges from swarm behavior. Visual composition emerges from audio conditioning. Nothing is composed. Everything is steered.

5. **African mathematical foundations** — Not decoration, not preset, not sample. The tuning systems, rhythm patterns, and ensemble principles ARE the architecture. Yoruba pentatonic IS the waveguide frequency. Bembe bell pattern IS the voice allocation. Arom's emergent polyphony IS the swarm algorithm.

### Why No One Else Can Do This

The intersection requires simultaneous expertise in:
- Chaos mathematics (5 attractor systems at audio rate)
- Physical modeling synthesis (waveguide resonators in gen~)
- Computational ethnomusicology (19 African tuning systems from published sources)
- Machine learning audio (RAVE training and deployment)
- Machine learning vision (SDXL LoRA training and conditioning)
- Real-time visual programming (TouchDesigner GLSL + compositing)
- Diffusion model engineering (ComfyUI API + ControlNet)
- FluCoMa ecosystem (real-time audio analysis)
- Live performance (the system must be PLAYABLE, not just demonstrable)

That intersection currently has one person in it.

### The Festival Trajectory

| When | Where | What | Format |
|------|-------|------|--------|
| **2026 Q3-Q4** | alabo.studio | AV documentation + demos | Online |
| **2026 Q4** | Cycling '74 | Featured artist: gen~ + ComfyUI | Article + video |
| **2027 Jan** | CTM Berlin | Full 60-min AV set or research lab | Performance |
| **2027 Q1** | Unsound Krakow | Full AV performance | Performance |
| **2027 Q1-Q2** | Rewire The Hague | Performance + installation proposal | Both |
| **2027 Q2** | MUTEK Montreal | Full AV set (A/Visions program) | Performance |
| **2027 Q2** | Serpentine | Commission proposal | Installation |
| **2027 Q3** | Berlin Atonal | P1+P3 focused (Kraftwerk) | Performance |
| **2027 Q3** | Nyege Nyege | P3+P4 African rhythm engine | Performance |
| **2027** | MaerzMusik | P4 swarm as time-based art | Commission |
| **2027** | HKW Berlin | Full practice + discourse | Exhibition |
| **2027** | EMS Stockholm | Residency — develop + record | Residency |

---

## Hardware Requirements

### Performance Setup

```
LAPTOP (Windows — runs Max/MSP, ComfyUI, TouchDesigner)
├── GPU: RTX 4090 Laptop (16GB VRAM)
│   ├── ComfyUI: ~6-8GB VRAM for SDXL + LoRA + ControlNet
│   ├── TouchDesigner: ~2-4GB VRAM for rendering
│   └── Headroom: ~4-6GB
├── CPU: runs Max/MSP + gen~ + FluCoMa + nn~
├── Audio interface: for mic input + monitor output
├── MIDI controller: for K (coupling), cohesion, separation, alignment, chaos params
└── NDI/HDMI: to projector

PROJECTOR
├── Min 1080p, ideally 4K
├── Short-throw for gallery, long-throw for festival
└── Aspect ratio: flexible (the visuals adapt)
```

### Can the RTX 4090 Laptop Handle All Three?

| Process | GPU Usage | Notes |
|---------|-----------|-------|
| ComfyUI (SDXL, 512×512, 20 steps) | ~6GB VRAM, ~2-4 sec/frame | Runs at 2-8 fps |
| TouchDesigner (render + composite) | ~2GB VRAM | 60fps |
| Max/MSP + nn~ (PERI) | ~1GB VRAM (if GPU inference) | Or CPU-only |
| **Total** | **~9GB** | **Fits in 16GB with headroom** |

Yes. The RTX 4090 laptop handles it. The key is running ComfyUI at modest resolution (512×512) and letting TD upscale. 20 diffusion steps at 512×512 = ~2-3 seconds per frame on 4090. That's 3-5 fps of novel imagery, interpolated to 60fps by TD.

For larger venues: pre-generate at higher resolution, or use a second machine for ComfyUI (connected via network).

---

## Relationship to Existing Documents

This document extends, does not replace:

| Document | Still authoritative for |
|----------|----------------------|
| **Approaches.md** | Four-instrument architecture, ICP scores, label strategy, grant strategy |
| **ROADMAP.md** | Build order (Phases 1-13), week-by-week plan |
| **Chaos Attractors.md** | All 5 attractor equations, combining modes, parameter mapping |
| **Tuning-Systems.md** | All 19 tuning systems, gen~ implementations |
| **Call-and-Response.md** | Swarm polyphony musicological grounding |
| **idea.md** | Corpus Possession album concept (PERI + FluCoMa + voice) |
| **PITCH_DECK.md** | Grant/label pitch slides |
| **td/README.md** | Current TD build script documentation |
| **Agentic Directions.md** | AI agent integration roadmap |

**This document adds:** The ComfyUI visual layer, the RAVE hot-swap architecture, the compositing pipeline, performance modes, and the curatorial positioning that makes it a 15/10.

---

*Last updated: 2026-03-18*
*Part of the Feedback instrument system.*
