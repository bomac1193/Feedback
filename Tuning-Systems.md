# Tuning & Harmony Systems for the Instruments

> A correction and deepening. Equiheptatonic (7-TET) is Central/Southern African, not West African. Nigerian and West African tuning is different — and more musical for these instruments.

---

## The Correction

In the initial Approaches.md, I emphasized equiheptatonic (7-TET) and equipentatonic (5-TET) as "African tuning." This was imprecise.

- **Equiheptatonic** (7 equal steps of ~171 cents): documented by Kubik primarily in **Central Africa** (Aka, Banda Linda), **Southern Africa** (Chopi timbila in Mozambique), **Eastern Africa** (Uganda), and **Angola** (Ngangela, Chokwe, Luvale).
- **Equipentatonic** (5 equal steps of ~240 cents): documented in **Southern Uganda** and some Central African traditions.

These are NOT the primary tuning systems of Nigeria or West Africa.

**West African and pre-colonial Nigerian tuning is built differently.** It uses consonance-based intervals — fourths, fifths, thirds — not equal divisions of the octave. This distinction matters enormously for how the instruments sound and what they mean.

---

## The Systems That Should Feature Predominantly

### 1. Yoruba Anhemitonic Pentatonic (PRIMARY)

**This should be the default tuning for all four instruments.**

The Yoruba pentatonic scale has 5 notes with NO semitones (anhemitonic). It's built from stacked fourths and fifths — the same consonant intervals that appear across all cultures, but in a specific configuration:

```
YORUBA PENTATONIC (approximate, flexible intonation):

Degree:    1       2       3       4       5       (1)
Interval:    ~200     ~200     ~300     ~200     ~300   cents
Name:      Do      Re      Mi      Sol     La      Do
                                                    (octave)

Compare to Western major pentatonic (C D E G A):
Interval:    200      200      300      200      300   cents

The intervals are SIMILAR but the Yoruba system is FLEXIBLE —
pitches bend and shift based on melodic context and vocal inflection.
The intonation is alive, not fixed.
```

**Key characteristics:**
- Built from fourths (~498 cents) and fifths (~702 cents) — the two most consonant intervals after the octave
- Steps are UNEQUAL: alternating ~200 and ~300 cent intervals
- Creates TONAL GRAVITY: some notes feel more "home" than others (unlike equiheptatonic where all intervals are equal)
- Every note is consonant with every other note (no semitones = no dissonance in the Western sense)
- Used in Yoruba vocal music, dundun ensemble music, and most pre-colonial Nigerian music

**In gen~ implementation:**

```c
// Yoruba Anhemitonic Pentatonic
// Built from fifths/fourths, not equal division

Param root(110);  // Root frequency

// Scale built from stacked fifths (Pythagorean-adjacent):
// Root -> up a fifth -> up a fifth -> etc, then fold into one octave
// C -> G -> D -> A -> E (reordered: C D E G A)

degree0 = root * 1.0;           // Root:     0 cents
degree1 = root * 1.125;         // ~204 cents (9/8 whole tone)
degree2 = root * 1.265625;      // ~408 cents (81/64 Pythagorean ditone)
degree3 = root * 1.5;           // ~702 cents (3/2 perfect fifth)
degree4 = root * 1.6875;        // ~906 cents (27/16 Pythagorean major sixth)
// degree5 = root * 2.0          // Octave

// BUT: Yoruba intonation is FLEXIBLE.
// Add a "flex" parameter that bends intervals toward just intonation:
Param flex(0.5);  // 0 = Pythagorean, 1 = just, 0.5 = in between

// Just intonation versions:
// degree1_just = root * 10/9   (182 cents, smaller whole tone)
// degree2_just = root * 5/4    (386 cents, just major third)
// degree3_just = root * 3/2    (702 cents, same)
// degree4_just = root * 5/3    (884 cents, just major sixth)

// Interpolate between Pythagorean and just:
degree1 = root * (1.125 * (1-flex) + (10.0/9.0) * flex);
degree2 = root * (1.265625 * (1-flex) + (5.0/4.0) * flex);
degree3 = root * 1.5;  // The fifth is stable across systems
degree4 = root * (1.6875 * (1-flex) + (5.0/3.0) * flex);
```

### 2. Dundun Speech-Tone System (ESSENTIAL FOR P3 RHYTHM)

**The Yoruba dundun talking drum operates on the 3-pitch system of the Yoruba language.**

Yoruba is a tonal language with three levels:
- **Ohùn ìsàlè** (Low tone) — Do
- **Àárín** (Mid tone) — Re
- **Òkè** (High tone) — Mi

Plus glides between them (rising, falling, rising-falling).

The dundun doesn't play "notes" — it speaks. The pitch contour IS language. The intervals between the three tones are not fixed in Hz — they're RELATIVE, like speech. But approximately:

```
DUNDUN SPEECH-TONE INTERVALS:

Low ──── Mid ──── High
    ~200       ~200    cents (approximately)

This is a TRITONIC system (3 tones).
The intervals are flexible — they stretch and compress
based on the "sentence" being spoken/played.

In gen~: model this as a 3-state system where the
transitions (glides) are as important as the states.
```

**Why this matters for P3 (Coupled Rhythm Engine):**
The Kuramoto oscillators don't just produce triggers — they can produce PITCH CONTOUR. Each oscillator's phase position maps to one of three pitch states (Low/Mid/High). As coupling changes, the pitch patterns form speech-like contours. The rhythm engine literally "speaks."

**In gen~:**

```c
// Dundun speech-tone mapping for Kuramoto triggers
// Each oscillator's phase maps to a 3-level pitch

Param low_freq(100);     // Low tone (Do)
Param mid_freq(112);     // Mid tone (Re) — ~200 cents above low
Param high_freq(126);    // High tone (Mi) — ~200 cents above mid

// Glide rate — how fast the drum bends between tones
Param glide_ms(30);      // 30ms = quick speech-like bend

// Phase-to-pitch mapping:
// Phase 0.0 - 0.33 = Low
// Phase 0.33 - 0.66 = Mid
// Phase 0.66 - 1.0 = High
// The transitions between zones are GLIDES, not steps

phase = in1;  // From Kuramoto oscillator (0-1)

target_freq = (phase < 0.33) ? low_freq :
              (phase < 0.66) ? mid_freq : high_freq;

// Smooth glide to target
History current_freq(100);
glide_coeff = 1.0 - exp(-1.0 / (glide_ms * samplerate / 1000));
current_freq += (target_freq - current_freq) * glide_coeff;

out1 = current_freq;  // Feed to waveguide resonator frequency input
```

### 3. Ogene Bell Intervals (ESSENTIAL FOR P4 SWARM TIMBRE)

**The Igbo ogene (metal bell) produces specific intervals inherent in its construction:**
- Large double bell: **major third** (~386 cents)
- Breast pair: **major second** (~200 cents)

These intervals are BUILT INTO THE METAL. They're not chosen — they emerge from the physical properties of the iron bell. This is Olly Wilson's heterogeneous sound ideal made literal: the instrument's timbre IS its interval content.

**For the swarm engine (P4):** Use the ogene intervals as the fundamental pitch relationships. Agents that are "close" in the swarm produce major seconds (200 cents). Agents that are "far" produce major thirds (386 cents). The ogene's intervallic DNA becomes the swarm's harmonic language.

### 4. Mandinka Balafon Pentatonic (SECONDARY — BROADER WEST AFRICAN)

The balafon (wooden xylophone with gourd resonators) is tuned to pentatonic or heptatonic scales depending on the specific Mandinka lineage. The tuning is passed down within griot families — each family's balafon has its OWN tuning that's been maintained for generations.

```
BALAFON PENTATONIC (one common tuning, Mandinka/Guinea):

Approximate intervals: 240 - 240 - 240 - 240 - 240 cents
(This IS equipentatonic — 5 equal divisions)

BUT: older/rural instruments are less equal.
Some documented tunings:
  Step 1: ~220 cents
  Step 2: ~260 cents
  Step 3: ~230 cents
  Step 4: ~250 cents
  Step 5: ~240 cents

The "approximately equal" quality is the key —
it's CLOSE to equipentatonic but with personality.
Each instrument is unique.
```

**For the instruments:** Use balafon tuning as an alternate mode. Different from Yoruba pentatonic — the steps are more equal, creating a different feel. Less tonal gravity, more floating/ambiguous. Switch between Yoruba pentatonic and balafon pentatonic for different musical characters.

### 5. Equiheptatonic (TERTIARY — PAN-AFRICAN CONTEXT)

Keep equiheptatonic (7-TET, ~171 cents per step) as a third tuning option. It represents Central/Southern African traditions (Chopi timbila, Aka vocal music) and provides the most alien sound to Western ears. Use it when you want MAXIMUM departure from Western tonality.

### 6. Hausa Modal System (OPTIONAL — NORTHERN NIGERIAN)

Under Islamic influence since the 14th century, Hausa music uses pentatonic scales but with a distinct modal character influenced by Arabic/Islamic maqam traditions. The goje (one-string fiddle) plays improvisatory melodic lines within a pentatonic framework but with ornamental microtones.

Less directly relevant to the core instrument practice but worth including as a "northern" mode for specific compositions or commissions related to northern Nigerian culture.

---

## Hierarchy of Systems for the Instruments

```
PRIMARY (default, always available):
  1. Yoruba Anhemitonic Pentatonic — the HOME tuning
     Built from fourths/fifths. Tonal gravity. Musical.
     USE FOR: Most performances, PAN demos, album core sound.

  2. Dundun 3-Tone System — speech melody
     Low/Mid/High with glides. Talking drum logic.
     USE FOR: P3 pitch contour, rhythmic melody, spoken-word crossover.

SECONDARY (mode switch):
  3. Ogene Intervals — intervallic DNA
     Major second + major third as building blocks.
     USE FOR: P4 swarm harmonic relationships, metallic timbres.

  4. Mandinka Balafon Pentatonic — broader West African
     Near-equipentatonic (5 roughly equal steps).
     USE FOR: Alternate mode, balafon-like textures, West African breadth.

TERTIARY (special use):
  5. Equiheptatonic (7-TET) — Central/Southern African
     Maximum departure from Western tonality.
     USE FOR: Specific commissions, installations, maximum alienness.

  6. Hausa Modal — Northern Nigerian
     Pentatonic with Islamic ornamental microtones.
     USE FOR: Specific compositions referencing northern Nigeria.
```

---

## Pre-Colonial Nigerian Harmony

### What "Harmony" Means Here

Western harmony: vertical chord stacks (triads, sevenths, etc.) moving through progressions (I-IV-V-I).

Pre-colonial Nigerian harmony is FUNDAMENTALLY DIFFERENT:

### 1. Harmony Is Intervallic, Not Chordal

In Yoruba and Igbo traditions, simultaneous sounds are primarily:
- **Octaves** (Yoruba vocal doubling)
- **Fourths and fifths** (the foundational consonances)
- **Thirds** (Igbo ogene, some vocal traditions)

These are INTERVALS, not chords. Two notes sounding together, not three or four. The "harmony" is the relationship between TWO voices, not a vertical stack.

**For the swarm engine:** This means the swarm's most natural harmonic state is DYADS (two-note intervals), not triads. Two agents sounding together in fourths or fifths = authentic pre-colonial Nigerian harmony. Dense chord clusters (many agents together) are beautiful but represent a different aesthetic — more Central African (Aka vocal polyphony).

### 2. Harmony Is Horizontal (Parallel Motion)

When multiple voices do sound together in Yoruba music, they typically move in PARALLEL — same contour, fixed interval. Parallel fourths. Parallel fifths. Parallel thirds.

This maps DIRECTLY to the swarm engine's ALIGNMENT parameter:
- High alignment = voices move in parallel = parallel fourths/fifths = pre-colonial Nigerian harmony
- The swarm naturally produces this when alignment is strong

### 3. Harmony Is Rhythmic

The most important "harmonic" phenomenon in pre-colonial Nigerian music is RESULTANT MELODY — the melody that emerges from the interlocking of rhythmic parts. No single player plays the melody. The melody appears in the interaction between parts.

This is EXACTLY what the swarm engine produces: no single agent plays the melody. The melody emerges from the interaction of agents following simple rules. The swarm IS resultant melody.

### 4. The Heterogeneous Sound Ideal (Olly Wilson)

Pre-colonial African ensembles deliberately use DIFFERENT timbres for each voice. A Yoruba dundun ensemble has the iya ilu (lead, large), the omele (supporting, smaller), the gudugudu (smallest), plus bells and shakers. They are not trying to blend. They are trying to CONTRAST.

**For all instruments:** Each voice/agent/oscillator should trigger a DIFFERENT resonator with different damping, brightness, and body characteristics. Not a homogeneous "synth pad" but a heterogeneous ensemble where you can hear each voice individually within the collective texture.

---

## How This Changes Each Instrument

### P1 (Feedback Instrument)

**Before:** Waveguide resonators in arbitrary or equiheptatonic tuning.
**Now:** Resonators tuned to Yoruba pentatonic as default. The sub-bass frequencies are scale degrees of the Yoruba pentatonic rooted at sub-audio frequencies (27.5Hz root = A0, pentatonic gives 27.5, 30.9, 34.7, 41.25, 46.4 Hz for the five sub-bass degrees).

The feedback system explores the resonant properties of Yoruba pentatonic intervals — which overtones are reinforced, which beating patterns emerge between scale degrees, how the fourth and fifth interact when both resonators ring simultaneously.

### P2 (Corpus Resonance)

**Before:** FluCoMa learns the source material's tuning and resonators adapt.
**Now:** SAME, but with the specific addition: when the corpus IS Nigerian music, the resonators should snap to Yoruba pentatonic or dundun 3-tone intervals. FluCoMa's pitch analysis identifies the source material's tuning system, and the resonators adopt it. When the source is Yoruba, the resonators are Yoruba. When the source is Mozambican timbila, the resonators go equiheptatonic. The instrument RESPECTS the source.

### P3 (Coupled Rhythm Engine)

**Before:** Kuramoto oscillators at arbitrary frequency ratios.
**Now:** Two layers:
1. **Rhythmic layer** (WHEN): Oscillator frequency ratios based on Yoruba/West African timeline patterns (unchanged from before — this was already correct).
2. **Pitch layer** (WHAT PITCH): Each trigger's pitch follows the dundun 3-tone system. The Kuramoto phase position maps to Low/Mid/High. As oscillators couple and decouple, the pitch contours form speech-like patterns. **The rhythm engine speaks Yoruba.**

### P4 (Swarm Polyphony)

**Before:** Agents in equiheptatonic pitch space.
**Now:** Agents in YORUBA PENTATONIC pitch space. The Y-axis gridlines are not equally spaced — they follow the pentatonic intervals (~200, ~200, ~300, ~200, ~300 cents). This means:
- Agents crossing the wider intervals (300 cents) trigger less frequently = natural phrase breathing
- Agents in the narrow intervals (200 cents) are closer together = denser call-and-response
- The asymmetry of the scale creates MUSICAL PHRASING from the physics of agent movement
- Parallel motion (alignment) naturally produces parallel fourths and fifths = pre-colonial harmony

---

## The Performance Tuning Switch

In live performance, switching between tuning systems = switching between cultural contexts:

```
TUNING AS PERFORMANCE DIMENSION:

Section 1: Yoruba Pentatonic (home)
  Warm, consonant, tonal gravity. The audience settles in.
  Call-and-response in familiar intervals.

Section 2: Dundun 3-Tone (speech)
  Reduced to three pitches. The instruments "speak."
  Rhythmic intensity increases. The drum ensemble.

Section 3: Balafon Equipentatonic (West African expansion)
  Steps become more equal. Tonal gravity loosens.
  The sound floats. More ambiguous. Wider African context.

Section 4: Equiheptatonic (Central African departure)
  Maximum alienness to Western and to Yoruba ears.
  All intervals equal. No home. No gravity.
  The most experimental moment.

Section 5: Return to Yoruba Pentatonic (home)
  Resolution. The audience recognizes the return.
  But after the journey, "home" sounds different.
```

This is a 60-minute concert structure where the TUNING SYSTEM is the narrative arc.

---

## Updated gen~ Implementation: Multi-Tuning Resonator

```c
// Universal tuning system for all four instruments
// Switch between systems with a single parameter

Param root(110);          // Root frequency (Hz)
Param tuning_system(0);   // 0=Yoruba, 1=Dundun, 2=Balafon, 3=Equiheptatonic
Param degree(0);          // Scale degree (0-4 for pentatonic, 0-6 for heptatonic)
Param octave(0);          // Octave offset
Param flex(0.5);          // Intonation flexibility (Yoruba mode only)

// === YORUBA ANHEMITONIC PENTATONIC ===
// Intervals: ~200, 200, 300, 200, 300 cents
// Built from fourths and fifths
yoruba_0 = 1.0;                                               // Root: 0 cents
yoruba_1 = 1.125 * (1-flex) + (10.0/9.0) * flex;             // ~196-204 cents
yoruba_2 = 1.265625 * (1-flex) + (5.0/4.0) * flex;           // ~386-408 cents
yoruba_3 = 1.5;                                                // 702 cents (fifth)
yoruba_4 = 1.6875 * (1-flex) + (5.0/3.0) * flex;             // ~884-906 cents

// === DUNDUN 3-TONE ===
// Low / Mid / High with ~200 cent steps
dundun_0 = 1.0;              // Low (Do)
dundun_1 = 1.122;            // Mid (Re) ~200 cents
dundun_2 = 1.26;             // High (Mi) ~400 cents
// (Only 3 degrees — degree 3,4 wrap to octave above)

// === BALAFON EQUIPENTATONIC ===
// 5 roughly equal steps of ~240 cents
// With slight irregularity for authenticity
balafon_0 = 1.0;                        // 0 cents
balafon_1 = pow(2.0, 0.22);             // ~220 cents (slightly narrow)
balafon_2 = pow(2.0, 0.46);             // ~460 cents
balafon_3 = pow(2.0, 0.69);             // ~690 cents
balafon_4 = pow(2.0, 0.93);             // ~930 cents

// === EQUIHEPTATONIC (7-TET) ===
// 7 equal steps of ~171 cents
equi7_ratio = pow(2.0, degree / 7.0);   // Direct calculation

// SELECT TUNING SYSTEM
ratio = (tuning_system == 0) ? (
          (degree == 0) ? yoruba_0 :
          (degree == 1) ? yoruba_1 :
          (degree == 2) ? yoruba_2 :
          (degree == 3) ? yoruba_3 : yoruba_4
        ) :
        (tuning_system == 1) ? (
          (degree == 0) ? dundun_0 :
          (degree == 1) ? dundun_1 : dundun_2
        ) :
        (tuning_system == 2) ? (
          (degree == 0) ? balafon_0 :
          (degree == 1) ? balafon_1 :
          (degree == 2) ? balafon_2 :
          (degree == 3) ? balafon_3 : balafon_4
        ) :
        equi7_ratio;

// FINAL FREQUENCY
out1 = root * pow(2.0, octave) * ratio;
```

---

## Reading List (Updated for Nigerian/West African Focus)

| Author | Work | Why It Matters |
|--------|------|---------------|
| **Akin Euba** | *Yoruba Drumming: The Dùndún Tradition* (1990) | THE source on Yoruba tuning, dundun speech-tone system, pentatonic scale structure. Essential. |
| **J.H. Kwabena Nketia** | *The Music of Africa* (1974) | Foundational overview. West African pentatonic systems, rhythmic structures. |
| **Kofi Agawu** | *Representing African Music* (2003) | Why Western analysis fails. How to think about African music on its own terms. |
| **Kofi Agawu** | *The African Imagination in Music* (2016) | Updated, more comprehensive. Rhythm, melody, tonality across the continent. |
| **Simha Arom** | *African Polyphony and Polyrhythm* (1991) | Central African polyphony. Not Nigerian but essential for P4 swarm concept. |
| **Gerhard Kubik** | *Theory of African Music* Vol I & II (2010) | Equiheptatonic/equipentatonic. Central/Southern focus but pan-African relevance. |
| **Gerhard Kubik** | *Africa and the Blues* (1999) | How African pentatonic systems influenced American music. The Yoruba/blues connection. |
| **Olly Wilson** | "The Heterogeneous Sound Ideal" (1992) | Timbral contrast in ensemble. Why each voice should sound DIFFERENT. |
| **Samuel Akpabot** | *Ibibio Music in Nigerian Culture* (1975) | Southern Nigerian music. One of the few studies by a Nigerian musicologist. |
| **Meki Nzewi** | *African Music: Theoretical Content and Creative Continuum* (1997) | Nigerian musicologist. Igbo perspective. Argues for African music theory on its own terms. |
| **Bode Omojola** | *Yoruba Music in the Twentieth Century* (2012) | Modern Yoruba music in historical context. How pre-colonial systems evolved. |
| Frontiers paper | ["Speech Surrogacy Systems of the Yoruba Dùndún and Bàtá"](https://www.frontiersin.org/journals/communication/articles/10.3389/fcomm.2021.652542/full) | Scientific analysis of dundun pitch-to-speech mapping. The exact intervals. |
| Britannica | ["African music: Equi-tonal systems"](https://www.britannica.com/art/African-music/Equi-tonal-systems) | Clear overview of equitonal vs. consonance-based tuning across Africa. |
| ISMIR paper | ["Exploring African Tone Scales"](https://archives.ismir.net/ismir2009/paper/000087.pdf) | Computational analysis of African scale measurements. Data-driven. |

---

## Summary: What Makes This Honest

The earlier framing ("African tuning = equiheptatonic") was too broad and too Central African. The corrected approach:

1. **Yoruba pentatonic is PRIMARY** — it's your direct lineage, it's musicologically rigorous, and it sounds MUSICAL (tonal gravity, consonance, resolution)
2. **Equiheptatonic is AVAILABLE** — as a Central/Southern African mode, for specific contexts
3. **The dundun 3-tone system** — uniquely Nigerian, uniquely Yoruba, and it makes the rhythm engine SPEAK
4. **Pre-colonial harmony is intervallic** — parallel fourths and fifths, not chord progressions. The swarm engine naturally produces this.
5. **Flexibility is authentic** — Yoruba intonation bends. The `flex` parameter is not a compromise, it's accuracy.

The grant pitch becomes even stronger: "The first synthesizers to implement Yoruba pentatonic tuning, Igbo ogene intervals, and dundun speech-tone systems — not as samples or presets, but as the fundamental frequency relationships of the synthesis engine."

---

*This document is part of the [Approaches.md](./Approaches.md) practice documentation.*
*See also: [Call-and-Response.md](./Call-and-Response.md)*

*Last updated: 2026-03-01*

Sources:
- [Britannica: African music - Equi-tonal systems](https://www.britannica.com/art/African-music/Equi-tonal-systems)
- [Wikipedia: Traditional sub-Saharan African harmony](https://en.wikipedia.org/wiki/Traditional_sub-Saharan_African_harmony)
- [Frontiers: Speech Surrogacy Systems of the Yoruba Dùndún and Bàtá](https://www.frontiersin.org/journals/communication/articles/10.3389/fcomm.2021.652542/full)
- [Frontiers: Perception of Nigerian Dùndún Talking Drum Performances](https://www.frontiersin.org/journals/psychology/articles/10.3389/fpsyg.2021.652673/full)
- [Wikipedia: Ogene](https://en.wikipedia.org/wiki/Ogene)
- [Wikipedia: Balafon](https://en.wikipedia.org/wiki/Balafon)
- [Kubik: Theory of African Music](https://press.uchicago.edu/ucp/books/book/chicago/T/bo8648201.html)
- [ISMIR: Exploring African Tone Scales](https://archives.ismir.net/ismir2009/paper/000087.pdf)
- [Xenharmonic Wiki: African Music](https://en.xen.wiki/w/African_Music)
