# FEEDBACK — Press Kit

---

## Artist Statement

I build instruments that don't exist yet. Feedback began with a question: what happens when you excite a physically-modeled resonator with a chaotic system instead of an oscillator, and tune the result to Yoruba pentatonic instead of Western 12-tone? The answer is a sound that belongs to no tradition but draws from several — a synthesis engine where chaos provides the energy, waveguides provide the body, and African tuning systems provide the harmonic logic.

The instrument listens to itself. FluCoMa spectral analysis feeds back into the chaos parameters, creating a cybernetic loop where the sound shapes its own evolution. You don't play notes — you steer a living system. The spring root system means it always finds its way home to the tuning center, no matter how far you push it.

This is not "world music synthesis." It's post-colonial instrument design. Every synthesizer encodes Western music theory as default. Feedback offers 19 alternatives, each grounded in published ethnomusicological research, each implemented with the flexible intonation that real African musical practice demands.

---

## Project Description

**Paragraph 1 — What:**
Feedback is a suite of four linked electronic instruments built in Max/MSP. The primary instrument combines five chaos attractors (Lorenz, Rossler, Chua, Halvorsen, Aizawa) with six waveguide resonators tuned to 19 African and comparative tuning systems. The result is a live performance instrument that produces sounds impossible on any acoustic instrument or conventional synthesizer — sub-bass waveguides at 30Hz in Yoruba Pentatonic, metallic crystalline resonances in Shona Nyamaropa, polyrhythmic arpeggios through heterogeneous timbres inspired by the West African drum ensemble's division of spectral roles.

**Paragraph 2 — Why:**
The project addresses a blind spot in electronic music: the near-total absence of non-Western tuning systems in commercial instruments. African musical traditions operate on fundamentally different pitch principles — unequal pentatonic scales, equiheptatonic 7-tone systems, speech-derived tonal contours, and flexible intonation that resists fixed temperament. Feedback implements these principles computationally, drawing on the work of ethnomusicologists Gerhard Kubik, Andrew Tracey, Simha Arom, Kofi Agawu, Samuel Akinbo, and Eric Charry. The chaos mathematics provide an excitation source with temporal correlations that waveguides respond to differently than noise or pitched oscillators — producing a genuinely novel timbral palette.

**Paragraph 3 — Where it's going:**
Three additional instruments extend the system: a Kuramoto coupled-oscillator rhythm engine that produces polyrhythm from physics rather than programming; a swarm polyphony engine where 10-200 agents in pitch space generate emergent call-and-response melody; and a corpus resonance instrument where any audio archive becomes excitation for the physical models — making site-specific and culturally-specific commissioned works possible from a single instrument practice. A voice layer (working title: ase) will route the performer's voice through the system, dissolving speech into tuning-system resonance in real-time.

---

## Technical Innovation

- **Chaos-to-waveguide topology**: No prior instrument combines strange attractors with physical modeling resonators. The chaos provides deterministic but unpredictable excitation with temporal correlations that produce richer timbral behavior than filtered noise.
- **19 tuning systems**: Yoruba Anhemitonic Pentatonic, Dundun 3-Tone, Balafon Equi-Pentatonic, Equi-Heptatonic 7-TET, BaAka/Pygmy 5-TET, Shona Nyamaropa, Shona Gandanga, Kora Silaba/Tomora/Sauta/Hardino, Chopi Timbila, Buganda Amadinda, plus comparative systems (Pelog, Slendro, Harmonic Series, Pythagorean, Septimal JI, 12-TET). Each with a `flex` parameter modeling real-world intonation flexibility.
- **Sweetspot discovery**: Custom agent swept 1,100 parameter combinations across all 5 attractors, scoring each for musicality (spectral complexity, harmonic richness, quasi-periodicity, crest factor, envelope variation). Aizawa scored highest (72/100 musicality).
- **Heterogeneous sound ideal**: Following Olly Wilson's principle, the 6 resonator voices are deliberately different in timbre (sub-bass to crystalline), creating an ensemble of impossible instruments rather than 6 copies of a synth.

---

## Cultural Context

Feedback does not simulate African instruments. It uses tuning principles from African musical traditions as a starting point for sounds that don't exist yet. A cultural context document ships with the instrument, including per-tuning-system provenance, citation to published ethnomusicological sources, guidance on responsible use, and an invitation for correction from practitioners and scholars. Full bibliography available (see Citations.md).

---

## Audio Examples

*[Attach audio files]*

1. **Sub-bass drone** (60s) — Lorenz attractor, waveguide at 35Hz, Yoruba Pentatonic, slow arp. Deep, physical, impossible on conventional synths.
2. **Metallic garden** (60s) — Chua attractor, bright resonators, Shona Nyamaropa tuning. Inharmonic bells, crystalline, alive.
3. **Rhythmic ensemble** (60s) — Bembe pattern through 6 heterogeneous voices. Each voice is a different spectral character. The drum ensemble reimagined through chaos.
4. **Edge of chaos** (60s) — Aizawa attractor at high gain, multiple tuning systems blending. The sound of a system at the boundary between order and disorder.
5. **Spring homecoming** (60s) — Push the system far from root, release. The waveguides sing through the scale degrees on their way back to center.

---

## Comparison References

- **If Mutable Instruments Rings** is a resonator controlled by Eurorack voltage, **Feedback** is a resonator controlled by chaos mathematics and African tonality
- **If Soma Lyra-8** is organic chaos through analog circuits, **Feedback** is mathematical chaos through waveguide physics
- **If David Tudor's Rainforest** was feedback through physical objects, **Feedback** is feedback through computational objects tuned to non-Western scales

---

## Visual Assets

*[Suggested — to be created]*

1. Max patch screenshot (presentation mode — 41 performance controls)
2. Sweetspot heatmap (color-coded parameter space, navigable)
3. Chaos attractor 3D visualization (TouchDesigner render of Lorenz/Aizawa trajectories)
4. Tuning system diagram (19 systems mapped as frequency ratios)
5. Live performance photo (when available)

---

## Technical Specifications

- **Platform**: Max/MSP 8+ (macOS/Windows)
- **DSP Engine**: gen~ codebox (real-time at 48kHz)
- **Analysis**: FluCoMa (spectral shape, pitch, loudness, MFCCs, onset detection)
- **Presets**: 50 curated across 5 attractors
- **MIDI**: Full MIDI learn, 12 mappable parameters
- **Audio**: 24-bit, 44.1/48kHz, stereo output
- **CPU**: Single-core gen~ — runs on any modern machine

---

## Bio

*[Your bio — 100 words]*

[Your Name] is an instrument designer and electronic musician working at the intersection of chaos mathematics, physical modeling synthesis, and African musical systems. Their practice centers on building tools that encode non-Western musical logic into electronic instruments, challenging the Western-default assumptions embedded in commercial synthesizers. Feedback is their current project — a suite of four linked instruments combining strange attractors with waveguide resonators tuned to 19 African and comparative tuning systems. They are also developing PERI, a neural audio model trained on their personal corpus, and an audio-visual performance practice using TouchDesigner.

---

## Contact

- **Email**: [your email]
- **Website**: [your website]
- **SoundCloud/Bandcamp**: [links]
- **GitHub**: [if public]

---

*Press kit last updated: March 2026*
