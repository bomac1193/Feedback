# Feedback — Pitch Deck

> For grant panels, label A&Rs, festival curators, residency directors.
> Adapt per audience. Core narrative stays the same.

---

## SLIDE 1: Title

**FEEDBACK**
*Four instruments. One practice. Chaos mathematics meets West African tuning.*

A new synthesis engine that turns chaos into music through physically-modeled resonators tuned to African tonal systems.

**[Your Name]** — Instrument Designer / Electronic Musician
[contact email] | [website]

---

## SLIDE 2: The Problem

**Every synthesizer ever built encodes Western music theory as default.**

12-tone equal temperament. 4/4 time. Chord-based harmony. Diatonic scales. This is one cultural system presented as universal.

Meanwhile:
- African musical traditions operate on fundamentally different tuning principles (unequal pentatonic, equiheptatonic, flexible intonation)
- No commercial synthesizer offers these tuning systems
- No instrument combines chaos mathematics with physical modeling for live performance
- Experimental electronic music keeps recycling the same tools (subtractive, FM, granular, now neural)

**The result**: A global electronic music scene built on one culture's pitch framework, and an experimental scene that's exhausted its current palette.

---

## SLIDE 3: The Solution

**Feedback** is a suite of four linked instruments in Max/MSP:

| Instrument | Explores | What It Does |
|-----------|----------|-------------|
| **P1: Chaos Resonator** | The Self | 5 chaos attractors excite 6 waveguide resonators through 19 African tuning systems |
| **P2: Corpus Resonance** | The World | Cultural audio archives become excitation for physical models — any archive becomes an instrument |
| **P3: Kuramoto Engine** | The Collective | 6 coupled oscillators produce polyrhythm from physics, not programming |
| **P4: Swarm Polyphony** | The Ensemble | 10-200 agents in pitch space produce emergent call-and-response melody |

All four share the same waveguide resonators and tuning systems. Each explores a different dimension of sound.

---

## SLIDE 4: Why This Is Novel

**No instrument combines these three things:**

```
CHAOS MATHEMATICS          PHYSICAL MODELING          AFRICAN TUNING SYSTEMS
(Lorenz, Rossler,     +    (Karplus-Strong        +   (Yoruba Pentatonic,
 Chua, Halvorsen,          waveguide resonators,       Dundun 3-Tone, Shona
 Aizawa attractors)        heterogeneous ensemble)     Mbira, Kora modes,
                                                       19 systems total)
```

**Lineage**: David Tudor (Rainforest), Alvin Lucier (I Am Sitting in a Room), Eliane Radigue — canonical experimental music. Not "I trained a neural net." An instrument that listens to itself.

**The moat**: 19 tuning systems derived from ethnomusicological research (Akinbo, Kubik, Tracey, Charry, Arom). Mathematically implemented with flexible intonation. Validated by published frequency measurements. This data doesn't exist in any other instrument.

---

## SLIDE 5: What's Built (Working Today)

**P1 Chaos Resonator — 95% complete, playable now:**

- 5 chaos attractors (Lorenz, Rossler, Chua, Halvorsen, Aizawa) in gen~ at audio rate
- 6 heterogeneous waveguide resonators (sub-bass to crystalline)
- 19 African + comparative tuning systems with flex parameter
- 9 rhythm patterns (Bembe, Shiko, Gahu, Kuduro, Semba, Kizomba, Marrabenta + polyrhythmic)
- Arpeggiator with Euclidean rhythm generation
- Spring root system (tuning always finds its way home)
- MIDI learn (12 mappable parameters)
- 50 curated sweetspot presets across all 5 attractors
- Performance presentation mode (41 controls)
- FluCoMa real-time spectral analysis integration

**Discovery tooling:**
- Attractor discovery agent: swept 1,100 parameter combinations, scored for musicality
- Navigable heatmaps for each attractor's parameter space
- Smoothing system stress-tested (65/65 tests pass, zero artifacts)

---

## SLIDE 6: What It Sounds Like

**[AUDIO DEMO — 3-5 minutes]**

The demo showcases:
1. **Sub-bass territory** — Waveguide at 30-40Hz in Yoruba Pentatonic. Massive low end that no traditional synthesizer produces.
2. **Metallic/crystalline** — Chua attractor through bright resonators. Inharmonic, bell-like, alive.
3. **Rhythmic arp** — Bembe pattern through 6 heterogeneous voices. Each voice is a different "instrument" in the ensemble.
4. **Chaotic texture** — High chaos_gain, Lorenz at the edge of periodic orbits. The sound of a system discovering itself.
5. **Spring root** — Push the system far, release. Watch it sing its way home through the tuning system.

*[Attach: demo_reel.wav — 3-5 minutes, 24-bit/44.1kHz]*

---

## SLIDE 7: Cultural Framework

**This instrument does not simulate African instruments. It creates sounds that don't exist yet, using pitch frameworks inspired by African musical traditions.**

- Full cultural context document ships WITH the instrument
- Every tuning system cited to published ethnomusicological sources
- Voice names reference Yoruba drum ensemble roles as mnemonics, not simulations
- Flexible intonation modeled computationally (the `flex` parameter)
- Advisory board recruitment in progress (ethnomusicology advisor, cultural documentation writer)

**"The best way to hear dundun is to hire a dundun player. This instrument creates sounds that don't exist yet."**

Key references: Akinbo 2019, Agawu 2003, Kubik 2010, Tracey 1970, Charry 2000, Arom 1991, Nzewi 2007

---

## SLIDE 8: Who It's For

**Beachhead audience (proven demand):**
- Afrofuturist/experimental electronic producers (Nkisi, KMRU, Angel Bat Dawid, Jlin)
- Sound artists working with physical modeling (Mutable Instruments users upgrading)
- Computational ethnomusicology researchers
- Live electronic performers seeking genuinely emergent instruments

**ICP validation**: 30 ideal customer profiles scored. Average fit: 7.8/10. Strongest: Afrofuturist/African electronic (8.6/10 average).

**Market positioning**: Luxury rare instrument. Monomachine, not Serum. Lyra-8, not Massive. The chaos-to-waveguide topology + African tuning = genuine blue ocean.

**Pricing**: $149 (Max patch) / $79 (M4L device when built) / Free academic license

---

## SLIDE 9: What the Grant Funds

| Item | Cost | Purpose |
|------|------|---------|
| **Ethnomusicology Advisor** | $2,000-4,000 | Audit + correct all 19 tuning systems against measured data |
| **Cultural Documentation Writer** | $1,500-2,500 | Cultural context document, sensitivity review, marketing copy |
| **M4L UI Designer** | $3,000-5,000 | Ableton Live wrapper — unlocks 80% of electronic music market |
| **Scene Connector (beta)** | $1,000-2,000 | 5-8 beachhead beta testers in Lagos/Nairobi/Berlin electronic scenes |
| **Festival premiere** | $1,500-3,000 | Travel + equipment for first public performance |
| **Recording/mixing** | $1,000-2,000 | Demo EP (4-5 tracks) for label pitches |
| **Total** | **$10,000-18,500** | |

---

## SLIDE 10: Roadmap

| Phase | Timeline | Milestone |
|-------|----------|-----------|
| **Now** | Complete | P1 Chaos Resonator playable, 50 presets, discovery tooling |
| **Phase 1** | Month 1-2 | Hire ethnomusicology advisor, complete P3 Kuramoto engine |
| **Phase 2** | Month 2-3 | Integrate P4 Swarm, record demo EP, cultural documentation |
| **Phase 3** | Month 3-4 | M4L wrapper, private beta with 5-8 beachhead users |
| **Phase 4** | Month 4-5 | Public release ($149), submit to NIME/AIMC, festival applications |
| **Phase 5** | Month 6+ | P2 Corpus Resonance (commission/residency vehicle), label pitches |

**Festivals targeted**: CTM Berlin, Rewire (Den Haag), Nyege Nyege (Uganda), Unsound (Krakow), Mutek (Montreal), Sonica (Glasgow)

**Labels targeted**: PAN, Warp, Hyperdub, Planet Mu, Nyege Nyege Tapes, Hakuna Kulala

---

## SLIDE 11: The Bigger Picture

Feedback is part of a larger practice:

- **PERI**: A RAVE neural audio model trained on personal corpus (currently training, 41k steps). When mature, becomes one voice in the Feedback network — the system can speak in your timbre.
- **TouchDesigner visualization**: Chaos attractor XYZ coordinates rendered as 3D strange attractors in real-time. The audience sees the sound's behavior.
- **Voice layer (ase)**: Voice dissolution through Yoruba pentatonic resonance — Alvin Lucier's "I Am Sitting in a Room" but the room is a tuning system and it happens in real-time.
- **Album concept ("Corpus Possession")**: Voice pushed through 50,000 chaos-resonator grains. FluCoMa frame-matching + RAVE smoothing. Each track seeded by a different attractor.

**The instrument persists. When the next ML model drops, swap it in. The practice is the constant.**

---

## SLIDE 12: Ask

**Seeking: $10,000-18,500 in grant funding to:**

1. Validate the tuning systems with an ethnomusicology advisor
2. Build the Ableton Live wrapper (M4L) to reach the broader electronic music market
3. Complete P3 + P4 (rhythm and swarm engines)
4. Record a demo EP and premiere live at a major experimental music festival
5. Release publicly with full cultural documentation

**This is a new instrument — not a plugin, not a sample pack, not a neural model. An instrument that creates sounds that don't exist yet, tuned to scales that no synthesizer has ever offered.**

---

*Feedback is designed and built by [Your Name].*
*All tuning data derived from published ethnomusicological research. Full bibliography available.*
*[email] | [website] | [soundcloud/bandcamp]*
