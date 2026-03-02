# Cultural Context — Feedback Chaos Resonator

> This document ships WITH the instrument. It is not a README — it is a statement of intent, provenance, and responsible use.

---

## What This Instrument Is

The Feedback Chaos Resonator is a **new electronic instrument** that combines:
- **Chaos mathematics** (Lorenz, Rossler, Chua, Halvorsen, Aizawa attractors) as excitation sources
- **Waveguide resonators** (Karplus-Strong delay-line synthesis) as the sound-producing mechanism
- **Tuning systems derived from African musical traditions** as the harmonic framework

It creates sounds that **do not exist in any acoustic tradition**. It is a synthesis engine, not a simulation.

---

## What This Instrument Is NOT

- **Not a simulation** of dundun, balafon, mbira, kora, or any specific African instrument
- **Not a sample library** of African sounds
- **Not a "world music" plugin** — it does not promise "authentic African sounds"
- **Not a replacement** for learning, listening to, or hiring practitioners of African musical traditions

**The best way to hear dundun is to hire a dundun player. This instrument creates sounds that don't exist yet.**

---

## On Tuning Systems

The instrument includes 19 tuning systems derived from ethnomusicological research into African musical traditions. These tunings are:

### What They Are
- Mathematical approximations of pitch relationships documented by ethnomusicologists
- Derived from published measurements of real instruments (see Citations.md)
- Implemented as frequency ratios, not as recordings or samples
- Starting points for new sound, not endpoints

### What They Are Not
- Perfect reproductions of any specific instrument's tuning
- Representative of all tuning practice within any tradition
- Fixed or canonical — real African tuning is flexible, contextual, and living

### Per-System Provenance

| # | System | Region | Source Tradition | Key References |
|---|--------|--------|-----------------|----------------|
| 0 | Yoruba Pentatonic | SW Nigeria | Vocal/dundun ensemble | Akinbo 2019, Nzewi 2007 |
| 1 | Dundun 3-Tone | SW Nigeria | Talking drum speech surrogacy | Akinbo 2019 |
| 2 | Balafon Equi-Pentatonic | West Africa | Mande balafon | Arom 1991 |
| 3 | Equi-Heptatonic 7-TET | Central/Southern Africa | Amadinda, timbila | Kubik 1999, 2010 |
| 4 | BaAka/Pygmy 5-TET | Central Africa | Vocal polyphony | Arom 1991, Dehoux & Voisin 1993 |
| 5 | Shona Nyamaropa | Zimbabwe | Mbira dzavadzimu | Tracey 1970, Berliner 1978 |
| 6 | Shona Gandanga | Zimbabwe | Mbira dzavadzimu | Tracey 1970, Berliner 1978 |
| 7 | Kora Silaba | Mande (W. Africa) | Kora | Charry 2000, Knight 1973 |
| 8 | Kora Tomora | Mande (W. Africa) | Kora | Charry 2000 |
| 9 | Kora Sauta | Mande (W. Africa) | Kora | Charry 2000 |
| 10 | Kora Hardino | Mande (W. Africa) | Kora | Charry 2000 |
| 11 | Chopi Timbila | Mozambique | Timbila xylophone | Tracey, Kubik 2010 |
| 12 | Buganda Amadinda | Uganda | Court xylophone | Kubik 2010 |
| 13 | Pelog-adjacent | Indonesia (comparative) | Gamelan reference | Comparative inclusion |
| 14 | Slendro-adjacent | Indonesia (comparative) | Gamelan reference | Comparative inclusion |
| 15 | Harmonic Series (8:9:10:11:12:13:14) | Universal | Natural overtones | Acoustics reference |
| 16 | Pythagorean Pentatonic | Cross-cultural | 3-limit JI | Music theory reference |
| 17 | Septimal JI | Cross-cultural | 7-limit JI | Music theory reference |
| 18 | 12-TET (Western Standard) | European origin | Equal temperament | Standard reference |

**Systems 0-12** are derived from African ethnomusicological sources. Systems 13-18 are comparative/universal reference tunings.

### Using Tuning Systems Responsibly

- **Credit the tradition**: When performing with a specific tuning, acknowledge its origin in program notes, track credits, or social media
- **Don't claim authenticity**: Using Yoruba Pentatonic tuning does not make your music "Yoruba music." It means your music uses a pitch framework inspired by Yoruba musical principles.
- **Explore, don't extract**: These tunings are offered as creative starting points. The `flex` parameter exists because real African intonation is flexible — use it.
- **Support the source**: Consider supporting ethnomusicology research, African music education, or African musicians directly.

---

## On Rhythm Patterns

The arpeggiator includes rhythm patterns derived from African and Lusophone African traditions:

| Pattern | Source | Reference |
|---------|--------|-----------|
| Poly 3:2 | Pan-African polyrhythm | Agawu 1995 |
| Triplet | Universal subdivision | Standard |
| Bembe | Afro-Cuban/West African | Toussaint 2013 |
| Shiko | West African bell | Toussaint 2013 |
| Call/Response | Pan-African structural principle | Agawu 2003 |
| Gahu | Ewe (Ghana) | Locke 1982 |
| Son Clave | Afro-Cuban (from West African ancestor) | Toussaint 2013 |
| Fume Fume | Akan (Ghana) | Toussaint 2013 |
| Kassa | Mande (Guinea) | Traditional transcription |
| Kuduro | Angola | Alisch 2017 |
| Semba | Angola | Moorman 2008 |
| Kizomba | Angola/Cape Verde | Contemporary form |
| Marrabenta | Mozambique | Traditional transcription |

These patterns are idealized representations of complex rhythmic traditions. Real performance involves micro-timing, improvisation, and contextual variation that a step sequencer cannot capture.

---

## On Voice Naming

The six voices are named after West African drum ensemble roles:

1. **iya ilu** (Sub Bass) — "mother drum," the lead
2. **omele** (Body) — supporting drum
3. **ogene** (Metallic) — iron bell
4. **gudugudu** (Transient) — small drum
5. **Drone** — sustained reference
6. **shekere** (Crystalline) — beaded gourd rattle

These names are **mnemonics for the spectral role** of each voice, not simulations of the named instruments. Voice 1 produces synthesized sub-bass, not dundun sounds. Voice 3 produces metallic waveguide resonance, not ogene sounds.

---

## Acknowledgments

- Tuning data derived from published ethnomusicological research (see Citations.md for full bibliography)
- Rhythm patterns derived from published transcriptions by Agawu, Toussaint, Locke, and others
- Instrument designed by a single developer; cultural review by advisory board (see Team.md)
- No traditional musicians or communities were directly involved in development. This is acknowledged as a limitation. Advisory board recruitment is in progress.

---

## How to Contribute

If you are an ethnomusicologist, traditional musician, or cultural practitioner and believe any tuning data, pattern transcription, or framing in this instrument is incorrect or inappropriate:

1. Open an issue on the project repository
2. Email directly (address in README)
3. All corrections will be credited and implemented

---

*This document will be updated as the advisory board provides feedback. Version 0.1 — pre-review draft.*
