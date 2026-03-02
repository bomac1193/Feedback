# Build Roadmap

> Start to end. Every step in order. No skipping. Each step produces something usable.

---

## What You Need Before Starting

- [ ] Max/MSP installed with gen~ (you have this)
- [ ] FluCoMa package installed in Max (`fluid.spectralshape~`, `fluid.pitch~`, etc.)
- [ ] nn~ package installed (for RAVE/PERI later — not needed immediately)
- [ ] TouchDesigner running with MCP (you have this)
- [ ] OSC communication Max → TD working (test with a simple float)
- [ ] MIDI controller or keyboard (anything with knobs — for K, cohesion, separation, alignment)
- [ ] Audio interface + monitors/headphones

---

## Phase 1: The Resonators (Week 1)

> This is the SOUND of everything. P1, P3, P4 all use these. Get this right and everything else flows.

### Step 1.1: Waveguide Resonator in gen~ (Day 1-2)

Build a single Karplus-Strong waveguide resonator.

```
INPUT:  impulse/excitation signal
OUTPUT: resonant tone at specified frequency
PARAMS: frequency, damping, brightness
```

**Test it with:**
- Manual impulse (bang → click) as excitation
- Sweep the frequency from 30Hz (sub bass) to 2000Hz (metallic)
- Sweep damping from 0.99 (short ping) to 0.999 (long ring)
- Sweep brightness from 0 (dark, woody) to 1 (bright, metallic)

**Done when:** You can play it with a MIDI keyboard and it sounds like a physical resonant object — not a synth, a BODY.

### Step 1.2: Yoruba Pentatonic Tuning (Day 2)

Implement the tuning system inside the resonator.

```
INPUT:  scale degree (0-4) + octave
OUTPUT: frequency in Yoruba anhemitonic pentatonic
PARAMS: root frequency, flex (Pythagorean ↔ just intonation)
```

**Frequency ratios:**
```
degree 0: root × 1.0                                    (0 cents)
degree 1: root × lerp(1.125, 10/9, flex)               (~200 cents)
degree 2: root × lerp(1.265625, 5/4, flex)             (~390 cents)
degree 3: root × 1.5                                    (702 cents)
degree 4: root × lerp(1.6875, 5/3, flex)               (~895 cents)
```

**Test it with:** Trigger degree 0, then degree 3 (the fifth). Does it sound consonant, warm, resolved? Trigger degree 0 and degree 2 simultaneously. Do you hear beating between the harmonics? Sweep the flex parameter — does the intonation feel alive?

**Done when:** All 5 scale degrees across 3 octaves sound RIGHT. Not Western. Not "detuned." A tuning system with its own internal logic.

### Step 1.3: Multiple Resonators with Heterogeneous Timbre (Day 3-4)

Build 6 resonators, each with DIFFERENT character. This is Olly Wilson's heterogeneous sound ideal.

```
Resonator 1: low, dark, woody (sub bass — damping 0.998, brightness 0.2)
Resonator 2: mid, warm, round (body — damping 0.995, brightness 0.4)
Resonator 3: mid-high, bright, metallic (ogene-like — damping 0.99, brightness 0.8)
Resonator 4: high, short, click (transient — damping 0.95, brightness 0.9)
Resonator 5: low-mid, long ring (drone — damping 0.999, brightness 0.3)
Resonator 6: very high, crystalline (harmonic — damping 0.997, brightness 0.95)
```

All tuned to Yoruba pentatonic. Each sounds like a different instrument in an ensemble.

**Test by:** Triggering all 6 in sequence. You should hear 6 distinctly different voices, all in the same scale, all consonant but each with its own timbral identity.

**Done when:** It sounds like an ensemble of impossible instruments, not 6 copies of the same synth.

### Step 1.4: First Recording (Day 4)

Record 10 minutes of manually triggering the 6 resonators in Yoruba pentatonic. Just play. Explore the intervals. Find what sounds beautiful.

**This is your first usable audio.** Save it. This is reference material for everything that follows.

---

## Phase 2: Chaos Oscillators (Week 2)

> Now you have the BODY (resonators). Next: the EXCITATION (chaos).

### Step 2.1: Lorenz Attractor in gen~ (Day 5)

Build the Lorenz system at audio rate.

```
PARAMS: sigma (10), rho (28), beta (2.667), dt (0.0001), gain (0.05)
OUTPUT: x, y, z (3 signals) + scaled audio output
```

**Test with:** Listen to the raw output. It should sound like structured noise — not white noise, not a tone. Something alive and unpredictable. Sweep rho from 20 to 30. At certain values, periodic orbits appear (pitched-ish). At others, full chaos.

**Done when:** You can hear the difference between periodic orbits (quasi-pitched) and chaotic regimes (noise-like), and you can move between them by changing rho.

### Step 2.2: Chaos → Resonator (Day 5-6)

Connect the Lorenz output to the waveguide resonators as excitation.

```
Lorenz x output → Resonator 1 excitation input (scaled)
Lorenz y output → Resonator 2 excitation input
Lorenz z output → Resonator 3 excitation input
```

**Test with:** Sweep rho while the resonators ring. The resonators should respond to the chaos — when the attractor is in a periodic orbit, the resonators ring more clearly. When it's chaotic, they buzz and crackle.

**This is the first moment of Project 1 (Feedback Instrument).** Chaos excitation → physical model resonance. Record 10 minutes.

**Done when:** The combination of chaos oscillator + resonator produces sounds you've never heard before. Not noise. Not a synth. Something that feels physical but impossible.

### Step 2.3: Rossler Oscillator Variant (Day 6)

Build a second chaos oscillator (Rossler) for variety.

```
Rossler has a different character: smoother, more periodic orbits,
less aggressive than Lorenz. Good for melodic/tonal moments.
```

**Done when:** You can switch between Lorenz (aggressive, chaotic) and Rossler (smoother, more periodic) as excitation sources.

### Step 2.4: OSC to TouchDesigner (Day 7)

Send the Lorenz x, y, z coordinates from Max to TD via OSC.

In TD:
- Receive OSC → CHOP
- Map x, y, z to a 3D point position
- Add a Trail SOP to draw the attractor trajectory
- Add Instancing on a Sphere SOP to render the point trail

**Test with:** Run the Lorenz system and watch the attractor form in TD. When rho is in a periodic orbit, you see a clean loop. When chaotic, it fills the space.

**Done when:** You can see and hear the same system simultaneously. The visual and audio are the same data.

---

## Phase 3: Feedback Loop — Complete P1 (Week 3)

### Step 3.1: FluCoMa Analysis (Day 8-9)

Add real-time analysis of the resonator output:

```
Audio output → fluid.spectralshape~ (centroid, spread, skewness, kurtosis)
Audio output → fluid.pitch~ (pitch estimate + confidence)
Audio output → fluid.loudness~ (true peak, perceived loudness)
Audio output → fluid.mfcc~ (13 coefficients — timbral fingerprint)
```

**Test with:** Watch the analysis values while the chaos+resonator system plays. Do they respond meaningfully? Does centroid rise when brightness increases? Does loudness track dynamics?

### Step 3.2: Feedback Mapping (Day 9-10)

Route the FluCoMa analysis back into the chaos and resonator parameters:

```
MAPPING (start simple, complexify later):

fluid.loudness~ → Lorenz rho (inverse)
  LOGIC: When it gets loud → rho moves toward periodic orbit → calms down
  When it's quiet → rho moves toward chaos → energy increases
  = Self-regulating energy

fluid.spectralshape~ centroid → resonator brightness
  LOGIC: When the timbre gets bright → reduce brightness → darkens
  When it gets dark → increase brightness → brightens
  = Timbral self-correction (the system seeks a timbral center)

fluid.pitch~ confidence → Lorenz sigma
  LOGIC: When pitch is clear (high confidence) → increase sigma → more chaotic
  When pitch is unclear → decrease sigma → more periodic
  = The system destabilizes when it's too predictable
```

**Done when:** The system runs on its own for 5+ minutes without getting stuck in one state or blowing up. It should oscillate between chaotic and periodic, loud and soft, bright and dark — on its own. You steer the steering.

### Step 3.3: Record P1 Demo (Day 10-11)

Record 30 minutes of the feedback instrument running.

**Edit into:**
- 15-min piece (for PAN Records demo)
- 5-min piece (for alabo.studio)
- 3-min AV documentation (with TD attractor visuals)

**This is a complete Project 1 output.** You could send the 15-min piece to labels NOW.

---

## Phase 4: Kuramoto Rhythm Engine — P3 (Week 4)

### Step 4.1: Kuramoto Coupled Oscillators in gen~ (Day 12-13)

Build 6 coupled oscillators with coupling strength K.

```
PARAMS:
  K (coupling strength) — YOUR MAIN KNOB
  tempo (BPM base rate)
  ratio1-6 (frequency ratios for each oscillator)

OUTPUT: 6 trigger pulses (one per oscillator)
```

**The frequency ratios** should encode Yoruba/West African timeline relationships:
```
ratio1: 1.0     (base pulse)
ratio2: 1.5     (3:2 — hemiola)
ratio3: 1.333   (4:3)
ratio4: 0.75    (half-time)
ratio5: 2.0     (double-time)
ratio6: 0.667   (3:2 against base, slow)
```

**Test with:** K = 0: all 6 triggers fire independently. Random polymetric texture. K = 0.5: some begin to cluster. Proto-groove. K = 1.0: all locked. Unison pulse. Sweep K slowly from 0 to 1. **The groove should EMERGE.** You should feel the moment when independent pulses click into a collective rhythm. This is the critical transition. If you feel it: it works.

### Step 4.2: Triggers → Resonators (Day 13-14)

Connect the 6 Kuramoto triggers to the 6 resonators from Phase 1.

```
Trigger 1 → Resonator 1 (sub bass, degree 0)
Trigger 2 → Resonator 2 (body, degree 1)
Trigger 3 → Resonator 3 (ogene-like, degree 3 — the fifth)
Trigger 4 → Resonator 4 (transient click, degree 2)
Trigger 5 → Resonator 5 (drone, degree 0 octave below)
Trigger 6 → Resonator 6 (crystalline, degree 4)
```

**Test with:** Sweep K. At K=0: scattered polymetric percussion in Yoruba pentatonic. At K=0.5: a groove forms with sub bass landing on the beat. At K=1.0: all voices hit together — massive equiheptatonic unison chord.

**Done when:** You can make a room nod with just the K knob. This is the Atonal set.

### Step 4.3: Dundun Speech-Tone Layer (Day 14-15)

Add pitch contour to the Kuramoto triggers using the dundun 3-tone system.

```
Each oscillator's PHASE POSITION maps to Low/Mid/High:
  Phase 0.0 - 0.33  → Low  (root × 1.0)
  Phase 0.33 - 0.66 → Mid  (root × 1.122)
  Phase 0.66 - 1.0  → High (root × 1.26)

Smooth glide between tones (30ms portamento).
```

The resonators now pitch-bend as the oscillators cycle. The rhythm engine SPEAKS. As coupling changes, the speech-tone patterns converge and diverge.

**Done when:** Close your eyes and the system sounds like a pitched percussion ensemble having a conversation. Not random notes — speech-like contours with rhythmic intent.

### Step 4.4: TD Visualization for P3 (Day 15)

Send from Max via OSC:
- 6 phase positions (0-2pi each)
- K value
- Trigger events

In TD:
- 6 dots on a circle, each at its phase position angle
- Lines between dots, thickness = K
- Color: warm when clustered (synced), cool when spread (free)
- Flash on trigger

**Done when:** You can SEE the groove lock. The dots cluster and scatter. The audience understands the system visually.

### Step 4.5: Record P3 Demo (Day 16)

Record 20 minutes of the Kuramoto rhythm engine.

**Edit into:**
- Rhythm-focused piece for Hyperdub (sub bass + groove)
- Rhythm piece for Planet Mu (complex polymetric states)
- AV documentation with circular viz

---

## Phase 5: Swarm Polyphony — P4 (Week 5-6)

### Step 5.1: Swarm Engine (Day 17-19)

Build the agent system. Start with **10 agents** (not 200). Use JavaScript in Max (js object) for the swarm logic — gen~ for the audio.

```
Each agent has:
  position: (x, y) where x = rhythmic position, y = pitch (Yoruba pentatonic degrees)
  velocity: (vx, vy)

Each frame, compute for each agent:
  separation force (push away from nearby agents)
  alignment force (match neighbor velocity)
  cohesion force (steer toward local center)

Update velocity, update position.
When agent crosses a pitch gridline → send trigger + frequency to gen~.
```

**The pitch gridlines are NOT equally spaced** — they follow Yoruba pentatonic intervals:
```
Gridline spacing (in abstract Y units):
  degree 0 → degree 1:  2.0 units  (~200 cents)
  degree 1 → degree 2:  2.0 units  (~200 cents)
  degree 2 → degree 3:  3.0 units  (~300 cents)
  degree 3 → degree 4:  2.0 units  (~200 cents)
  degree 4 → degree 5:  3.0 units  (~300 cents, octave)

The wider gaps (300 cents) mean agents cross them LESS often.
This creates natural phrase breathing from the physics.
```

**Test with:** Set cohesion LOW, separation HIGH. You should hear sparse call-and-response. Individual notes ringing, then another note answering. If you hear this with 10 agents: it works. This is the proof-of-concept moment.

### Step 5.2: Call-and-Response Tuning (Day 19-20)

This is the most important tuning step. Adjust parameters until the sparse state sounds MUSICAL:

```
CALL-AND-RESPONSE ZONE:
  Cohesion:     0.2 - 0.4
  Separation:   0.5 - 0.8
  Alignment:    0.1 - 0.3
  Neighborhood: 3 - 8 agents
  Max speed:    LOW (slow = sustained notes, space between events)
```

**Listen for:**
- Overlapping: the "response" should start before the "call" finishes
- Transformation: each response should be a different pitch and timbre
- Space: silence between phrases should feel charged, not empty
- No chaos: it shouldn't sound random. It should sound like a CONVERSATION.

**Done when:** You press play and want to keep listening. Not because it's impressive — because it's beautiful.

### Step 5.3: Scale to 50-200 Agents (Day 20-21)

Increase agent count. The computational cost is in the JS swarm calculation, not gen~.

As you scale up:
- The call-and-response gets multi-layered (multiple simultaneous conversations)
- Dense cluster states become possible (thick chords)
- The sweep from sparse → dense becomes a compositional arc

**Optimize:** If JS is too slow at 200 agents, run the swarm at control rate (every 10-50 samples) not audio rate. The triggers only need ms precision, not sample precision.

### Step 5.4: Connect P3 + P4 (Day 21-22)

**This is the key integration moment.**

```
P3 Kuramoto triggers → P4 swarm rhythmic grid

HOW: Kuramoto trigger pulses define MOMENTS when swarm agents CAN trigger.
Between Kuramoto pulses: silence.
On Kuramoto pulses: any agent crossing a pitch gridline fires its resonator.

The rhythm (P3) constrains the timing.
The melody (P4) determines the pitches.
```

**Test with:** P3 at medium K (loose groove) + P4 in call-and-response mode. You should hear: a rhythmic pulse with melodic call-and-response riding on top. The groove and the melody are both emergent but interact.

**Done when:** It sounds like MUSIC. Not a tech demo. Music you'd want on an album.

### Step 5.5: TD Visualization for P4 (Day 22-23)

Send from Max via OSC:
- All agent x, y positions
- Trigger events (which agent, what pitch)
- Swarm density metrics

In TD:
- Particles: each agent = a dot, color = pitch, size = velocity
- Flash on trigger
- Lines between calling and responding agents (draw line when two triggers are close in time)
- Combined view: P3 circular ring in center, P4 swarm orbiting around it

### Step 5.6: Record P3 + P4 Combined Demo (Day 23-25)

Record the 60-minute live set structure:

```
0-10 min:   P4 alone. Sparse call-and-response. Intimate.
10-20 min:  P3 enters at low K. Sub-rhythmic pulses. Pre-groove.
20-35 min:  P3 coupling rises. GROOVE LOCKS. P4 rides the rhythm.
            Sub bass from resonator 1. Equiheptatonic melody above.
35-45 min:  PEAK. P3 tight + P4 high alignment. 200 voices sweeping.
45-55 min:  P3 loosens. P4 scatters. Call-and-response returns.
55-60 min:  Single resonator rings. Silence.
```

**Edit into:**
- 15-min piece for PAN Records (P4 sparse states — the most beautiful)
- 15-min piece for Warp (P3+P4 rhythmic complexity — the most intense)
- Club-focused piece for Hyperdub (P3 groove + P4 melody — the most physical)
- 5-min AV piece for alabo.studio
- 3-min Boiler Room pitch video

---

## Phase 6: FluCoMa Feedback on P3+P4 (Week 7)

### Step 6.1: Analysis on Combined Output (Day 26-27)

Add FluCoMa analysis to the P3+P4 combined output:

```
fluid.onsetslice~  → track rhythm density
fluid.spectralshape~ → track timbral balance
fluid.loudness~ → track energy
fluid.pitch~ → track harmonic center
```

### Step 6.2: Self-Regulation (Day 27-28)

Route analysis back into P3 and P4 parameters:

```
RHYTHM SELF-REGULATION:
  onset density too high → slightly decrease P3 K → groove loosens
  onset density too low → slightly increase P3 K → groove tightens
  = The system maintains groove without getting stuck

MELODY SELF-REGULATION:
  pitch center too narrow → increase P4 separation → voices spread
  pitch center too wide → increase P4 cohesion → voices converge
  = The system maintains conversational density

ENERGY SELF-REGULATION:
  loudness too high → decrease trigger gain → calms down
  loudness too low → increase trigger gain → energy rises
  = The system breathes
```

**Done when:** The system runs for 30+ minutes without your intervention and doesn't get stuck in one state. It oscillates between groove and texture, dense and sparse, loud and quiet — on its own.

---

## Phase 7: Corpus Resonance — P2 (Week 8-9)

### Step 7.1: Corpus Preparation (Day 29-30)

Choose your first corpus. Options:
- Your own productions (immediate, personal)
- Field recordings (site-specific)
- African music archive material (grant-ready)

Load into Max buffers.

### Step 7.2: FluCoMa Decomposition (Day 30-32)

```
fluid.buftransientslice~ → separate transients from sustain
fluid.bufhpss~ → separate harmonic from percussive
fluid.bufnmf~ → decompose into spectral bases
```

Break the corpus into thousands of micro-segments.

### Step 7.3: Embedding + Timbre Space (Day 32-33)

```
For each segment:
  fluid.bufspectralshape~ → spectral features
  fluid.bufmfcc~ → timbral fingerprint
  fluid.bufpitch~ → pitch estimate

Collect into fluid.dataset~
Build fluid.kdtree~ for nearest-neighbor lookup
Optional: fluid.umap~ for 2D/3D visualization
```

### Step 7.4: Corpus → Resonators (Day 33-34)

Selected corpus segments EXCITE the waveguide resonators (same ones from Phase 1). The archived sound resonates through impossible physical bodies.

```
Navigation: chaos attractor trajectory selects position in timbre space
            → nearest corpus segment plays
            → feeds into resonator as excitation
            → resonator is tuned to Yoruba pentatonic
            → the archive resonates through the tuning system
```

**Done when:** You hear recognizable fragments of the source material transformed through the resonators. The archive is audible but impossible. Rain becomes metallic. Speech becomes tonal. Drums become sustained.

---

## Phase 8: RAVE/PERI Integration (Week 10)

### Step 8.1: Export PERI Model

Once training reaches 500k+ steps:
```
rave export --run <rave_run_dir> --streaming
```

### Step 8.2: Load in nn~

Load the .ts model in nn~ as ONE voice in the feedback network (P1). Not the whole instrument — one module that can be bypassed or blended.

### Step 8.3: Cross-Model Experiments

- Feed chaos oscillator output into RAVE encode → decode (the sound of chaos through your personal sonic identity)
- Feed corpus segments into RAVE (P2 archive through PERI model)
- Use RAVE latent space as one dimension of the swarm's movement space (P4)

---

## Phase 9: alabo.studio + First Send (Week 11)

### Step 9.1: alabo.studio Pages

Create 3 pages:
1. **"Instruments"** — Overview of the practice. The short pitch. Audio excerpts from each project.
2. **"Feedback Instrument"** — P1 concept, 3-min AV documentation, audio.
3. **"Coupled Rhythm + Swarm Polyphony"** — P3+P4 concept, live set excerpt, AV documentation.

### Step 9.2: Send to Labels

| To | What | Format |
|----|------|--------|
| PAN Records (Bill Kouligas) | 15-min piece (P4 sparse call-and-response) | Private SoundCloud/Dropbox + 1-paragraph pitch |
| Subtext Recordings | 15-min piece (P1 feedback instrument) | Same |
| Hyperdub (Kode9) | Club-focused P3+P4 piece | Same |
| Warp Records | Full-length P3+P4 piece (when album-ready) | Same |
| Planet Mu | Polyrhythmic P3 piece | Same |
| Nyege Nyege Tapes | P3+P4 piece | Same |

### Step 9.3: Send to Companies

| To | What |
|----|------|
| Cycling '74 | Email: gen~ Kuramoto + swarm implementation. Screenshots of patches. Audio. Propose featured artist article. |
| Ableton | Email: Propose Loop 2027 presentation on P3+P4 as Max4Live instruments. |

---

## Phase 10: Grant Applications (Week 12)

### Step 10.1: Africa No Filter (Rolling)

**Proposal**: "Building the first synthesizers to implement Yoruba pentatonic tuning, dundun speech-tone systems, and Igbo ogene intervals as live performance instruments."

Attach: Audio demos, 1-page concept, budget.

### Step 10.2: Goethe-Institut

**Proposal**: Fund EMS Stockholm residency (Jan 2027) + CTM Berlin premiere.

"African artist using cutting-edge synthesis tools developed in the European ecosystem (Max/MSP, FluCoMa) to build instruments grounded in Nigerian musical principles. Cultural exchange through the technology itself."

### Step 10.3: Prince Claus Fund

**Proposal**: P3+P4 with the decolonial thesis.

"The first synthesizers built on West African tuning and ensemble principles rather than Western defaults."

---

## Phase 11: Festival Applications (Sept-Oct 2026)

| Festival | Deadline (typical) | What to Submit |
|----------|--------------------|----------------|
| CTM Berlin 2027 | Sept-Oct 2026 | Full practice: P1+P3+P4 AV set + concept |
| Unsound 2027 | Sept-Oct 2026 | P3+P4 60-min AV performance |
| Rewire 2027 | Oct-Nov 2026 | P3+P4 performance + P4 installation proposal |
| Atonal 2027 | Sept-Oct 2026 | P1+P3 focused: sub bass + rhythm in Kraftwerk |
| MUTEK 2027 | Varies | Full AV set with TD visuals |
| Nyege Nyege 2027 | Varies | P3+P4: African rhythm + polyphony engine |
| MaerzMusik 2027 | Late 2026 | P4 as time-based art. Commission proposal. |

---

## Phase 12: EMS Stockholm Application (January 2027)

Window: January 1-31, 2027.

**Proposal**: Develop all four instruments at EMS. Record album material. Use their archive of Swedish electronic music as P2 corpus.

Fund the residency travel/living via Goethe-Institut or British Council invitation letter (EMS provides the letter).

---

## Phase 13: Album Production (2027)

### Album 1: P1 (Feedback Instrument)
- Label: PAN or Subtext
- Character: Textural, sub-bass, evolving. 40-50 minutes.
- Each track = different feedback regime / resonator configuration.

### Album 2: P3+P4 (Rhythm + Polyphony)
- Label: Warp, Hyperdub, or Planet Mu
- Character: Rhythmic, melodic, polymetric. 45-55 minutes.
- Each track = different coupling K / swarm configuration.
- Track arc mirrors the live set: sparse → groove → peak → dissolve.

### EP: P4 alone (Swarm Polyphony)
- Label: Erased Tapes or PAN
- Character: Beautiful, choral, floating. 25-30 minutes.
- Pure call-and-response states. The most accessible entry point.

### Album 3: P2 (Corpus Resonance)
- Label: Context-dependent (use the archive that was the corpus)
- Character: Site/culturally-specific. 40 minutes.

---

## Summary: Weeks at a Glance

| Week | What You Build | What You Ship |
|------|---------------|---------------|
| **1** | 6 waveguide resonators in Yoruba pentatonic | First recording (reference) |
| **2** | Lorenz + Rossler chaos oscillators, OSC → TD | P1 first sounds, attractor visual |
| **3** | FluCoMa feedback loop = complete P1 | **15-min P1 demo** (PAN-ready) |
| **4** | Kuramoto rhythm engine (P3) + dundun tones | P3 rhythm demos |
| **5** | Swarm engine (P4) + call-and-response tuning | P4 first recordings |
| **6** | P3+P4 integration, TD combined viz | **60-min live set recording**, all label demos |
| **7** | FluCoMa self-regulation on P3+P4 | Refined recordings, AV documentation |
| **8-9** | Corpus resonance (P2) | P2 recordings |
| **10** | RAVE/PERI integration | Cross-model experiments |
| **11** | alabo.studio pages, label sends | **PAN, Hyperdub, Warp, Subtext, Planet Mu, Nyege Nyege Tapes** |
| **12** | Grant applications | **Africa No Filter, Goethe, Prince Claus** |
| **Sept** | Festival applications | **CTM, Unsound, Rewire, Atonal, MUTEK, MaerzMusik** |
| **Jan '27** | EMS application | **EMS Stockholm residency** |
| **2027** | Albums, premieres, touring | Everything |

---

## The First Afternoon

If you have Max open right now, here's what to do in the next 3 hours:

```
1. New patcher.
2. gen~ object. Open it.
3. Build the waveguide resonator (15 lines of code).
4. Test with a bang → click~ as excitation.
5. Sweep frequency. Find 40Hz. That's your sub bass.
6. Implement Yoruba pentatonic frequency table.
7. Play degree 0 (root) and degree 3 (the fifth) together.
8. Listen.
9. If it sounds right: you've started.
```

---

*This roadmap is part of the [Approaches.md](./Approaches.md) practice documentation.*
*See also: [Tuning-Systems.md](./Tuning-Systems.md) | [Call-and-Response.md](./Call-and-Response.md)*

*Last updated: 2026-03-01*
