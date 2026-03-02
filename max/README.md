# Feedback Instruments — gen~ Code Files

## Files

| File | What | Phase | Project |
|------|------|-------|---------|
| `resonator.genexpr` | Single waveguide resonator | 1.1 | All |
| `yoruba_tuning.genexpr` | Yoruba pentatonic pitch calculator | 1.2 | All |
| `resonator_ensemble.genexpr` | 6 resonators with tuning built in | 1.3 | All |
| `lorenz.genexpr` | Lorenz chaos attractor | 2.1 | P1 |
| `rossler.genexpr` | Rossler chaos attractor (smoother) | 2.3 | P1 |
| `kuramoto.genexpr` | 6 coupled oscillators, triggers, order param | 4.1 | P3 |
| `dundun_pitch.genexpr` | Speech-tone pitch mapper (phase → freq) | 4.3 | P3 |
| `swarm.js` | Boids swarm engine (JS for Max `js` object) | 5.1 | P4 |
| `swarm_voice.genexpr` | Single resonator voice for `poly~` | 5.1 | P4 |
| `../td/build_viz.py` | TouchDesigner visualization build script | — | All |

## The First Afternoon (Phase 1)

### Step 1: Single Resonator Test

Open Max. New patcher. Build this:

```
[button]
   |
[click~]
   |
[gen~ @gen resonator.genexpr]
   |
[*~ 0.5]
   |
[dac~]
```

Set the gen~ object's `File` attribute to point to `resonator.genexpr`.
Click the button. You hear a pitched ping at 110Hz.

Now add parameter controls:

```
[live.dial @varname freq @_parameter_range 30 2000]
   |
[param freq @name freq]  <-- inside gen~ (automatic if param exists)
```

Or simpler: send messages to gen~:

```
[message: param freq 40]  --> [gen~]    Sub bass
[message: param freq 200] --> [gen~]    Body
[message: param freq 800] --> [gen~]    Metallic
```

Sweep the frequency. Find 40Hz. That's your sub bass.

### Step 2: Yoruba Pentatonic

Two options:

**Option A: Use the standalone tuning gen~**

```
[number (0-4)]        [number (octave)]
     |                      |
   [sig~]                [sig~]
     \                    /
[gen~ @gen yoruba_tuning.genexpr]
           |
     [snapshot~ 50]
           |
     [param freq] --> [gen~ resonator]
```

**Option B: Use the ensemble (tuning built in)**

```
[click~]                    (connect to in1 for resonator 1)
   |
[gen~ @gen resonator_ensemble.genexpr]
   |          |
[dac~ 1]  [dac~ 2]
```

Send degree messages:
```
param deg1 0      (root)
param deg1 3      (the fifth)
param root 55     (drop to sub bass octave)
param flex 0.5    (halfway between Pythagorean and just)
```

### Step 3: Test the Intervals

Play degree 0 (root) and degree 3 (the fifth) together:
- Connect two [click~] with different timing to in1 and in2
- Set deg1=0, deg2=3
- Both at oct1=-1, oct2=-1 (sub bass range)
- Listen. Warm fifth. Resolved. Consonant.

Now play degree 0 and degree 2 (the "third"):
- Set deg2=2
- Sweep flex from 0 to 1
- At flex=0 (Pythagorean): the third is sharp, beating
- At flex=1 (just): the third is pure, locked
- At flex=0.5: in between. Alive. This is Yoruba intonation.

### Step 4: Switch Tuning Systems

```
param tuning_system 0    Yoruba Pentatonic (home)
param tuning_system 1    Dundun 3-Tone (speech tones)
param tuning_system 2    Balafon Equipentatonic (floating)
param tuning_system 3    Equiheptatonic 7-TET (alien)
```

Listen to how the same degrees sound in each system.
Dundun reduces everything to 3 pitches — Low/Mid/High.
Equiheptatonic makes every interval equal — no gravity, no home.

## Phase 2: Chaos Excitation

### Step 5: Lorenz Oscillator

```
[gen~ @gen lorenz.genexpr]
  |1    |2    |3
  x     y     z
```

Listen to out1 raw. It's structured noise. Not white, not pink — chaotic.

Now sweep rho:
```
param rho 20    (converging — quiet, pitched)
param rho 24.7  (onset of chaos — the edge)
param rho 28    (full chaos)
param rho 35    (different chaotic structure)
```

### Step 6: Chaos into Resonators

```
[gen~ lorenz]
  |1    |2    |3
  |      |      |
  in1   in2   in3
[gen~ resonator_ensemble]
  |          |
[dac~ 1]  [dac~ 2]
```

The chaos EXCITES the resonant bodies.
The resonators give the chaos PITCH and TIMBRE.
Together = sounds you've never heard.

Sweep rho while the resonators ring:
- Periodic orbits → resonators ring clearly, almost melodic
- Chaotic regime → resonators buzz, crackle, breathe
- The edge → the most interesting zone

Record 10 minutes of this. This is Project 1 in embryo.

## OSC to TouchDesigner

Send the Lorenz xyz to TD for real-time visuals:

```max
[gen~ lorenz]
  |1    |2    |3
  |      |      |
[pak f f f]
  |
[prepend /lorenz/xyz]
  |
[udpsend 172.24.64.1 7000]
```

In TD:
1. OSC In CHOP (port 7000)
2. Select channels /lorenz/xyz:*
3. Geometry COMP with Instancing
4. Map x/y/z to tx/ty/tz
5. Trail SOP for trajectory visualization

The strange attractor forms in 3D space. Audio and visual are the same data.

## Parameter Quick Reference

### Resonator
| Param | Range | What |
|-------|-------|------|
| freq | 20-2000 Hz | Pitch (30-80 = sub bass territory) |
| damping | 0.95-0.9995 | Decay (0.95=click, 0.999=drone) |
| brightness | 0-1 | Material (0=skin/wood, 1=metal/glass) |
| drive | 0-1 | Excitation input level |

### Tuning
| Param | Range | What |
|-------|-------|------|
| root | Hz | Root frequency of the scale |
| flex | 0-1 | Pythagorean (0) to just intonation (1) |
| tuning_system | 0-3 | 0=Yoruba, 1=Dundun, 2=Balafon, 3=Equiheptatonic |
| deg1-6 | 0-4 | Scale degree per resonator |
| oct1-6 | -2 to +2 | Octave offset per resonator |

### Lorenz
| Param | Range | Sweet Spots |
|-------|-------|------------|
| sigma | 5-20 | 10 = classic |
| rho | 15-40 | 24.7 = chaos onset, 28 = classic chaos |
| beta | 1-5 | 2.667 = classic |
| dt | 0.00001-0.001 | 0.0001 = safe |
| gain | 0.01-0.2 | 0.05 = reasonable level |

### Rossler
| Param | Range | Sweet Spots |
|-------|-------|------------|
| a | 0.1-0.5 | 0.2 = classic |
| b | 0.1-0.5 | 0.2 = classic |
| c | 3-10 | <4 = periodic, 5.7 = chaos |
| dt | 0.00001-0.001 | 0.0001 = safe |
| gain | 0.01-0.3 | 0.1 = reasonable |

---

## Project 3: Kuramoto Rhythm Engine (Phase 4)

### Step 7: Kuramoto Oscillators — Hear the Groove Emerge

```
[gen~ @gen kuramoto.genexpr]
  |1  |2  |3  |4  |5  |6        <- 6 trigger outputs
  |7                              <- order parameter r
  |8  |9  |10 |11 |12 |13       <- 6 phase outputs (0-1)
```

First test — just listen to the raw triggers. Connect each to a click:

```
[gen~ kuramoto]
  |1       |2       |3       |4       |5       |6
[click~] [click~] [click~] [click~] [click~] [click~]
  |        |        |        |        |        |
  +--------+--------+--------+--------+--------+
                       |
                    [*~ 0.3]
                       |
                    [dac~]
```

Now SWEEP K:
```
param K 0.0     All 6 clicks fire independently. Scatter. Polymetric.
param K 0.3     Some clicks start to cluster. Proto-groove.
param K 0.5     THE SWEET SPOT. Groove forms. Dissolves. Reforms.
param K 0.7     Strong groove. Most voices locked. A few drift.
param K 1.0     All locked. Unison click. Powerful but simple.
param K 0.0     Release. Scatter again. The groove dissolves.
```

**The moment you feel K=0.3-0.5 click into a groove: that's the instrument.**

Change the ratios for different polyrhythmic feels:
```
param ratio1 1.0  param ratio2 1.5  param ratio3 1.333   (West African 12-pulse)
param ratio1 1.0  param ratio2 1.25 param ratio3 1.75    (different cross-rhythm)
param ratio1 1.0  param ratio2 2.0  param ratio3 3.0     (overtone-based)
```

### Step 8: Kuramoto → Resonators (THE P3 INSTRUMENT)

Connect Kuramoto triggers to the 6-resonator ensemble:

```
[gen~ kuramoto]
  |1    |2    |3    |4    |5    |6
  |      |      |      |      |      |
  in1   in2   in3   in4   in5   in6
[gen~ resonator_ensemble]
  |          |
[*~ 0.5] [*~ 0.5]
  |          |
[dac~ 1]  [dac~ 2]
```

Set the resonator ensemble to Yoruba pentatonic:
```
param tuning_system 0    (Yoruba)
param root 55            (sub bass range)
param flex 0.5           (flexible intonation)
```

Sweep K. At K=0: scattered polymetric percussion in Yoruba pentatonic,
6 different timbres, 6 different pitches, independent rhythms.
At K=0.5: a groove forms. Sub bass lands on the beat. Metallic ogene
voice cuts through. The ensemble breathes.
At K=1.0: all voices hit together — massive Yoruba pentatonic chord.

**This is the Atonal set. This is the Hyperdub demo.**

### Step 9: Add Dundun Speech Tones

Make the resonators SPEAK. Each oscillator's phase controls its pitch
via the dundun 3-tone mapper:

```
[gen~ kuramoto]
  |1 (trig)    |8 (phase)
  |              |
  |        [gen~ dundun_pitch]   <- phase → frequency with glide
  |              |
  |        [snapshot~ 100]
  |              |
  |        [param freq]
  |             /
[gen~ resonator]    <- excitation from trigger, freq from dundun
  |
[dac~]
```

Repeat for all 6 oscillators. Each gets its own resonator + dundun_pitch.

Or simpler: use 6 separate `resonator.genexpr` instances (not the ensemble)
so each can have its own frequency input from dundun_pitch.

Set dundun parameters:
```
param root 110            (dundun Low tone)
param interval_low_mid 200  (cents — standard Yoruba speech interval)
param interval_mid_high 200
param glide_ms 30         (quick speech-like bend)
```

**Test:** At K=0, each resonator speaks independently — 6 different words.
At K=0.5, some start speaking in UNISON — consensus emerges.
At K=1.0, all speak the same word at the same time — the ensemble shouts.

Close your eyes. It should sound like a pitched percussion ensemble
having a conversation. Not random notes — speech contours with rhythmic intent.

### Step 10: OSC to TouchDesigner (P3 Visuals)

```max
[gen~ kuramoto]
  |7 (order param r)
  |
[prepend /kuramoto/r]
  |
[udpsend 172.24.64.1 7000]

[gen~ kuramoto]
  |8  |9  |10  |11  |12  |13 (phases)
  |    |    |     |     |     |
[pak f f f f f f]
  |
[prepend /kuramoto/phases]
  |
[udpsend 172.24.64.1 7000]
```

In TD:
1. OSC In CHOP (port 7000)
2. 6 Circle SOPs positioned on a ring at phase angles (phase * 360 degrees)
3. Lines between each pair, thickness = K parameter
4. Color: warm when clustered (r > 0.7), cool when spread (r < 0.3)
5. Flash/scale each dot on trigger
6. Order parameter r → a bar or ring that fills up = groove meter

The audience SEES the groove lock. Dots cluster. Scatter. Cluster again.

### Kuramoto
| Param | Range | Sweet Spots |
|-------|-------|------------|
| K | 0-2 | 0=free, 0.3-0.7=groove, 1+=locked |
| tempo | 40-200 BPM | 120=standard, 80=slow groove, 160=fast |
| ratio1-6 | 0.25-4.0 | Default: 1.0, 1.5, 1.333, 0.75, 2.0, 0.667 |
| trig_width | 0.0001-0.05 s | 0.001=click, 0.01=soft |

### Dundun Pitch
| Param | Range | What |
|-------|-------|------|
| root | Hz | Low tone frequency |
| interval_low_mid | 100-400 cents | Speech interval (200 = standard Yoruba) |
| interval_mid_high | 100-400 cents | Speech interval (200 = standard Yoruba) |
| glide_ms | 5-200 ms | 30=speech, 5=percussive, 100=singing |

### Polyrhythm Presets

**West African 12-pulse (agbadza/standard timeline):**
```
ratio1=1.0  ratio2=1.5  ratio3=1.333  ratio4=0.75  ratio5=2.0  ratio6=0.667
```

**Yoruba dùndún ensemble feel:**
```
ratio1=1.0  ratio2=1.5  ratio3=2.0  ratio4=0.5  ratio5=3.0  ratio6=0.333
```

**Igbo ogene-based (triple meter):**
```
ratio1=1.0  ratio2=1.5  ratio3=3.0  ratio4=0.75  ratio5=1.5  ratio6=0.5
```

**Slow, wide polyrhythm (installation/drone):**
```
ratio1=1.0  ratio2=1.618  ratio3=2.236  ratio4=0.618  ratio5=1.414  ratio6=0.786
```
(Golden ratio / irrational ratios = never fully syncs, always drifting)

---

## Project 4: Swarm Polyphony Engine (Phase 5)

### Step 11: Swarm — Hear the Polyphony Emerge

The swarm runs in JavaScript (`js` object), NOT gen~.
Boids need loops over N agents — gen~ can't loop.
The js computes positions at control rate, outputs note events.

```
[metro 10]                  <- 100Hz update rate (10ms per frame)
    |
[js swarm.js]
  |0              |1             |2            |3
  note events     positions      metrics       trigger flash
  [voice freq     [for TD]       [for TD]      [for TD]
   vel]
```

First test — just listen:

```
[metro 10]
    |
[js swarm.js]
    |0
[route 0 1 2 3 4 5]          <- split by voice_id (0-5)
  |    |    |    |    |    |
[click~][click~]...           <- one click per voice
  +----+----+----+----+----+
              |
           [*~ 0.3]
              |
           [dac~]
```

Send preset messages to hear different states:
```
preset callresponse     Sparse. Individual notes. Space between. Listen for the conversation.
preset flock            Parallel motion. Sweeping. All voices moving together.
preset cluster          Dense. Thick chords. Organ-like.
preset swarming         THE SWEET SPOT. Complex interlocking. Arom's emergent polyphony.
preset drone            Slow. Sustained. Cluster barely moving.
```

### Step 12: Swarm → Resonator Voices (THE P4 INSTRUMENT)

Each swarm agent triggers a resonator with heterogeneous timbre.
Use `swarm_voice.genexpr` in a `poly~` for 6 voices:

**Option A: With poly~ (cleanest)**

Create a Max patcher called `swarm_voice_poly.maxpat`:
```
Inside the poly~ patcher:
  [in 1]  [in 2]  [in 3]         <- trigger, freq, velocity
     |       |       |
  [sig~]  [sig~]  [sig~]
     \       |       /
  [gen~ @gen swarm_voice.genexpr]
     |             |
  [out~ 1]     [out~ 2]          <- stereo audio out
```

In the main patcher:
```
[metro 10]
    |
[js swarm.js]
    |0
[route 0 1 2 3 4 5]              <- split by voice_id
  |    |    |    |    |    |
  |    ...each voice sends to its own resonator instance
  |
[unpack i f f]                    <- voice_id, freq, velocity
     |     |      |
  [thispoly~]  [sig~]  [sig~]    <- route to correct voice
```

**Option B: 6 separate resonators (simpler to start)**

```
[metro 10]
    |
[js swarm.js]
    |0
[route 0 1 2 3 4 5]
  |
  | (voice 0: sub bass)
[unpack i f f]
       |      |
    [sig~ freq] [sig~ vel]
       \       /
[gen~ swarm_voice.genexpr @voice_id 0]
    |          |
  [dac~ 1]  [dac~ 2]
```

Repeat for voices 1-5, each with different voice_id.

Set parameters:
```
root 55                 (sub bass range for Yoruba pentatonic)
tuning_flex 0.5         (halfway between Pythagorean and just)
octaves 3               (3 octaves of pitch range)
agents 10               (start with 10, scale to 50-200 later)
```

### Step 13: Swarm Presets — What They Sound Like

**callresponse** (sep=0.7, ali=0.15, coh=0.25, slow):
Individual notes ring out. Another answers from a different pitch.
Overlapping — the "response" starts before the "call" ends.
This is where the instrument is most beautiful and most African.
Close your eyes. It's a conversation.

**flock** (sep=0.3, ali=0.7, coh=0.4):
All voices sweep together through the pentatonic scale.
Parallel motion — parallel fourths, parallel fifths.
This IS pre-colonial Nigerian harmony (Nketia, Agawu).
Sweeping, oceanic, choral.

**cluster** (sep=0.1, ali=0.2, coh=0.8):
All agents pile onto the same pitch region.
Dense chord. Beating between close frequencies.
Like a balafon ensemble all striking together.

**swarming** (sep=0.4, ali=0.35, coh=0.45):
THE SWEET SPOT. Complex interlocking polyphony.
Multiple independent melodic lines that relate to each other.
This is Arom's Aka polyphony from simple rules.
The most musical state. Record HERE.

**drone** (sep=0.15, ali=0.1, coh=0.6, very slow):
Barely moving. Sustained cluster. Slow pitch drift.
Installation mode. Let it breathe for 30 minutes.

### Step 14: Connect P3 + P4 (THE COMPLETE SYSTEM)

Kuramoto drives WHEN. Swarm drives WHAT.

```
[gen~ kuramoto]
  |1-6 (triggers)
  |
  v (connect to swarm inlet 1 as gate)
[js swarm.js]        <- set gate_mode to 1: "gate_mode_set 1"
  |0 (note events)
  |
[resonator voices]
```

Wiring:
```
[gen~ kuramoto]
  |1            (or any trigger, or combine with [+~])
  |
[snapshot~ 1]   (convert audio trigger to Max message)
  |
[> 0.5]
  |
[sel 1]
  |
  [inlet 1 of js swarm.js]   <- Kuramoto gate
```

When gate_mode=1, the swarm only outputs notes ON Kuramoto trigger pulses.
The rhythm (P3) constrains the timing.
The melody (P4) determines the pitches.

**Test:** P3 at medium K (loose groove) + P4 in callresponse mode.
You should hear: a rhythmic pulse with melodic call-and-response
riding on top. Groove AND melody, both emergent.

**THIS is the Warp demo. THIS is the festival set.**

### Step 15: OSC to TouchDesigner (P4 Visuals)

```max
[js swarm.js]
  |1 (positions: [N, x0,y0, x1,y1, ...])
  |
[prepend /swarm/positions]
  |
[udpsend 172.24.64.1 7000]

[js swarm.js]
  |2 (metrics: [density, spread, order])
  |
[prepend /swarm/metrics]
  |
[udpsend 172.24.64.1 7000]

[js swarm.js]
  |3 (trigger flash: [agent_id, x, y])
  |
[prepend /swarm/trigger]
  |
[udpsend 172.24.64.1 7000]
```

In TD:
1. OSC In CHOP (port 7000)
2. Particle SOP or Instancing: each agent = a dot
3. X = horizontal position, Y = pitch (vertical)
4. Color by voice_id (6 colors = 6 timbres)
5. Flash/scale on trigger events
6. Trail SOP for melodic contour history
7. Density metrics → heatmap overlay

Combined P3+P4 view:
- P3 circular oscillator ring at center (rhythm)
- P4 swarm particles orbiting around it (melody)
- Kuramoto triggers ripple outward
- Swarm agents flash in response to ripples
- One organism. Audio and visual are the same data.

### Swarm
| Param | Range | What |
|-------|-------|------|
| agents | 2-500 | Agent count (start at 10, scale up) |
| separation | 0-2 | Melodic spacing (high = sparse, open) |
| alignment | 0-2 | Parallel motion (high = flock, sweep) |
| cohesion | 0-2 | Density (high = cluster, chord) |
| maxspeed | 0.001-1.0 | Melodic velocity (low = sustained, high = flutter) |
| neighborhood | 0.5-50 | Listen radius (small = local, large = global) |
| root | 20-2000 Hz | Root frequency |
| tuning_flex | 0-1 | Yoruba tuning (0=Pythagorean, 1=just) |
| octaves | 1-5 | Pitch range |
| gate_mode_set | 0/1 | 0=free, 1=gated by Kuramoto triggers |

### Swarm Voice
| Param | Range | What |
|-------|-------|------|
| voice_id | 0-5 | Timbral character (auto-sets damping + brightness) |
| master_gain | 0-1 | Output level |

---

## TouchDesigner Visualization

### Setup

The build script at `../td/build_viz.py` creates the entire visualization network. Run it in TD's Textport:

```python
exec(open('D:/Visuals/Touchdesigner/Projects/Feedback/td/build_viz.py').read())
```

Or paste into a Text DAT and run:
```python
exec(op('build_script').text)
```

This creates a `feedback_viz` container inside `/project1/` with everything wired.

### Architecture

```
[OSC In CHOP port 7000]
    |
    ├── P1 LORENZ ──────────────────────────────
    │   Select (x,y,z) → Rename (tx,ty,tz)
    │   → Math (scale 0.3) → Trail (5 sec)
    │   → Merge with color → Null
    │   → Geometry COMP (instanced spheres, amber trail)
    │   + Head position (larger sphere, current point)
    │
    ├── P3 KURAMOTO ────────────────────────────
    │   Select (phases) + Select (r)
    │   → Script CHOP (phase → cos/sin ring positions)
    │   → Shuffle CHOP (reformat to instance channels)
    │   → Null → Geometry COMP (instanced spheres)
    │   + Circle SOP ring guide (wireframe)
    │   Color: blue (free) ↔ amber (synced) by r
    │
    ├── P4 SWARM ───────────────────────────────
    │   Select (positions) + Select (triggers)
    │   → Script CHOP (parse flat list → instances)
    │   → Null → Geometry COMP (instanced spheres)
    │   6 voice colors, flash on trigger events
    │
    └── RENDER PIPELINE ────────────────────────
        Camera (z=30) + Light
        → Render TOP (1920×1080)
        → Blur (bloom extraction)
        → Level (boost)
        → Composite (add bloom over original)
        → Out TOP
```

### OSC Addresses (Max → TD)

| Address | Data | From |
|---------|------|------|
| `/lorenz/xyz` | 3 floats (x, y, z) | Lorenz gen~ |
| `/kuramoto/r` | 1 float (0-1) | Kuramoto order parameter |
| `/kuramoto/phases` | 6 floats (0-1) | Kuramoto phases |
| `/swarm/positions` | N*2+1 floats (N, x0,y0,...) | Swarm js |
| `/swarm/metrics` | 3 floats (density, spread, order) | Swarm js |
| `/swarm/trigger` | 3 values (voice_id, freq, vel) | Swarm js |

### Color Scheme

| Element | Color | Hex |
|---------|-------|-----|
| Background | near-black | `#050510` |
| Lorenz trail | amber | `#FF9919` |
| Kuramoto synced | amber | `#FF9919` |
| Kuramoto free | blue | `#3366FF` |
| Voice 0 (sub bass) | red | `#E63333` |
| Voice 1 (body) | amber | `#FF9919` |
| Voice 2 (metallic) | cyan | `#19CCCC` |
| Voice 3 (transient) | yellow | `#FFE633` |
| Voice 4 (drone) | indigo | `#6633E6` |
| Voice 5 (crystalline) | magenta | `#E64DB3` |

### Layout in 3D Space

- **Lorenz** (left): attractor trail drifts in 3D, scaled down 0.3x
- **Kuramoto** (center): ring of radius 8, dots orbit at phase angles
- **Swarm** (right): particles move in 2D plane (z=0), scaled 0.15x
- Camera at z=30 captures all three regions
- Bloom adds glow to all bright elements
