# Four Instruments. One Practice.

> **Project 1 — Feedback Instrument**: explores the SELF (sonic identity through cybernetic feedback)
> **Project 2 — Corpus Resonance Instrument**: explores the WORLD (cultural archives through physical resonance)
> **Project 3 — Coupled Rhythm Engine**: explores the COLLECTIVE (synchronization, polyrhythm, groove)
> **Project 4 — Swarm Polyphony Engine**: explores the ENSEMBLE (emergent melody, call-and-response, harmonic motion from agent behavior)

---

## Table of Contents

1. [Project 1: Feedback Instrument (Cybernetic Synthesis)](#project-1-feedback-instrument)
2. [Project 2: Corpus Resonance Instrument (FluCoMa + Physical Modeling)](#project-2-corpus-resonance-instrument)
3. [Project 3: Coupled Rhythm Engine (Kuramoto Polyrhythm)](#project-3-coupled-rhythm-engine)
4. [Project 4: Swarm Polyphony Engine (Emergent Ensemble)](#project-4-swarm-polyphony-engine)
5. [ICP Analysis & Scores](#icp-analysis--scores)
5. [Grants & Funding Strategy](#grants--funding-strategy)
6. [Timeline](#timeline)
7. [Technical Reference](#technical-reference)

---

## Project 1: Feedback Instrument

### Concept

A self-modifying cybernetic instrument where:
- **Chaos oscillators** (Lorenz/Rossler attractors in gen~) provide excitation
- **Physical model resonators** (waveguide synthesis in gen~) provide the body — this is where the sub bass lives
- **FluCoMa** analyzes the output in real-time (spectral shape, pitch, loudness, MFCCs, transient density)
- **Feedback mapping** routes the analysis BACK into the chaos parameters and resonator tuning
- The system steers itself. You steer the steering.

### Architecture

```
    +----------------------------------------------+
    |                                              |
    v                                              |
CHAOS OSCILLATOR (gen~)                            |
Lorenz/Rossler at audio rate                       |
    |                                              |
    v                                              |
PHYSICAL MODEL RESONATOR (gen~)                    |
Waveguide / modal synthesis                        |
= impossible resonant bodies                      |
= SUB BASS (30Hz waveguide = Atonal territory)    |
= metallic harmonics, glass textures              |
    |                                              |
    v                                              |
FluCoMa ANALYSIS                                   |
fluid.spectralshape~, fluid.pitch~,                |
fluid.loudness~, fluid.mfcc~,                      |
fluid.onsetslice~                                  |
    |                                              |
    v                                              |
FEEDBACK MAPPING (custom logic)                    |
Analysis results MODIFY:                           |
  - Chaos attractor parameters (sigma, rho, beta)  |
  - Resonator tuning (length, damping, material)   |
  - Feedback gain + routing                        |
    |                                              |
    +----------------------------------------------+
```

RAVE (PERI model) is ONE voice in the feedback network, not the whole instrument. When the next ML synthesis model drops, swap it in. The instrument persists.

### Why This Is a 10 (Not RAVE Alone)

| Dimension | RAVE | Feedback Instrument |
|-----------|------|---------------------|
| **Novelty** | Everyone's seen it at CTM 2024-2025 (Herndon, Bleau, etc.) | Nobody has built this with FluCoMa yet |
| **Timelessness** | ML model, will be superseded by next architecture | Cybernetics + physics. Doesn't age. |
| **Lineage** | IRCAM ML research (Caillon 2021) | David Tudor (Rainforest), Alvin Lucier (I Am Sitting in a Room), Gordon Mumma, Eliane Radigue — canonical experimental music history |
| **Sub bass** | Not great at low frequencies | Physical model waveguides = MASSIVE low end. Tune to 30Hz. |
| **Liveness** | Encode -> decode, somewhat predictable | Genuinely emergent. Each performance different. |
| **Your role** | Operating a model | Steering a living system |
| **Album potential** | Timbre generator (one dimension) | Compositional system (infinite territory). Each track = different region of the system's behavior. |
| **Conceptual depth** | "I trained a neural net" | "I built an instrument that listens to itself" |
| **Visual dimension** | Not inherently visual | Chaos attractor IS the visual. XYZ coords = 3D strange attractor in TD. |

### Chaos Oscillators: Build in Max, Not JUCE

**gen~** is where you build:
- Audio rate processing (sample-by-sample)
- 20 lines of code for a Lorenz attractor
- Direct connection to nn~ (RAVE/PERI), FluCoMa, everything
- This is your performance instrument, your discovery environment

**JUCE** comes later:
- Only when you want to package it as a VST/AU plugin
- The Ableton partnership / Max4Live distribution angle
- Don't build there first — gen~ is where you find the sound, JUCE is where you ship it

### Lorenz Attractor in gen~ (Pseudocode)

```c
// Parameters (these are what the feedback loop modifies)
Param sigma(10);    // Prandtl number
Param rho(28);      // Rayleigh number
Param beta(2.667);  // Geometric factor
Param dt(0.0001);   // Integration step (tune for audio rate)
Param gain(0.05);   // Output scaling

// State variables (History for sample-by-sample persistence)
History x(0.1);
History y(0);
History z(0);

// Runge-Kutta 4th order integration
dx = sigma * (y - x);
dy = x * (rho - z) - y;
dz = x * y - beta * z;

x += dx * dt;
y += dy * dt;
z += dz * dt;

// Audio output (x is most chaotic)
out1 = x * gain;

// Send x, y, z to outlets for:
// - Physical model excitation (audio)
// - OSC to TouchDesigner (visuals)
// - FluCoMa analysis input
out2 = y * gain;
out3 = z * gain;
```

### Physical Model Resonator in gen~ (Waveguide Sketch)

```c
// Karplus-Strong / waveguide for resonant body
Param freq(40);        // Resonant frequency (30-80Hz = sub territory)
Param damping(0.995);  // Decay time (0.99 = short, 0.999 = long ring)
Param brightness(0.5); // Lowpass in the loop

// Delay line length = samplerate / frequency
delay_samples = samplerate / freq;

// Excitation input (from chaos oscillator)
excitation = in1;

// Read from delay line
delayed = delay(buffer, delay_samples);

// Lowpass filter in feedback loop (controls brightness/material)
filtered = delayed * brightness + prev * (1 - brightness);
History prev(0);
prev = filtered;

// Write excitation + filtered feedback back into delay line
buffer = excitation * 0.1 + filtered * damping;

out1 = delayed;
```

### TouchDesigner Visual Workflow

```
MAX/MSP (audio engine)
|
+-- gen~ chaos oscillator -> audio out
|   +-- also outputs raw X, Y, Z floats via OSC
|
+-- FluCoMa analysis of the output
|   +-- spectral features, pitch, loudness, MFCCs
|
+-- OSC send -----------------------> TOUCHDESIGNER
    - chaos X, Y, Z coords             |
    - FluCoMa analysis data             +-- 3D attractor viz:
    - resonator state                   |   Geometry COMP + instanced SOPs
    - latent position (if RAVE)         |   Point trail colored by audio features
                                        |   Periodic orbits = clean loops
                                        |   Chaotic regions = space-filling clouds
                                        |
                                        +-- Audio-reactive shaders:
                                        |   GLSL TOP driven by FluCoMa data
                                        |   Spectral shape = color palette
                                        |   Loudness = scale/intensity
                                        |
                                        +-- Camera/SAM (optional):
                                        |   Gesture -> OSC back to Max
                                        |   Body movement steers the attractor
                                        |
                                        +-- NDI/Syphon -> projector
```

**The audience sees the sound's behavior.** When the system is in a periodic orbit, the attractor draws clean loops. When it goes chaotic, it fills space. The visual and audio are the same data rendered in two modalities.

---

## Project 2: Corpus Resonance Instrument

> Build AFTER the feedback instrument. Uses the same gen~ resonators, same FluCoMa analysis, same chaos navigation — but adds external corpus material. The archive becomes the instrument.

### The Pain Point It Solves

**For festivals**: They want to commission site-specific or culturally-specific works but music artists rarely deliver them (visual artists do constantly). This instrument takes ANY audio archive and makes it into a site/culturally-specific commissioned performance.

**For labels**: Each album uses a different corpus. The instrument is the constant, the material changes. Infinite albums from one practice.

**For grants/arts councils**: "Activating cultural archives as live instruments through physical modeling" — this is EXACTLY what they want to fund. Heritage + innovation. Every arts council on earth says yes to this.

**For residencies**: "I'll come to your city, record field recordings, and make your city into an instrument." Every residency says yes.

### Concept

1. **Ingest** any audio corpus (field recordings, African music archive, found sound, your own productions)
2. **FluCoMa decomposition**: NMF, HPSS, transient/residual separation breaks corpus into thousands of micro-segments
3. **FluCoMa embedding**: Each segment analyzed (spectral shape, MFCCs, pitch, loudness) and mapped into n-dimensional timbre space
4. **Navigation**: Chaos attractors from the feedback instrument DRIVE navigation through the corpus space. Or gesture control. Or both.
5. **Physical model re-excitation**: Selected corpus segments don't just PLAY BACK — they EXCITE the waveguide resonators from the feedback instrument. The archived sound resonates through impossible physical bodies.

### Why This Is Different From Existing Corpus Tools

| Tool | Problem | Corpus Resonance Instrument |
|------|---------|---------------------------|
| CataRT (IRCAM) | 15+ years old. Sounds like granular synthesis. | Physical modeling step transforms playback into SYNTHESIS. |
| FluCoMa alone | Toolkit, not an instrument. Requires extensive patching. | Complete instrument with defined workflow. |
| Standard granular | Grains sound like... grains. Cut-up samples. | Resonator adds harmonics, bass, and character NOT in the source. A field recording of rain becomes a resonant metallic texture. |
| RAVE/neural | Destroys the source identity. You hear the model, not the material. | Source material remains recognizable but TRANSFORMED through resonance. The archive is audible. |

### Architecture

```
AUDIO CORPUS (any source)
    |
    v
FluCoMa DECOMPOSITION
fluid.bufselectevery~, fluid.bufnmf~,
fluid.bufhpss~, fluid.buftransientslice~
    |
    v
FluCoMa ANALYSIS & EMBEDDING
fluid.bufspectralshape~, fluid.bufmfcc~,
fluid.bufpitch~, fluid.bufstats~
    |
    v
TIMBRE SPACE MAP (fluid.dataset~, fluid.kdtree~)
n-dimensional space of all corpus segments
    |
    v
NAVIGATION ENGINE
+-- Chaos attractor trajectory (from feedback instrument)
+-- Gesture control (MIDI, OSC from TD)
+-- Autonomous drift (random walk in timbre space)
    |
    v
SELECTED CORPUS SEGMENTS
    |
    v
PHYSICAL MODEL RESONATOR (gen~)        <--- SAME resonators from Project 1
Corpus segments = EXCITATION
Waveguide = RESONANT BODY
    |
    v
FluCoMa ANALYSIS (optional feedback)
    |
    v
AUDIO OUTPUT + OSC -> TOUCHDESIGNER
```

### The Grant Magnet Angle

"Activating the African diaspora sonic archive as a live instrument"

This framing works for:
- **Africa No Filter**: African sonic heritage + cutting-edge technology. Their thesis.
- **Goethe-Institut**: Cultural exchange through sound. German technology (FluCoMa was developed in Huddersfield but the festivals are in Germany) activating African archives.
- **British Council**: Heritage + innovation. Premiere at Rewire or CTM.
- **UNESCO**: Intangible cultural heritage + technology.
- **Smithsonian Folkways**: They have massive African music archives. Propose activating their collection as a live instrument.
- **SOAS University London**: Huge African music archive. Academic collaboration potential.
- **Pro Helvetia** (Swiss Arts Council): They fund experimental music heavily. Swiss connection via Lausanne Underground Film & Music Festival.

But the corpus can be ANYTHING — that's the power:
- Field recordings from a specific city (residency angle)
- A festival's own archive (commission angle — "I'll make CTM's 20-year archive into an instrument")
- Found sound from a specific site (installation angle)
- Historical recordings (museum/gallery angle)

### Artistic Narrative Across Both Projects

| | Feedback Instrument | Corpus Resonance Instrument |
|---|---|---|
| **Explores** | The SELF | The WORLD |
| **Source material** | Self-generated (chaos + feedback) | External archive |
| **Identity** | Your sonic fingerprint through cybernetics | Cultural memory through physical resonance |
| **Album concept** | Mapping the territory of a living system | Activating an archive as a new body of work |
| **Commission angle** | "New instrument" | "Site/culturally-specific activation" |
| **Visual** | Strange attractor (autonomous, abstract) | Corpus map navigation (concrete, navigable) |

---

## Project 3: Coupled Rhythm Engine

> Build AFTER Projects 1 & 2. Uses the same gen~ resonators, same FluCoMa analysis — but the organizing principle is RHYTHM, not timbre. Multiple oscillators synchronize and desynchronize, producing polyrhythm from physics. Tuned to African tonal systems, not 12-TET.

### The Thesis: Post-Colonial African Musicology in Synthesis

> **See [Tuning-Systems.md](./Tuning-Systems.md) for the full technical breakdown of each tuning system with gen~ implementations.**

Every synthesizer ever built encodes Western music theory. 12-tone equal temperament. 4/4 time signatures. Chord-based harmony. Diatonic scales. This is not universal — it's one cultural system presented as default.

African music operates on fundamentally different principles:

**Tuning (corrected — region-specific, not monolithic):**
- **Yoruba Anhemitonic Pentatonic** (PRIMARY — West Africa/Nigeria): 5 notes built from fourths and fifths. Steps are UNEQUAL (~200, 200, 300, 200, 300 cents). Has tonal gravity. Flexible intonation. The home tuning for these instruments.
- **Dundun 3-Tone System** (Yoruba speech-derived): Low/Mid/High (~200 cents apart) with glides. The talking drum's pitch system = Yoruba language tones. The rhythm engine literally speaks.
- **Ogene Intervals** (Igbo): Major second + major third as foundational intervals. Built into the metal. Timbral DNA.
- **Balafon Pentatonic** (Mandinka/broader West Africa): Near-equipentatonic (5 roughly equal steps of ~240 cents). Less tonal gravity, more floating.
- **Equiheptatonic** (Central/Southern Africa — Kubik): 7 equal steps of ~171 cents. Maximum departure from Western tonality. Available as alternate mode but NOT the primary Nigerian/West African system.
- **Flexible intonation**: Yoruba pitch bends in context. This is not imprecision — it's a feature. The `flex` parameter in gen~ models this.

**Rhythm:**
- Not "4/4 with syncopation." Not additive. Not divisive.
- Based on **timeline patterns** — asymmetric cycles that serve as a shared reference (e.g., the bell pattern 2-2-1-2-2-2-1 over 12 pulses). There is no "beat one" in the Western sense.
- **Interlocking**: Multiple parts that are incomplete alone but create the whole together. Each musician's part is a perspective on the same temporal structure.
- **Multiple reference points simultaneously**: You can hear the same music as being "in 3" or "in 4" depending on which layer you track. This is not ambiguity — it's design.

**Harmony:**
- Not chord-based (stacked thirds). Interval-based — parallel motion in non-Western intervals.
- **Resultant melodies**: The "melody" emerges from the interaction of rhythmic parts, not from a single voice.
- Harmony is a RHYTHMIC phenomenon, not a vertical one.

**Key scholars:**
- Kofi Agawu — *Representing African Music* (2003): Critique of Western analytical frameworks imposed on African music
- Simha Arom — *African Polyphony and Polyrhythm* (1991): The science of Central African interlocking (Aka, Banda Linda)
- Gerhard Kubik — Documented equiheptatonic/equipentatonic tuning across Africa
- J.H. Kwabena Nketia — *The Music of Africa* (1974): Foundational text
- Akin Euba — Yoruba drumming, African pianism: bridging traditions and contemporary practice
- Olly Wilson — "The Heterogeneous Sound Ideal": African music values timbral contrast within ensemble, not blend

### How This Changes All Three Instruments

This thesis isn't just Project 3 — it retroactively deepens Projects 1 and 2:

| | Without African Musicology | With African Musicology |
|---|---|---|
| **P1 Feedback Instrument** | Waveguide resonators in 12-TET or arbitrary tuning | Resonators tuned to equiheptatonic/equipentatonic scales. The physical models embody African tonal logic. Sub bass in intervals that don't exist in Western music. |
| **P2 Corpus Resonance** | Archive played through generic resonators | FluCoMa LEARNS the tuning system of the source archive. Resonators adapt to the corpus's own tonal logic. Not imposing 12-TET on African recordings. |
| **P3 Coupled Rhythm** | Polyrhythm from arbitrary oscillator frequencies | Oscillators tuned to African timeline patterns. Interlocking as a structural principle. Kuramoto coupling models the social dynamics of ensemble drumming. |

**Why this matters for ICPs:** "Decolonizing music technology" is the single most fundable thesis in European arts councils right now. But more importantly — it produces sounds that NO OTHER SYNTHESIZER makes, because every other synth is built on Western assumptions.

### The Kuramoto Model for Polyrhythm

The [Kuramoto model](https://en.wikipedia.org/wiki/Kuramoto_model) describes how coupled oscillators synchronize — it's the math behind:
- Fireflies flashing in unison
- Neurons firing together
- Heart cells coordinating
- Pendulum clocks on the same wall syncing up
- And: **drummers in an ensemble locking into a groove**

The model:
- N oscillators, each with a natural frequency (their individual "feel")
- Coupling strength K controls how much they listen to each other
- At **low K**: each oscillator is independent → free, polymetric texture
- At **critical K**: they suddenly begin to lock → groove EMERGES
- At **high K**: perfect unison → boring
- **The interesting zone is near critical K**: partial synchronization, some voices locked, some drifting = POLYRHYTHM

This maps directly to West African ensemble drumming:
- Each drummer has their own pattern (natural frequency)
- They listen to each other through the timeline/bell pattern (coupling)
- They lock and drift (groove + tension)
- The master drummer controls the energy (coupling strength)
- **You are the master drummer.** You control K.

### Architecture

```
KURAMOTO COUPLED OSCILLATOR NETWORK (gen~)
N oscillators, each with natural frequency
Coupling strength K = your main performance control
    |
    |--- Oscillator 1 (timeline / bell pattern rate)
    |--- Oscillator 2 (supporting pattern rate)
    |--- Oscillator 3 (response pattern rate)
    |--- Oscillator 4 (cross-rhythm rate)
    |--- Oscillator 5 (bass pattern rate)
    |--- Oscillator 6 (accent pattern rate)
    |
    v (each oscillator phase-crossing generates a TRIGGER)
    |
TRIGGER ROUTING
Each trigger excites a different physical model resonator
    |
    |--- Trigger 1 --> Waveguide resonator @ equiheptatonic root
    |--- Trigger 2 --> Waveguide resonator @ equiheptatonic 2nd
    |--- Trigger 3 --> Membrane model (kick/bass drum body)
    |--- Trigger 4 --> Modal resonator (metallic / bell)
    |--- Trigger 5 --> Waveguide @ sub-bass (30Hz)
    |--- Trigger 6 --> Short waveguide (click/transient)
    |
    v
PHYSICAL MODEL RESONATORS (gen~)       <--- SAME resonators from Project 1
Tuned to equiheptatonic/equipentatonic scales
NOT 12-TET. African tonal logic built into the instrument.
    |
    v
FluCoMa RHYTHM ANALYSIS
fluid.onsetslice~: tracks emergent rhythm
fluid.ampslice~: tracks dynamic contour
Periodicity detection: when does groove LOCK?
    |
    v
FEEDBACK to Kuramoto coupling + natural frequencies
When groove locks: slight perturbation (keep it alive)
When groove dissolves: slight increase in K (pull it back)
The system seeks the edge of synchronization.
    |
    v
AUDIO OUTPUT + OSC --> TOUCHDESIGNER
    - Phase positions of all oscillators (circular viz)
    - Coupling strength (line thickness between nodes)
    - Sync/desync state (color: warm=locked, cool=free)
    - Trigger pulses (flash on hit)
```

### Kuramoto Model in gen~ (Pseudocode)

```c
// 6 coupled oscillators for polyrhythmic engine
// Natural frequencies based on African timeline relationships

Param K(0.5);              // Coupling strength (YOUR MAIN CONTROL)
                           // 0 = free polymetric texture
                           // 0.3-0.7 = sweet spot: partial sync = groove
                           // 1+ = locked unison

Param tempo(120);          // Base tempo in BPM
Param base_freq(2.0);     // Base rate = tempo/60 (Hz)

// Natural frequencies as RATIOS of the base
// These encode African timeline relationships, NOT Western subdivisions
// Example: 12-pulse timeline (2-2-1-2-2-2-1)
Param ratio1(1.0);         // Timeline / bell pattern rate
Param ratio2(1.5);         // 3:2 cross-rhythm (hemiola)
Param ratio3(1.333);       // 4:3 relationship
Param ratio4(0.75);        // Half-time feel
Param ratio5(2.0);         // Double-time / hi-hat rate
Param ratio6(0.667);       // Slow accent cycle (3:2 against base)

// Phase state (0 to 2pi)
History t1(0); History t2(1); History t3(2);
History t4(3); History t5(4); History t6(5);

twopi = 6.28318530718;
N = 6;

// Natural frequencies
w1 = base_freq * ratio1 * twopi;
w2 = base_freq * ratio2 * twopi;
w3 = base_freq * ratio3 * twopi;
w4 = base_freq * ratio4 * twopi;
w5 = base_freq * ratio5 * twopi;
w6 = base_freq * ratio6 * twopi;

// Kuramoto coupling: dθi/dt = ωi + (K/N) * Σ sin(θj - θi)
// Each oscillator is pulled toward every other oscillator

sum1 = sin(t2-t1)+sin(t3-t1)+sin(t4-t1)+sin(t5-t1)+sin(t6-t1);
sum2 = sin(t1-t2)+sin(t3-t2)+sin(t4-t2)+sin(t5-t2)+sin(t6-t2);
sum3 = sin(t1-t3)+sin(t2-t3)+sin(t4-t3)+sin(t5-t3)+sin(t6-t3);
sum4 = sin(t1-t4)+sin(t2-t4)+sin(t3-t4)+sin(t5-t4)+sin(t6-t4);
sum5 = sin(t1-t5)+sin(t2-t5)+sin(t3-t5)+sin(t4-t5)+sin(t6-t5);
sum6 = sin(t1-t6)+sin(t2-t6)+sin(t3-t6)+sin(t4-t6)+sin(t5-t6);

d1 = w1 + (K/N) * sum1;
d2 = w2 + (K/N) * sum2;
d3 = w3 + (K/N) * sum3;
d4 = w4 + (K/N) * sum4;
d5 = w5 + (K/N) * sum5;
d6 = w6 + (K/N) * sum6;

// Integrate
dt = 1.0 / samplerate;
t1 += d1 * dt; t2 += d2 * dt; t3 += d3 * dt;
t4 += d4 * dt; t5 += d5 * dt; t6 += d6 * dt;

// Wrap to 0-2pi
t1 = t1 % twopi; t2 = t2 % twopi; t3 = t3 % twopi;
t4 = t4 % twopi; t5 = t5 % twopi; t6 = t6 % twopi;

// Generate trigger pulses (sharp impulse when phase crosses zero)
// These trigger the physical model resonators
trig1 = (t1 < d1*dt) ? 1 : 0;
trig2 = (t2 < d2*dt) ? 1 : 0;
trig3 = (t3 < d3*dt) ? 1 : 0;
trig4 = (t4 < d4*dt) ? 1 : 0;
trig5 = (t5 < d5*dt) ? 1 : 0;
trig6 = (t6 < d6*dt) ? 1 : 0;

// Output triggers to 6 outlets
out1 = trig1; out2 = trig2; out3 = trig3;
out4 = trig4; out5 = trig5; out6 = trig6;
```

### Tuning Systems in gen~ (Resonator Frequencies)

> **Full implementation with all six tuning systems: see [Tuning-Systems.md](./Tuning-Systems.md)**

```c
// PRIMARY: YORUBA ANHEMITONIC PENTATONIC
// Built from fourths and fifths, NOT equal division
// This is the HOME tuning for all four instruments

Param root(110);
Param flex(0.5);  // 0 = Pythagorean, 1 = just intonation, 0.5 = between

degree0 = root * 1.0;                                               // Root: 0 cents
degree1 = root * (1.125 * (1-flex) + (10.0/9.0) * flex);           // ~200 cents
degree2 = root * (1.265625 * (1-flex) + (5.0/4.0) * flex);         // ~386-408 cents
degree3 = root * 1.5;                                               // 702 cents (the fifth — stable)
degree4 = root * (1.6875 * (1-flex) + (5.0/3.0) * flex);           // ~884-906 cents

// Steps: ~200, ~200, ~300, ~200, ~300 cents
// Has TONAL GRAVITY — degree 0 and 3 (root and fifth) feel like home
// Flexible intonation (flex parameter) = authentic to Yoruba practice
// Every note consonant with every other (no semitones)

// SECONDARY: EQUIHEPTATONIC (Central/Southern African, for alternate mode)
// freq = root * 2^(n/7) — 7 equal divisions, ~171 cents each
// Use when you want maximum departure from Western AND from Yoruba
// This is Kubik's system: Chopi timbila, Aka vocal music, Angolan traditions

// DUNDUN 3-TONE (for P3 Kuramoto pitch contour)
// Low=root, Mid=root*1.122, High=root*1.26
// Only 3 pitches. The GLIDES between them are the melody.
// The rhythm engine speaks Yoruba.
```

### Performance Controls

```
K (coupling strength)    = MAIN CONTROL
  0.0                    = free polymetric texture (all voices independent)
  0.3 - 0.7             = THE SWEET SPOT: partial sync, groove emerges and dissolves
  1.0+                   = locked unison (useful for dramatic moments)

tempo                    = base rate (BPM)
ratio1-6                 = individual oscillator frequency ratios
                           (morph between different polyrhythmic relationships)

tuning_mode              = 7 (equiheptatonic) or 5 (equipentatonic)
root                     = root frequency

resonator_damping        = how long each hit rings
resonator_brightness     = material character (dark wood → bright metal)
```

The ONE-KNOB PERFORMANCE: Just K. Turn coupling up slowly. Individual rhythms gradually lock into a groove. The audience feels the groove EMERGE from chaos. Turn K back down. The groove dissolves. This is visceral, musical, and instantly understood by any audience.

### Why This Is Different From Existing Rhythmic Tools

| Tool | Problem | Coupled Rhythm Engine |
|------|---------|----------------------|
| Euclidean sequencers | Fixed patterns. Select and go. No EMERGENCE. | Groove emerges from physics. Not selected, not programmed. |
| Polymetric sequencers | Multiple fixed meters overlaid. Predictable. | Oscillators INTERACT. The polyrhythm evolves. |
| Algorithmic composition (SuperCollider, TidalCycles) | Code-based. Not performable in the visceral sense. | One knob (K) = immediate physical control of groove density. |
| Drum machines | Western grid. Even "swing" is just offset from grid. | No grid. The timeline IS the grid, but it's not quantized to Western divisions. |
| AI rhythm generation | Black box. No understanding of what it's doing. | Transparent physics. Kuramoto model is well-understood mathematics. |

### TouchDesigner Visualization for Project 3

```
RHYTHM VISUALIZATION (specific to P3):

1. CIRCULAR OSCILLATOR VIEW
   - 6 dots on a circle, each representing one oscillator
   - Dot position = phase (angle on circle)
   - When oscillators SYNC: dots cluster together
   - When FREE: dots spread evenly
   - Lines between dots: thickness = coupling strength
   - Color: warm (locked) <--> cool (free)

2. TRIGGER FLASH VIEW
   - 6 concentric rings
   - Each ring flashes on trigger (the rhythm is VISIBLE)
   - Locked groove = regular, satisfying flash patterns
   - Free texture = scattered, irregular flashes

3. SYNC ORDER PARAMETER
   - Kuramoto order parameter r = (1/N)|Σ e^(iθj)|
   - r = 0: completely desynchronized
   - r = 1: perfect synchronization
   - Display as a single value/bar that rises and falls
   - This IS the groove meter. The audience sees groove forming.
```

### The Pain Points It Solves

**For festivals:**
- The gap between "laptop musician playing beats" (boring to watch) and "experimental musician playing texture" (no groove). This bridges it. Groove from physics. Conceptually rigorous AND danceable.
- Commissionable with different timeline patterns per culture/context.

**For labels:**
- **Hyperdub**: FULLY ANSWERED. Polyrhythmic bass music from African mathematical principles. Kode9's entire thesis since *Memories of the Future*.
- **Warp**: NOW they're interested. Rhythmic experimental = Autechre, Aphex, Clark territory. But this sounds like nothing in their catalog.
- **Planet Mu**: Jlin, Ital Tek. Footwork-adjacent but from a completely different generative principle.
- **Honest Jon's**: Sun Ra, Daphne Oram, African archival releases. The Africa ↔ synthesis bridge.
- **Nyege Nyege Tapes**: East African electronic label. The African tonal systems + synthesis = their exact lane.

**For grants:**
- "Decolonizing music technology" — the single most fundable thesis in European arts councils right now.
- "Building synthesizers that operate in African tonal systems for the first time" — genuine innovation claim.
- Academic credibility: Agawu, Kubik, Arom, Nketia provide the theoretical foundation.

**For clubs/DJ culture:**
- The output is RHYTHMIC. DJs can play alongside it or mix it.
- It grooves, but unpredictably. Each performance generates new rhythmic material.
- The sub bass from waveguide resonators = sound system ready.

### New ICPs Unlocked by Project 3

| Name | Score | Why |
|------|-------|-----|
| **Nyege Nyege Festival (Uganda)** | **10** | East African electronic music festival. African tonal systems + synthesis = exactly their programming. Polyrhythmic, danceable, conceptually grounded in African musicology. |
| **Boiler Room** | **9** | Visual format perfect — the TD oscillator visualization IS the Boiler Room camera angle. Rhythmic enough for their audience. African electronic music = strong editorial angle. |
| **NTS Radio** | **9** | Monthly show format. Each episode = different coupling / timeline pattern configuration. Perfect for building audience. |
| **Nyege Nyege Tapes (label)** | **10** | East African electronic label. The African rhythm + synthesis bridge. Album or EP. |
| **Planet Mu** | **9** | Jlin connection. Footwork's polyrhythmic complexity from a completely different angle. |
| **Honest Jon's** | **8** | Damon Albarn's label. African archive + synthesis = their history. |
| **Norient (academic/media)** | **9** | Music + globalization network. The post-colonial musicology angle = perfect for their platform. Published essays + performances. |
| **SOAS University London** | **9** | Now scores higher — not just the archive (P2) but the musicological thesis (P3). Research collaboration. Possible visiting fellowship. |
| **Makerere University Kampala** | **8** | Ethnomusicology department. Collaborative research on Ugandan musical scales + synthesis. Funded via Goethe/British Council. |

### The Three-Project Narrative (Updated)

| | Project 1 | Project 2 | Project 3 |
|---|---|---|---|
| **Explores** | The SELF | The WORLD | The COLLECTIVE |
| **Source** | Self-generated (chaos + feedback) | External archive | Synchronization physics |
| **Musical character** | Textural, sub-bass, evolving | Timbral, resonant, site-specific | RHYTHMIC, polymetric, groovy |
| **African musicology** | Equiheptatonic resonator tuning | Archive's own tonal logic preserved | Timeline patterns, interlocking, Kuramoto-as-ensemble |
| **Conceptual depth** | Cybernetics (Wiener, Tudor) | Cultural memory (archive as instrument) | Synchronization (Kuramoto, Strogatz) + post-colonial musicology (Agawu, Kubik) |
| **Album concept** | Map of a living system | Activated archive | Rhythmic emergence — groove as phase transition |
| **Label fit** | PAN, Subtext | PAN, Warp | Hyperdub, Planet Mu, Nyege Nyege Tapes, Warp |
| **Festival fit** | CTM, Unsound, Atonal, Rewire | CTM, Transmediale, Rewire, Serpentine | Atonal, Unsound, Nyege Nyege, MUTEK, Boiler Room |
| **Visual** | Strange attractor (3D) | Corpus map navigation | Circular oscillator sync/desync |
| **Commission angle** | "New instrument" | "Site/culturally-specific" | "Decolonizing rhythm technology" |
| **Pain point solved** | Laptop performance = boring | No site-specific music commissions | Gap between experimental + danceable |

---

## Project 4: Swarm Polyphony Engine

> P3 answers WHEN (rhythm from synchronization). P4 answers WHAT (melody, harmony, polyphony from collective behavior). Together they are a complete music system. Combined in performance: Kuramoto drives the pulse, the swarm drives the notes.

### Concept

Hundreds of autonomous agents moving through a pitch-space tuned to equiheptatonic or equipentatonic scales. Each agent IS a musical voice. They follow three simple rules — the same rules that govern flocking birds, schooling fish, and swarming insects:

1. **Separation**: Don't crowd your neighbors (maintain melodic interval spacing)
2. **Alignment**: Match your neighbors' direction (follow local melodic contour)
3. **Cohesion**: Steer toward the center of your local group (converge on shared pitches)

These three rules produce four musical behaviors:

| Swarm State | Musical Result | Character |
|-------------|---------------|-----------|
| **Clustering** (high cohesion, low separation) | Dense chord clusters in equiheptatonic tuning. All agents on nearby pitches. | Thick, buzzing, organ-like. African balafon ensemble in unison. |
| **Flocking** (balanced cohesion + alignment) | Parallel melodic motion. Agents move together through the scale. | Sweeping, oceanic. Like a choir following a shared contour. |
| **Scattering** (high separation, low cohesion) | Sparse call-and-response. Individual voices in open space. | Pointillistic. Like scattered kora notes. |
| **Swarming** (all three balanced) | Complex interlocking polyphony. The emergent behavior. | THIS is the sweet spot. Multiple independent but related melodic lines. Aka polyphony from simple rules. |

### The African Musicology Connection

This is not metaphorical. This is how African ensemble polyphony ACTUALLY works:

**Simha Arom's discovery**: Central African Aka vocal polyphony — some of the most complex polyphonic music on earth — is not composed as "harmony." Each singer follows a simple melodic pattern relative to their neighbors. The complex polyphony EMERGES from the interaction of simple individual parts. No one singer performs the complete harmony. No one is the "lead." The whole arises from the parts.

This is EXACTLY the boids/swarm algorithm. Reynolds (1987) discovered the same organizational principle in animal behavior that Arom (1991) documented in Aka music: complex collective patterns from simple individual rules.

**Olly Wilson's "Heterogeneous Sound Ideal"**: In African ensembles, each voice maintains its own timbral identity. The ideal is NOT blend (Western choir) but contrast-in-unity. In the swarm engine: each agent triggers a DIFFERENT physical model resonator. The timbral variety IS the design.

**Call-and-response as emergence**: Call-and-response in African music is often described as a "structure" — but it's better understood as an EMERGENT BEHAVIOR of ensemble dynamics. When agents scatter and regroup, call-and-response patterns arise naturally without being programmed.

### Architecture

```
SWARM ENGINE (gen~ or JavaScript in Max)
200-500 agents in 2D pitch-time space
    |
    |--- Agent position:
    |    X axis = TIME (rhythmic position within cycle)
    |    Y axis = PITCH (equiheptatonic scale degrees 0-6, across octaves)
    |
    |--- Agent rules:
    |    Separation: min interval = 1 equiheptatonic step
    |    Alignment: match neighbor's melodic direction (up/down/static)
    |    Cohesion: steer toward local pitch center
    |
    |--- Parameters (YOUR CONTROLS):
    |    Separation weight  (0-1) = melodic spacing
    |    Alignment weight   (0-1) = parallel motion vs. independence
    |    Cohesion weight    (0-1) = cluster vs. scatter
    |    Max speed          = melodic velocity (how fast pitch changes)
    |    Neighborhood size  = how many agents each agent "listens to"
    |                        (small = local call-and-response)
    |                        (large = global unison/cluster)
    |
    v (agents crossing grid positions generate NOTE EVENTS)
    |
NOTE EVENT ROUTING
    |
    |--- Agent crosses pitch gridline → trigger resonator at that pitch
    |--- Agent velocity at crossing → trigger strength (dynamics)
    |--- Agent's unique ID → which resonator timbre (heterogeneous sound ideal)
    |
    v
PHYSICAL MODEL RESONATORS (gen~)          <--- SAME resonators from P1
Tuned to equiheptatonic/equipentatonic degrees
Each agent has its own resonator "body" (different damping, brightness)
= Olly Wilson's heterogeneous sound ideal as synthesis design
    |
    v
FluCoMa ANALYSIS
fluid.pitch~ (collective pitch center tracking)
fluid.loudness~ (density tracking)
fluid.mfcc~ (collective timbre tracking)
    |
    v
FEEDBACK (optional):
Analysis → swarm parameter modulation
When density too high → increase separation
When too sparse → increase cohesion
Self-regulating ensemble behavior
    |
    v
AUDIO OUTPUT + OSC --> TOUCHDESIGNER
    - All agent positions (X,Y for each agent)
    - Trigger events (flash on note)
    - Swarm density / spread metrics
    - Connection to P3 Kuramoto phase data
```

### Combining P3 + P4 (The Complete System)

```
P3: KURAMOTO COUPLED OSCILLATORS
= WHEN events happen (macro rhythm, pulse, groove)
= The master drummer / timeline
    |
    v (trigger pulses from P3 seed P4's rhythmic grid)
    |
P4: SWARM POLYPHONY
= WHAT pitches, WHICH voices, HOW LOUD
= The ensemble responding to the timeline
    |
    v
PHYSICAL MODEL RESONATORS (shared with P1)
= The sound. Each agent has its own body.
= Equiheptatonic tuning throughout.
    |
    v
OUTPUT
= Complete music: rhythm (P3) + polyphony (P4) + timbre (P1)
= Through African tonal systems
= From physics and collective behavior
```

**P3 alone** = rhythmic percussion engine (Atonal set, Hyperdub bass weight)
**P4 alone** = melodic/polyphonic engine (pitched, choral, sweeping)
**P3 + P4** = complete African-futurist ensemble from first principles

### Swarm Engine in gen~ (Pseudocode)

```c
// Simplified 2D swarm with 6 representative agents
// (Full implementation: 200+ agents in JavaScript, send positions to gen~ via buffer~)

// Agent positions: x = rhythmic position (0-1 cycle), y = pitch (scale degrees)
Param sep_weight(0.5);    // Separation force
Param ali_weight(0.3);    // Alignment force
Param coh_weight(0.5);    // Cohesion force
Param max_speed(0.01);    // Max velocity per sample
Param tuning_mode(7);     // 7 = equiheptatonic, 5 = equipentatonic

History x1(0.0); History y1(0.0); History vx1(0.001); History vy1(0.001);
History x2(0.2); History y2(2.0); History vx2(0.001); History vy2(-0.001);
History x3(0.4); History y3(4.0); History vx3(-0.001); History vy3(0.001);
History x4(0.6); History y4(1.0); History vx4(0.001); History vy4(0.001);
History x5(0.8); History y5(3.0); History vx5(-0.001); History vy5(-0.001);
History x6(0.1); History y6(5.0); History vx6(0.001); History vy6(-0.001);

// For each agent: compute separation, alignment, cohesion forces
// (showing for agent 1, repeat for all)

// SEPARATION: steer away from nearby agents
sep_x1 = 0; sep_y1 = 0;
dx = x1-x2; dy = y1-y2; dist = sqrt(dx*dx+dy*dy);
if (dist < 0.3) { sep_x1 += dx/dist; sep_y1 += dy/dist; }
// ... repeat for all neighbors

// ALIGNMENT: match neighbor velocity
ali_x1 = (vx2+vx3+vx4+vx5+vx6) / 5;
ali_y1 = (vy2+vy3+vy4+vy5+vy6) / 5;

// COHESION: steer toward group center
cx = (x2+x3+x4+x5+x6) / 5;
cy = (y2+y3+y4+y5+y6) / 5;
coh_x1 = (cx - x1) * 0.01;
coh_y1 = (cy - y1) * 0.01;

// Combined force
fx1 = sep_x1*sep_weight + ali_x1*ali_weight + coh_x1*coh_weight;
fy1 = sep_y1*sep_weight + ali_y1*ali_weight + coh_y1*coh_weight;

// Update velocity (with speed limit)
vx1 += fx1 * 0.001;
vy1 += fy1 * 0.001;
speed1 = sqrt(vx1*vx1 + vy1*vy1);
if (speed1 > max_speed) { vx1 *= max_speed/speed1; vy1 *= max_speed/speed1; }

// Update position
x1 += vx1; y1 += vy1;

// Wrap x (rhythmic cycle: 0-1)
x1 = x1 % 1.0;
// Constrain y (pitch: 0 to tuning_mode*3 = 3 octaves)
y1 = clamp(y1, 0, tuning_mode * 3);

// Generate trigger when agent crosses a pitch gridline
// (quantize to nearest equiheptatonic degree)
degree1 = round(y1);
History prev_degree1(0);
trig1 = (degree1 != prev_degree1) ? 1 : 0;
prev_degree1 = degree1;

// Convert degree to frequency (equiheptatonic)
root = 110;  // A2
octave1 = floor(degree1 / tuning_mode);
step1 = degree1 % tuning_mode;
freq1 = root * pow(2, octave1) * pow(2, step1 / tuning_mode);

// Outputs: trigger, frequency, velocity (for resonator excitation)
out1 = trig1;
out2 = freq1;
out3 = speed1 / max_speed; // velocity = how fast agent was moving at trigger
```

### Performance Controls

```
MAIN CONTROLS (3 knobs — the swarm behavior):

Cohesion       = musical DENSITY
  Low          = scattered, sparse, call-and-response
  High         = dense clusters, thick chords, organ-like

Separation     = melodic SPACING
  Low          = tight intervals, close harmony, beating/roughness
  High         = wide intervals, open voicings, clarity

Alignment      = melodic DIRECTION
  Low          = chaotic, each voice independent, pointillistic
  High         = parallel motion, voices move together, sweeping

SECONDARY CONTROLS:

Neighborhood   = ensemble SIZE
  Small (5)    = local call-and-response, intimate chamber music
  Large (50+)  = global coordination, orchestral unison

Max speed      = melodic VELOCITY
  Slow         = sustained tones, drones, slow melody
  Fast         = rapid arpeggiation, fluttering, insect-like

Tuning mode    = 7 (equiheptatonic) / 5 (equipentatonic)
Root pitch     = starting frequency
Octave range   = how many octaves the pitch space spans
```

### TouchDesigner Visualization for Project 4

```
SWARM VISUALIZATION:

1. PARTICLE FIELD (primary view)
   - Each agent = a particle/dot
   - X position = rhythmic position in cycle
   - Y position = pitch (mapped to vertical)
   - Color = which resonator timbre it triggers
   - Size = velocity (fast-moving = larger)
   - Trail = melodic contour history
   - FLASH on note trigger

2. DENSITY MAP (secondary view)
   - Heatmap of agent density in pitch-time space
   - Hot zones = dense polyphony
   - Cold zones = silence/space
   - Pulsing in time with P3's Kuramoto rhythm

3. COMBINED P3 + P4 VIEW
   - P3's circular oscillator ring (rhythm) at the center
   - P4's swarm particles orbiting around it
   - Kuramoto triggers ripple outward
   - Swarm agents respond to the ripples
   - The complete system visualized as one organism
```

### Why This Is a 10

**The one-line pitch**: "An ensemble of 200 autonomous voices following three simple rules in equiheptatonic tuning — call-and-response, harmony, and polyphony emerge from collective behavior, not composition."

**What it sounds like:**
- At rest (balanced parameters): shimmering equiheptatonic polyphony, like 200 kalimbas playing together, each following its neighbors. Complex but coherent. Beautiful.
- Cohesion cranked: thick, beating, organ-like chord clusters in non-Western tuning. Massive.
- Separation cranked: sparse call-and-response. Single notes answer each other across silence. Intimate.
- Alignment cranked: all voices sweep together in parallel motion through the equiheptatonic scale. Oceanic.
- With P3 underneath: all of the above locked to a polyrhythmic pulse. The complete instrument.

**The conceptual hit**: "Simha Arom documented that Central African Aka polyphony — some of the most complex music on earth — arises from simple individual rules, not complex composition. Craig Reynolds discovered the same principle in animal flocking. This instrument implements both findings: 200 voices following three rules in African tuning systems, producing emergent polyphony that no one composed."

### New ICPs Specific to P4

| Name | Score | Why |
|------|-------|-----|
| **Ensemble Modern / ICE / Alarm Will Sound** | **9** | Contemporary music ensembles. P4 is "100 virtual instruments following ensemble dynamics." Commission a piece where live musicians interact with the swarm. |
| **Unsound** | **10** | P3+P4 combined = their ideal program. Rhythm + polyphony from first principles + African musicology. Main evening concert. |
| **Donau Festival (Krems, Austria)** | **9** | Experimental + accessible. P4 alone is beautiful enough for their audience. Swarm polyphony is immediately engaging. |
| **MaerzMusik (Berlin)** | **10** | Berliner Festspiele's festival for time-based art. The swarm behavior IS time-based art. Fits their discourse + concert program. |
| **Haus der Kulturen der Welt (HKW Berlin)** | **10** | Post-colonial art + technology. The African musicology thesis + swarm as decolonial instrument design. Commission + exhibition. |
| **Barbican (London)** | **9** | Their contemporary music programming loves this intersection. Life Rewired season equivalent. |
| **Kaaitheater (Brussels)** | **8** | Performing arts + technology. P4 as a "choreography of sound agents." |

### The Four-Project Narrative (Updated)

| | Project 1 | Project 2 | Project 3 | Project 4 |
|---|---|---|---|---|
| **Explores** | The SELF | The WORLD | The COLLECTIVE (rhythm) | The ENSEMBLE (polyphony) |
| **Source** | Self-generated | External archive | Synchronization physics | Swarm behavior |
| **Musical character** | Textural, sub-bass, drone | Timbral, resonant, site-specific | RHYTHMIC, polymetric, groovy | MELODIC, polyphonic, choral |
| **African musicology** | Equiheptatonic resonator tuning | Archive's own tonal logic | Timeline patterns, interlocking | Arom's emergent polyphony, Wilson's heterogeneous sound ideal |
| **Physics/math model** | Lorenz/Rossler chaos | N/A (FluCoMa analysis) | Kuramoto coupled oscillators | Reynolds boids / swarm dynamics |
| **Main control** | Feedback gain + routing | Corpus selection | K (coupling strength) | Cohesion / Separation / Alignment |
| **Album concept** | Map of a living system | Activated archive | Groove as phase transition | Polyphony from collective behavior |
| **Label fit** | PAN, Subtext | PAN, Warp | Hyperdub, Planet Mu, Nyege Nyege | Warp, PAN, Erased Tapes, 4AD |
| **Festival fit** | CTM, Unsound, Atonal, Rewire | CTM, Transmediale, Rewire | Atonal, Unsound, Nyege Nyege, MUTEK, Boiler Room | Unsound, MaerzMusik, HKW, Barbican, Donau |
| **Visual** | Strange attractor (3D) | Corpus map | Circular oscillator sync | Swarm particle field |
| **Pain point solved** | Laptop = boring | No site-specific music commissions | Gap between experimental + danceable | No ensemble polyphony from synthesis (always monophonic or manually sequenced) |

### P3 + P4 Combined: The Performance Set

```
THE LIVE SET (60 minutes):

OPENING (10 min):
P4 alone. Swarm scattered. Sparse call-and-response in equiheptatonic tuning.
Single notes answering each other. Intimate. Beautiful. Audience leans in.

BUILDING (10 min):
Slowly increase P4 cohesion. Voices cluster. Chords form.
Meanwhile: P3 Kuramoto at very low K. Sub-rhythmic pulses begin. Pre-groove.

EMERGENCE (15 min):
P3 coupling K rises past critical threshold. GROOVE LOCKS.
P4 swarm responds to P3 triggers. The ensemble rides the rhythm.
Sub bass from waveguide resonators. The room shakes.
This is the Atonal / Hyperdub moment.

PEAK (10 min):
Full system. P3 tight coupling + P4 high alignment.
200 voices sweeping in parallel through equiheptatonic scales
over locked polyrhythmic groove. Massive. Oceanic. Devastating.

DISSOLVE (10 min):
Reduce P3 coupling. Groove loosens.
P4 separation increases. Voices scatter.
Call-and-response returns. Individual voices emerge from the mass.

CLOSE (5 min):
P3 fully decoupled. P4 minimal agents.
Single resonator rings. Silence between notes.
The swarm disperses. The groove becomes memory.
```

---

## ICP Analysis & Scores

### Tier 1: Dream Festival ICPs

| # | Name | P1 | P2 | P3 | P4 | Notes |
|---|------|:-:|:-:|:-:|:-:|-------|
| 1 | **CTM Festival Berlin** | **10** | **10** | **10** | **10** | All four. P4 adds the "emergent polyphony from Arom's research" angle = CTM discourse + concert. |
| 2 | **Unsound Krakow** | **10** | **10** | **10** | **10** | P3+P4 combined = the 60-min set described above. Unsound's ideal: conceptually deep AND viscerally powerful. |
| 3 | **Rewire The Hague** | **10** | **10** | **9** | **10** | P4 as installation: visitors influence swarm parameters. The polyphony responds to presence. Prince Claus Fund is in The Hague — commission + grant alignment. |
| 4 | **Atonal Berlin** | **10** | **9** | **10** | **9** | P4 adds harmonic weight to P3's rhythm. Combined P3+P4 Atonal set = rhythm + polyphony in Kraftwerk. |
| 5 | **MUTEK Montreal** | **9** | **9** | **10** | **10** | P4: The swarm visualization is the most visually stunning of all four. MUTEK's A/Visions = perfect. |
| 6 | **Sonar Barcelona** | **7** | **8** | **9** | **9** | P3+P4 night set. Danceable + alien + beautiful. |
| 7 | **Transmediale Berlin** | **7** | **9** | **8** | **9** | P4: Emergent behavior as art. Fits their "systems + society" discourse. |
| 8 | **Nyege Nyege (Uganda)** | **7** | **8** | **10** | **10** | P3+P4: Complete African-futurist ensemble from physics. The homecoming. |
| 9 | **MaerzMusik (Berlin)** | **8** | **8** | **9** | **10** | P4: Berliner Festspiele's time-based art festival. Swarm behavior IS time-based art. |
| 10 | **HKW Berlin** | **7** | **9** | **9** | **10** | P4: Post-colonial art + technology. Arom/Agawu thesis + swarm = their exact programming. Commission + exhibition. |

### Tier 2: Labels

| # | Name | P1 | P2 | P3 | P4 | Notes |
|---|------|:-:|:-:|:-:|:-:|-------|
| 11 | **PAN Records** | **10** | **10** | **8** | **10** | P4: Rashad Becker's "notional species" = impossible ensemble. P4's swarm polyphony = the same concept but generative. Bill Kouligas would understand immediately. |
| 12 | **Warp Records** | **8** | **8** | **10** | **10** | P3+P4 album: rhythmic complexity (Autechre-adjacent) + melodic depth (Aphex-adjacent) from African-futurist principles. This IS a Warp album. |
| 13 | **Hyperdub** | **9** | **9** | **10** | **9** | P3 remains the Hyperdub core. P4 adds harmonic depth. Combined P3+P4 for Kode9 = complete. |
| 14 | **Subtext Recordings** | **10** | **9** | **7** | **7** | P1 is their core. P3+P4 too rhythmic/melodic for their catalog. |
| 15 | **Editions Mego** | **8** | **7** | **6** | **7** | P4's dense cluster states have a Phill Niblock quality. Possible but not core fit. |
| 16 | **Planet Mu** | **6** | **6** | **10** | **9** | P3+P4: Polyrhythmic complexity + melodic emergence. Beyond footwork into new territory. |
| 17 | **Nyege Nyege Tapes** | **5** | **7** | **10** | **10** | P3+P4: Complete African-futurist electronic ensemble. Album. |
| 18 | **Honest Jon's** | **5** | **8** | **9** | **9** | P3+P4: African rhythm/melody recontextualized through physics. Their whole catalog thesis. |
| 19 | **Erased Tapes** | **6** | **7** | **6** | **10** | P4 alone: The beautiful swarm polyphony states. Nils Frahm, Olafur Arnalds territory but from emergence, not composition. Equiheptatonic shimmer. |
| 20 | **4AD** | **5** | **5** | **7** | **9** | P4: The oceanic parallel-motion states. Cocteau Twins' harmonic clouds from swarm physics. Long shot but the sound fits. |

### Tier 3: Institutions & Residencies

| # | Name | P1 | P2 | P3 | P4 | Status & Notes |
|---|------|:-:|:-:|:-:|:-:|----------------|
| 21 | **EMS Stockholm** | **10** | **10** | **10** | **10** | **ACTIVE.** Apply January 2027 (Jan 1-31). Unfunded but free studios + invitation letter. All four projects. [elektronmusikstudion.se](https://elektronmusikstudion.se/en/our-studios/ems-artist-in-residence-program/) |
| 22 | **EMPAC Troy, NY** | **8** | **9** | **9** | **10** | P4: 200 swarm voices spatialized across 7.1 surround = each agent has a POSITION in the room. The swarm MOVES through the space. Curated commissions only. [empac.rpi.edu](https://empac.rpi.edu/program/residencies) |
| 23 | **Serpentine Arts Technologies** | **9** | **10** | **9** | **10** | P4: Emergent behavior as art = their "Future Art Ecosystems" thesis. Collective intelligence. Post-human ensemble. [serpentinegalleries.org](https://www.serpentinegalleries.org/arts-technologies/) |
| 24 | **ZKM Karlsruhe** | **9** | **9** | **9** | **10** | Hertz Lab. P4: Swarm intelligence + African musicology = strong art+science proposal. |
| 25 | **Somerset House Studios** | **8** | **9** | **10** | **10** | P3+P4: African diaspora + rhythm + polyphony + technology. Their exact programming. |
| 26 | **NEW INC (New Museum, NYC)** | **8** | **9** | **9** | **9** | Full 4-project practice = their artist-as-entrepreneur thesis amplified. |
| 27 | **SOAS University London** | **4** | **9** | **10** | **10** | P3+P4: The musicology thesis is now complete — rhythm (Kuramoto) AND polyphony (swarm) mapped to Arom + Agawu's research. Visiting fellowship material. |
| 28 | **Makerere University Kampala** | **3** | **7** | **9** | **9** | Ethnomusicology. Collaborative research. Fund via Goethe/British Council. |
| 29 | **IRCAM Paris** | **6** | **7** | **8** | **10** | P4: Swarm-based composition is publishable IRCAM research. Cursus program or artist residency. FluCoMa connection (James Bradbury, Owen Green). |

### Tier 4: Companies

| # | Name | P1 | P2 | P3 | P4 | Notes |
|---|------|:-:|:-:|:-:|:-:|-------|
| 30 | **Ableton** | **9** | **8** | **10** | **10** | P4: Swarm MIDI generator as Max4Live device. 200 agents generating notes. Every producer wants this. Loop talk + product showcase. |
| 31 | **Cycling '74** | **10** | **9** | **10** | **10** | P4: gen~ swarm + FluCoMa integration = featured artist series across multiple articles. Paid content. |
| 32 | **Teenage Engineering** | **5** | **5** | **7** | **7** | P3+P4 as a hardware interface. Still a stretch. |
| 33 | **Native Instruments** | **6** | **6** | **7** | **8** | P4 as Reaktor / Kontakt instrument. Swarm-generated melodies in microtuning = closer to their product lane. |
| 34 | **Google Magenta** | **7** | **6** | **7** | **8** | P4: Swarm + emergence + music = multiple publishable papers. |

### Tier 5: Grants & Funders

| # | Name | P1 | P2 | P3 | P4 | Notes |
|---|------|:-:|:-:|:-:|:-:|-------|
| 35 | **Africa No Filter** | **8** | **10** | **10** | **10** | P3+P4: "The first synthesizer that embodies African musical principles — tuning, rhythm, AND polyphony." [africanofilter.org](https://africanofilter.org/our-grants) |
| 36 | **Goethe-Institut** | **9** | **10** | **10** | **10** | Full practice: decolonial music tech. Africa↔Germany. Fund EMS + CTM + Nyege Nyege. |
| 37 | **British Council** | **7** | **9** | **9** | **9** | Heritage + innovation. Somerset House + Rewire. |
| 38 | **Pro Helvetia** | **7** | **8** | **8** | **8** | Swiss arts council. Festival connection needed. |
| 39 | **UNESCO** | **5** | **9** | **10** | **10** | P3+P4: Intangible cultural heritage — African rhythm + polyphony principles preserved in technology. |
| 40 | **Ford Foundation** | **5** | **8** | **10** | **10** | "Decolonizing creative technology." Creativity & Free Expression program. $50k-$200k. |
| 41 | **Prince Claus Fund** | **5** | **9** | **10** | **10** | Cultural innovation. The Hague = Rewire connection. |
| 42 | **Leverhulme Trust** | **4** | **7** | **9** | **10** | UK research grants. P4: "Emergent polyphony in African musical systems: a computational model." Academic credibility + £50k-£200k. Requires UK institutional partner (SOAS). |
| 43 | **ERC (European Research Council)** | **3** | **6** | **8** | **9** | Starting Grant (up to €1.5M over 5 years). Need affiliation with EU institution. Long shot but P3+P4 thesis is publishable research. Would need to partner with a university. |

### Tier 6: Non-Obvious ICPs

| # | Name | P1 | P2 | P3 | P4 | Notes |
|---|------|:-:|:-:|:-:|:-:|-------|
| 44 | **Smithsonian Folkways** | **4** | **10** | **9** | **9** | Activate their African collection with instruments that respect source tuning + polyphonic structure. |
| 45 | **Fact Magazine** | **8** | **8** | **9** | **10** | P4: Against The Clock with 200-agent swarm visualization. The most visually stunning content piece. |
| 46 | **Wire Magazine** | **9** | **9** | **9** | **9** | All four. Cover feature material. The full practice as long-form feature. |
| 47 | **Boiler Room** | **5** | **5** | **10** | **9** | P3+P4 combined AV set. Circular oscillator ring + swarm particles. |
| 48 | **NTS Radio** | **6** | **6** | **9** | **9** | Monthly show. P3+P4: different parameter configs per episode. |
| 49 | **Norient** | **7** | **8** | **10** | **10** | Music + globalization. The full musicology thesis. Published essays. |
| 50 | **Resident Advisor** | **7** | **7** | **9** | **9** | Documentary feature on the full practice. |
| 51 | **MaerzMusik (Berlin)** | **8** | **8** | **9** | **10** | Berliner Festspiele. P4 as time-based art. Commission. |
| 52 | **HKW Berlin** | **7** | **9** | **9** | **10** | Haus der Kulturen der Welt. Post-colonial art + tech. Exhibition + commission. |
| 53 | **Barbican (London)** | **7** | **7** | **8** | **9** | Contemporary music + swarm polyphony. Life Rewired-type programming. |
| 54 | **Ensemble Modern / ICE** | **4** | **5** | **7** | **10** | P4: Commission where live musicians INTERACT with the swarm. The swarm responds to the ensemble. The ensemble responds to the swarm. Meta-ensemble. |

### SHAPE+ Update

**SHAPE+ ended December 2025.** The 3-year Creative Europe cycle is complete. However, the 18 member festivals (CTM, Unsound, Rewire, MUTEK, Atonal, Sonar, Terraforma, TodaysArt, Intonal, Schiev, etc.) still exist and will likely form a successor network under the next Creative Europe funding round. **Watch for announcements late 2026.**

In the meantime: apply to individual festivals directly. The SHAPE+ network means their curators know each other — getting programmed at one leads to introductions at others.

Source: [shapeplatform.eu](https://shapeplatform.eu/)

---

## Grants & Funding Strategy

### Immediate (Can Apply Now)

| Grant | Amount | Deadline | Fit |
|-------|--------|----------|-----|
| Africa No Filter — Project Support | $5k-$25k | Rolling | P2+P3: African sonic archive + decolonial rhythm technology |
| Goethe-Institut — Touring/Production | Flights, accommodation, production | Varies by region | Fund EMS residency + CTM premiere + Nyege Nyege |
| Prince Claus Fund | Up to EUR 25k | Check deadlines | P3: Cultural innovation in Africa. Based in The Hague (Rewire connection). |

### 2026 Application Windows

| Grant | Typical Window | Notes |
|-------|---------------|-------|
| British Council — Arts + Tech | Quarterly | Need UK connection (Somerset House, Rewire NL) |
| Pro Helvetia — Music | Biannual | Need Swiss venue partner |
| Creative Scotland — Open Fund | Rolling | If any UK/Scotland connection |
| UNESCO — Intangible Cultural Heritage | Annual | P2+P3: Heritage + technology. African tuning systems = intangible cultural heritage. |
| Ford Foundation — Creativity & Free Expression | Rolling / by invitation | P3: "Decolonizing creative technology." Larger grants ($50k-$200k). Longer process but transformative funding. |

### January 2027

| Application | Window | Notes |
|-------------|--------|-------|
| EMS Stockholm Artist-in-Residence | Jan 1-31, 2027 | Unfunded but free studios. Use Goethe/British Council for travel/living costs. Non-Swedish applicants only. |

### Commission Approaches (No Open Call — Direct Pitch)

| Institution | How to Approach | What to Send |
|-------------|----------------|--------------|
| Serpentine Arts Technologies | Email Arts Tech team with 3-min video + 1-page concept | P2+P3: Archive activation + decolonial thesis |
| EMPAC | Email curatorial team | P1: Feedback instrument demo, propose multichannel version |
| PAN Records | Email Bill Kouligas | 15-min audio piece (P1 or P2) |
| Subtext Recordings | Email | 15-min piece from feedback instrument |
| Hyperdub | Email | P3: Rhythm-focused piece. Equiheptatonic bass + Kuramoto polyrhythm. The club question ANSWERED. |
| Warp Records | Email | P3: Full album when ready. Rhythmic experimental with African tonal systems. |
| Planet Mu | Email | P3: Polyrhythmic piece. Jlin-adjacent complexity from physics. |
| Nyege Nyege Tapes | Email | P3: Album or EP. African rhythm engine for an African label. |
| Cycling '74 | Email | Max patch screenshots + audio. Propose featured artist article on gen~ Kuramoto implementation. |
| CTM Festival | Open call (Sept/Oct) AND email program team | Demo + concept for all three |
| Boiler Room | Pitch directly | P3: AV set with circular oscillator viz. Concept video. |
| NTS Radio | Pitch monthly show format | P3: Each episode = different coupling/timeline configuration |

---

## Timeline

### Phase 1: Build the Feedback Instrument (March-April 2026)

```
WEEK 1-2 (Now)
+-- Build Lorenz chaos oscillator in gen~ (1 afternoon)
+-- Build Rossler oscillator variant (1 afternoon)
+-- Build waveguide resonator in gen~ (2-3 days)
+-- Wire basic audio chain: chaos -> resonator -> output
+-- First sounds. Tune. Explore.

WEEK 3-4
+-- Add FluCoMa analysis:
|   fluid.spectralshape~, fluid.pitch~,
|   fluid.loudness~, fluid.mfcc~
+-- Build feedback mapping:
|   Analysis -> chaos parameters + resonator tuning
+-- The system becomes self-modifying
+-- Record everything. Find the sweet spots.

WEEK 5-6
+-- Add RAVE/PERI as one voice in the network
+-- Add TouchDesigner visualization:
|   OSC out from Max -> TD
|   3D attractor point trail (instanced SOPs)
|   Audio-reactive GLSL shaders
+-- Film AV performance documentation (3-5 min)
```

### Phase 2: First Output (May-June 2026)

```
MAY
+-- Record 30-45 min of strongest material
+-- Edit into:
|   +-- 15-min piece (for PAN / Subtext)
|   +-- 3-5 min AV documentation (for alabo.studio + applications)
|   +-- Rhythm-focused edit (for Hyperdub)
+-- Build alabo.studio page: "Feedback Instrument"
|   Concept, video, audio excerpts

JUNE
+-- Send 15-min piece to PAN Records
+-- Send to Subtext
+-- Send rhythm edit to Hyperdub
+-- Approach Cycling '74 for featured artist piece
+-- Apply: Africa No Filter project grant (for P2 development)
+-- Apply: Goethe-Institut touring/production fund
```

### Phase 3: Festival Applications (Sept-Oct 2026)

```
SEPTEMBER
+-- Apply: CTM 2027 (open call usually Sept/Oct)
+-- Apply: Unsound 2027
+-- Apply: Rewire 2027
+-- Apply: Atonal 2027
+-- Apply: MUTEK 2027
+-- Approach Serpentine Arts Tech (cold email with video)
+-- Pitch Wire Magazine feature

OCTOBER
+-- Approach Ableton for Loop 2027 presentation
+-- Approach EMPAC curatorial team
```

### Phase 4: Build the Corpus Resonance Instrument (Nov-Dec 2026)

```
NOVEMBER-DECEMBER
+-- FluCoMa corpus decomposition pipeline:
|   fluid.bufselectevery~, fluid.bufnmf~,
|   fluid.bufhpss~, fluid.buftransientslice~
+-- FluCoMa embedding + timbre space:
|   fluid.bufspectralshape~, fluid.bufmfcc~,
|   fluid.dataset~, fluid.kdtree~
+-- Connect chaos navigation to corpus space
+-- Physical model re-excitation of corpus segments
+-- IMPORTANT: Tune resonators to source material's OWN tuning system
|   (FluCoMa pitch analysis → learn the scale → set resonator freqs)
+-- Test with different corpora:
|   +-- Your own productions
|   +-- Field recordings
|   +-- African music archive material
```

### Phase 5: Build the Coupled Rhythm Engine (Jan-Feb 2027)

```
JANUARY 2027
+-- Apply: EMS Stockholm (Jan 1-31 window)
+-- Fund EMS via Goethe/British Council invitation letter
+-- Apply: Africa No Filter (P2 + P3 combined proposal)
+-- Apply: Ford Foundation Creativity & Free Expression (P3 thesis)
+-- Apply: Prince Claus Fund (P3 thesis)
+-- Pitch Smithsonian Folkways collaboration

+-- Build Kuramoto coupled oscillator network in gen~
|   6 oscillators, coupling strength K, trigger generation
+-- Implement equiheptatonic + equipentatonic tuning systems
|   2^(n/7) and 2^(n/5) frequency calculations
+-- Wire triggers to waveguide resonators from P1
|   Each trigger excites a different resonator + tuning degree
+-- FluCoMa rhythm analysis feedback loop
|   fluid.onsetslice~ + periodicity detection → coupling adjustment

FEBRUARY 2027
+-- Add TouchDesigner circular oscillator visualization
|   Phase positions, coupling lines, sync order parameter
+-- Record rhythmic material: vary K from 0 (free) to 1 (locked)
+-- Edit into:
|   +-- Club-weight piece for Hyperdub
|   +-- Polyrhythmic piece for Planet Mu / Nyege Nyege Tapes
|   +-- Boiler Room-ready AV recording with oscillator viz
+-- Update alabo.studio: "Coupled Rhythm Engine" page
```

### Phase 6: Build the Swarm Polyphony Engine (March-April 2027)

```
MARCH 2027
+-- Build swarm engine (JavaScript in Max or gen~ for small agent count)
|   Agent rules: separation, alignment, cohesion
|   2D pitch-time space with equiheptatonic grid
+-- Wire agent triggers to waveguide resonators
|   Each agent gets a different resonator timbre
|   (heterogeneous sound ideal)
+-- FluCoMa analysis of swarm output → optional feedback
+-- First recordings: sweep cohesion/separation/alignment

APRIL 2027
+-- Combine P3 (Kuramoto rhythm) + P4 (swarm polyphony)
|   Kuramoto triggers seed the swarm's rhythmic grid
|   The complete system: rhythm + polyphony from first principles
+-- Build TouchDesigner swarm visualization
|   Particle field + combined P3 circular ring view
+-- Record the 60-min live set structure (opening → peak → dissolve)
+-- Film AV documentation for P4
+-- Update alabo.studio: "Swarm Polyphony" page + full practice overview
```

### Phase 7: Residencies, Premieres & Albums (2027)

```
SPRING-SUMMER 2027
+-- EMS residency: develop all four instruments
+-- Record Album 1: Feedback Instrument → PAN or Subtext
+-- Record Album 2 material: Corpus Resonance
+-- Record Album 3: P3+P4 combined → Warp, Hyperdub, or Planet Mu
+-- Separate EP from P4 alone (beautiful swarm states) → Erased Tapes or PAN
+-- Cycling '74 educational content series (paid)
+-- Serpentine commission (if successful)
+-- Pitch IRCAM residency for P4 research component

AUTUMN 2027
+-- Festival premieres:
|   +-- CTM / Unsound / Rewire: Full practice (P1+P2+P3+P4 as 60-min set)
|   +-- Atonal: P1+P3 focused (sub bass + rhythm = Kraftwerk set)
|   +-- Nyege Nyege: P3+P4 (African rhythm + polyphony engine homecoming)
|   +-- MUTEK: Full AV set (all four with combined TD visuals)
|   +-- Boiler Room: P3+P4 with circular ring + swarm particle viz
|   +-- MaerzMusik: P4 focused (swarm as time-based art)
|   +-- HKW: P3+P4 with discourse program (decolonial thesis)
+-- Album releases across labels
+-- NTS Radio monthly show begins
+-- Wire Magazine cover feature
+-- Ensemble Modern / ICE commission: live musicians + swarm interaction

2028
+-- Touring circuit established
+-- Ford Foundation / Leverhulme grant applications for expanded research
+-- SOAS visiting fellowship for academic component
+-- Second album cycle with new corpora (P2) for different commissions
```

---

## Technical Reference

### Max/MSP Packages Needed

- **FluCoMa** (Fluid Corpus Manipulation): `fluid.spectralshape~`, `fluid.pitch~`, `fluid.loudness~`, `fluid.mfcc~`, `fluid.onsetslice~`, `fluid.bufnmf~`, `fluid.bufhpss~`, `fluid.buftransientslice~`, `fluid.dataset~`, `fluid.kdtree~`, `fluid.umap~`
- **nn~** (IRCAM): For RAVE/PERI model loading
- **odot** (CNMAT): For OSC message formatting (Max -> TD)
- **gen~**: Built-in. All chaos oscillators and physical models live here.

### TouchDesigner Setup

- **OSC In CHOP**: Receive chaos XYZ + FluCoMa data from Max
- **Geometry COMP + Instancing**: 3D attractor visualization
- **GLSL TOP**: Audio-reactive shaders
- **NDI Out TOP** or **Syphon Spout Out TOP**: To projector

### JUCE (Later — Distribution Phase)

- Port gen~ chaos oscillators to C++ audio callback
- Port waveguide resonator
- ONNX Runtime for any neural model inference
- JUCE AudioProcessor for VST3/AU/AAX plugin
- This becomes the Max4Live device (via JUCE -> Max external) or standalone plugin

### Key Artistic References

**Feedback / Cybernetic lineage (P1):**
- David Tudor — *Rainforest* (1968-2006): Network of transducers on resonant objects. The physical precursor to this digital system.
- Alvin Lucier — *I Am Sitting in a Room* (1969): Room as resonant filter on speech. The conceptual ancestor.
- Gordon Mumma — *Hornpipe* (1967): Cybernetic instrument that responds to room acoustics.
- Eliane Radigue — Feedback works with ARP 2500 (1970s): Patience and deep listening with feedback systems.
- Emptyset — *Signal* (2015): Feedback as compositional system. On Subtext Recordings.
- Rashad Becker — *Traditional Music of Notional Species* (2013): Impossible physical models on PAN Records.

**Corpus / Archive lineage (P2):**
- Iannis Xenakis — Stochastic music, granular synthesis origins.
- Curtis Roads — *Microsound* (2001): Theoretical foundation for corpus approaches.
- Rodrigo Constanzo — FluCoMa-based corpus instruments (current).
- Matana Roberts — *COIN COIN* series: Activating African-American archival material through new music.

**Rhythm / Synchronization / African Musicology lineage (P3):**
- Simha Arom — *African Polyphony and Polyrhythm* (1991): The science of interlocking in Central African music (Aka, Banda Linda). The mathematical analysis of timeline patterns.
- Kofi Agawu — *Representing African Music* (2003): Critique of Western analytical frameworks imposed on African music. Essential reading.
- Gerhard Kubik — Documented equiheptatonic and equipentatonic tuning across Central/Southern Africa. Proved these are precision tuning systems, not "out of tune" Western scales.
- J.H. Kwabena Nketia — *The Music of Africa* (1974): Foundational text on African musical structures.
- Akin Euba — Yoruba drumming, African pianism: bridging traditional and contemporary practice.
- Olly Wilson — "The Heterogeneous Sound Ideal" (1992): African music values timbral contrast within ensemble, not timbral blend. Directly relevant to resonator design.
- Steven Strogatz — *Sync* (2003): Accessible introduction to coupled oscillator theory (Kuramoto model). The science behind why things synchronize.
- Yoshiki Kuramoto — Original coupled oscillator model (1975). The mathematical foundation for P3.
- Mark Butler — *Unlocking the Groove* (2006): Analytical framework for rhythm in electronic dance music. Bridges academic and club.
- Steve Reich — *Drumming* (1971), phase music: Western exploration of gradual phase shifting. Related but fundamentally different from African interlocking (Reich acknowledged the influence but the mechanism is not the same).
- Jlin — *Black Origami* (2017): Polyrhythmic electronic music that references African-American rhythmic traditions. The contemporary benchmark. P3 approaches similar territory from a generative/physics angle rather than sequenced.

---

## The Pitch (One Paragraph — Full Practice)

> I build instruments from first principles — chaos theory, physical modeling, synchronization physics, swarm dynamics — tuned to African tonal systems rather than Western defaults. Four bodies of work: a cybernetic feedback instrument that listens to itself and evolves; a corpus resonance engine that activates cultural archives through impossible resonant bodies; a coupled oscillator rhythm engine where polyrhythmic groove emerges from synchronization physics; and a swarm polyphony engine where 200 autonomous voices following three simple rules produce emergent call-and-response, choral harmony, and interlocking melody in equiheptatonic tuning. Together they form a post-colonial synthesis practice — instruments that embody African musicological principles (interlocking rhythm, non-Western tuning, emergent polyphony, heterogeneous timbre) at the level of the technology itself, not as a stylistic layer. Simha Arom documented that Central African polyphony arises from simple individual rules interacting. Craig Reynolds discovered the same principle in animal flocking. These instruments implement both findings. The work exists as albums, live AV performances, and immersive installations.

## The Short Pitch (For Emails)

> I build synthesizers from physics and African musicological principles — chaos oscillators, physical modeling, coupled oscillator polyrhythm, swarm polyphony — in equiheptatonic and equipentatonic tuning rather than 12-TET. Groove emerges from synchronization mathematics. Melody emerges from collective behavior. Nothing else sounds like this because no other synth is built on these assumptions.

## The Academic Pitch (For Grants / Universities)

> This practice investigates whether the organizational principles documented in African ensemble music (Arom 1991, Agawu 2003, Kubik 1994, Wilson 1992) can be computationally modeled as real-time synthesis instruments operating in indigenous African tuning systems. Four instruments implement specific musicological findings: cybernetic feedback (self-modifying systems), corpus resonance (cultural archive activation), coupled oscillator rhythm (Kuramoto synchronization mapped to timeline patterns), and swarm polyphony (emergent voice-leading from boids-class agent rules). All instruments operate in equiheptatonic (7-TET) and equipentatonic (5-TET) tuning — the first real-time synthesis instruments to do so. Outputs include albums, live performance, and multichannel installation, alongside published research on the computational modeling of African musical systems.

---

*Last updated: 2026-03-01*
