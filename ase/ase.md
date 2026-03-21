# Àṣẹ — Voice-Body Layer for the Feedback Instrument

> Àṣẹ (Yoruba): the power of the word to create reality. In Ifá philosophy, speech doesn't describe — it manifests.

**Not a fifth instrument. A voice input layer that sits on top of the existing four-instrument system.**

---

## Table of Contents

1. [Thesis](#1-thesis)
2. [Three Concepts (Ranked)](#2-three-concepts-ranked)
3. [Concept 1: Voice Dissolution](#3-concept-1-voice-dissolution)
4. [Concept 2: Dundun Machine](#4-concept-2-dundun-machine)
5. [Concept 3: Breath Choir](#5-concept-3-breath-choir)
6. [Where Each Layer Maps](#6-where-each-layer-maps)
7. [Why This Is Different From Everything That Exists](#7-why-this-is-different)
8. [ICP Resonance](#8-icp-resonance)
9. [Build Order](#9-build-order)
10. [Performance Structure](#10-performance-structure)
11. [References](#11-references)

---

## 1. Thesis

Your voice becomes the architecture of the instrument — not a controller, not an effect input, but the MATERIAL of the synthesis itself. Your vocal formants shape the resonant bodies, your speech tones generate rhythm, your pitch steers chaos, your breath replaces the attractor, and the feedback loop gradually dissolves your words into pure Yoruba pentatonic resonance.

The voice layer is not a separate instrument. It plugs into the existing Feedback system (P1-P4) as a new control and excitation source. The chaos attractor and your voice coexist — blend between them, or use voice to replace chaos entirely.

**The signature:** The instrument literally cannot be separated from you. Your RAVE model (PERI) is trained on your productions. Your voice carries your vocal tract's unique formant profile. Your Yoruba speech patterns carry your linguistic DNA. Nobody else can produce this sound.

---

## 2. Three Concepts (Ranked)

| Rank | Concept | What It Is | Buildable Now? | Sonic Impact |
|------|---------|------------|----------------|-------------|
| **1** | **Voice Dissolution** | Voice → HPSS → waveguide excitation → feedback loop dissolves words into Yoruba pentatonic resonance | **Yes — 2 days of patching** | Most dramatic. Audience HEARS words become music. |
| **2** | **Dundun Machine** | Yoruba speech tones → Kuramoto rhythm engine → your words come back as polyrhythmic dundun ensemble | Needs P3 (Kuramoto) built first | Deepest moat. Most culturally significant. |
| **3** | **Breath Choir** | Your voice as gravitational attractor for 200 swarm agents in Yoruba pentatonic → you sing inside an emergent ensemble | Needs P4 (swarm) built first | Most emotionally immediate in live performance. |

---

## 3. Concept 1: Voice Dissolution

### The Idea

Alvin Lucier's "I Am Sitting in a Room" — but the room is Yoruba pentatonic tuning. Your voice dissolves into the resonant modes of a tuning system instead of a physical room, and it happens in real-time through waveguide feedback instead of over 45 minutes of tape re-recording.

### Signal Chain

```
MIC IN (adc~)
  │
  └──▶ fluid.hpss~ (real-time harmonic/percussive/residual separation)
        │
        ├── HARMONIC (pitched vowels, melody, sustained sounds)
        │     │
        │     └──▶ fluid.pitch~ → quantize to nearest Yoruba pentatonic degree
        │           │
        │           └──▶ Excites waveguide resonators at TUNING-QUANTIZED pitch
        │                 (you sing C, resonator rings at nearest Yoruba degree)
        │                 (your voice bends to the tuning system)
        │
        ├── PERCUSSIVE (consonants: t, k, p, ch, s, sh)
        │     │
        │     └──▶ Transient excitation routed to specific waveguide voices:
        │           "t" → metallic (voice 3, ogene)
        │           "k" → body (voice 2, omele)
        │           "p" → sub bass (voice 1, iya ilu)
        │           "s"/"sh" → noise across all voices
        │           Your speech rhythm IS the polyrhythmic pattern.
        │
        └── RESIDUAL (breath, vocal fry, air)
              │
              └──▶ Replaces Lorenz attractor as broadband excitation
                    Your breathing pattern = the instrument's breathing pattern
                    Inhale = burst of excitation, resonators ring sympathetically
```

### The Feedback Loop

The waveguide output feeds back into the waveguide input. YOUR VOICE is in the feedback loop.

| Time | What You Hear |
|------|--------------|
| **0-30 sec** | Your words are recognizable but in the wrong tuning. Uncanny. Beautiful. Strange. Your pitch pulled to Yoruba pentatonic intervals. |
| **30-90 sec** | Feedback reinforces waveguide resonant frequencies. Yoruba pentatonic intervals get louder. Your original pitch gets quieter. Your voice is being absorbed into the tuning system. |
| **90-180 sec** | Words are gone. What remains is a resonant chord in Yoruba pentatonic that evolved from your speech. Consonant rhythm is still there but as resonant polyrhythmic pulse, not recognizable speech. |
| **3+ min** | Pure ringing waveguides in Yoruba pentatonic. Continuous breath and vocal input feeds it but nothing recognizable as words remains. You ARE the instrument. |

### Yoruba Speech Through Yoruba Tuning

When you speak Yoruba into this system: Yoruba speech tones (Low/Mid/High) are approximately 200 cents apart. Yoruba pentatonic tuning has steps of approximately 200 and 300 cents. They're built from the same intervallic DNA — one is language, one is music.

Your speech tones don't fight the tuning. They settle into it. Your words find their own music. The speech tones land on scale degrees that are harmonically related to them. Your language and the instrument agree.

### PERI/RAVE Layer (Optional)

Blended output (dissolving voice + resonant Yoruba pentatonic) → nn~ PERI encode → decode.

Four-way intersection: **your voice × your music × Yoruba tuning × physical modeling.**

### What It Sounds Like (Honest)

- NOT a vocoder. Words aren't intelligible in the output after the feedback takes hold.
- NOT voice-through-reverb. The resonance is pitched to Yoruba pentatonic, not room modes.
- NOT granular. No grains, no stuttering. Continuous resonance.
- IS: your voice gradually becoming a tuning system. The transition from speech to music is continuous, audible, and deeply strange. You watch someone speak and hear music emerge from their words.

### Why It Works for Albums

Each track = your voice dissolving into a DIFFERENT tuning system:

```
Track 1: English speech → Yoruba Pentatonic (the home dissolution)
Track 2: Yoruba speech → Yoruba Pentatonic (language meets its own music)
Track 3: Whispered text → Dundun 3-Tone (intimate, only 3 pitches remain)
Track 4: Sung melody → Equiheptatonic (maximum departure, melody pulled to alien intervals)
Track 5: Conversation (two voices) → Balafon Equipentatonic (two dissolutions interacting)
Track 6: Breath only → Shona Nyamaropa (no words at all, pure breath → mbira tuning)
```

---

## 4. Concept 2: Dundun Machine

### The Idea

The talking drum principle, digitized. Your spoken Yoruba → real-time pitch tracking extracts your 3 speech tones → maps directly to the Kuramoto rhythm engine's pitch contour → 6 coupled oscillators interpret your speech tones at different coupling strengths → your words come back as a polyrhythmic dundun ensemble.

You speak one sentence. You hear six drums speak it back to you in canon, at different speeds, coupling and decoupling.

### Signal Chain

```
MIC IN (adc~)
  │
  └──▶ fluid.pitch~ (real-time pitch + confidence)
        │
        └──▶ Speech Tone Classifier
              │
              │  pitch_hz → classify into Low / Mid / High
              │  Low:  < threshold_1 → dundun Low  (root × 1.0)
              │  Mid:  threshold_1 - threshold_2 → dundun Mid  (root × 1.122)
              │  High: > threshold_2 → dundun High (root × 1.26)
              │
              │  confidence < 0.3 → silence (unpitched consonants, not tracked)
              │
              └──▶ Kuramoto Coupled Oscillator Network (gen~)
                    │
                    │  Your speech tone = the "target" for all 6 oscillators
                    │  Each oscillator tracks your tone at different coupling:
                    │
                    │  Oscillator 1: K=0.9 (tight follow, ~50ms delay)
                    │  Oscillator 2: K=0.6 (loose follow, drifts)
                    │  Oscillator 3: K=0.3 (very loose, sometimes follows, sometimes free)
                    │  Oscillator 4: K=0.7 (follows but at half speed — augmentation)
                    │  Oscillator 5: K=0.5 (follows but at 3:2 ratio — hemiola)
                    │  Oscillator 6: K=0.2 (mostly free, occasionally locks to your tone)
                    │
                    └──▶ 6 Waveguide Resonators (gen~)
                          Each triggered by its Kuramoto oscillator
                          Each tuned to the dundun tone its oscillator is tracking
                          Each with heterogeneous timbre (sub/body/metal/transient/drone/crystal)
```

### What You Hear

You say a Yoruba sentence. The three tones of your speech (rising, falling, level) ripple through 6 resonators at different speeds and coupling strengths. Oscillator 1 follows you almost in real-time — a shadow drum. Oscillator 3 is still playing your PREVIOUS sentence's tone pattern while you've moved on. Oscillator 5 plays your tones at 3:2 speed — your sentence in hemiola against itself.

The result: a polyrhythmic dundun ensemble that speaks what you speak, in canon, in polymetric layers. The speech IS the music. Not mapped to music. IS music.

### The K Knob in Performance

- **K = 0 (all oscillators free):** Your speech tones don't affect the ensemble. The Kuramoto system runs independently. You speak over autonomous polyrhythm.
- **K = 0.3-0.6 (partial coupling):** Some oscillators follow your speech, some drift. Your words create suggestions that the ensemble partially follows. Call-and-response between your voice and the drums.
- **K = 1.0 (full coupling):** All 6 oscillators lock to your speech tones. You speak, 6 drums speak in unison. Maximum dundun.

### Why This Has Never Been Built

Requires the intersection of:
1. Yoruba tonal language knowledge (3-tone system, what the intervals are)
2. Real-time pitch tracking good enough for speech (FluCoMa)
3. Kuramoto coupled oscillator implementation (gen~)
4. Waveguide synthesis tuned to dundun intervals
5. The idea to connect speech tones to coupled oscillators

No one has had all five simultaneously.

### Dependencies

- Needs P3 (Kuramoto rhythm engine) built — roadmap Week 4
- Needs confident Yoruba speech for full effect (works with any tonal language but designed for Yoruba)
- `fluid.pitch~` speech tone classification needs calibration per speaker (your Low/Mid/High thresholds are specific to your voice range)

---

## 5. Concept 3: Breath Choir

### The Idea

200 swarm agents in Yoruba pentatonic pitch space. Your voice is one more agent — but with 10x gravitational pull. You sing inside an emergent ensemble. Your DRY VOICE is in the mix at equal volume with the 200 agents. You're not controlling a synth. You're the soloist in a choir of impossible instruments.

### Signal Chain

```
MIC IN (adc~)
  │
  ├──▶ fluid.pitch~ → Y-position in swarm pitch space
  │     (quantized to Yoruba pentatonic grid)
  │
  ├──▶ fluid.loudness~ → gravitational strength
  │     (louder = stronger pull on nearby agents)
  │
  ├──▶ DRY VOICE → mix bus (you are HEARD, not just analyzed)
  │
  └──▶ Swarm Engine (js / gen~)
        │
        │  200 agents in 2D pitch-time space
        │  Your pitch = gravitational attractor point
        │  Your loudness = gravitational strength
        │
        │  Sing sustained note → agents cluster → dense Yoruba pentatonic chord around you
        │  Move pitch → agents follow with delay → parallel fifths trailing your melody
        │  Go silent → gravitational well disappears → agents scatter → autonomous call-and-response
        │  Return → agents regroup → the ensemble responds to your call
        │
        └──▶ 200 Waveguide Resonators (gen~ via buffer~ voice allocation)
              Each agent triggers a resonator with heterogeneous timbre
              All tuned to Yoruba pentatonic
              │
              └──▶ Mix bus (your voice + 200 agents = one ensemble)
```

### What You Hear

Your actual voice, raw, in the center. Around you: 200 resonator voices responding to your pitch. You sing a note — a chord blooms around it, agents arriving at adjacent Yoruba pentatonic degrees over 500ms. The chord is dense, shimmering, the waveguide timbres creating beating patterns in non-Western intervals. You slide your pitch up — the chord follows, smearing, agents arriving at different times. You stop — the chord holds for a moment (agents still near your last pitch) then scatters as separation forces take over. Individual call-and-response emerges between lone agents. You're silent. The choir sings without you. You return — they regroup.

The audience hears one human voice inside a cloud of 200 inhuman voices, all consonant, all in Yoruba pentatonic, and the cloud responds to the human.

### The Emotional Core

This is the concept with the most immediate emotional impact. One human voice in 200 is vulnerable. The choir responding is protective. The scatter when you go silent is loss. The return is reunion. It enacts the ubuntu principle: I am because we are. Your voice alone is one note. Your voice in the choir is music.

### Dependencies

- Needs P4 (swarm polyphony engine) built — roadmap Weeks 5-6
- Needs voice allocation system for 200 waveguide resonators (computationally intensive — likely need buffer~-based voice pooling, not 200 simultaneous gen~ instances)
- Most impactful in multichannel spatialization (each agent has a spatial position → surround sound)

---

## 6. Where Each Layer Maps

The voice layer is not a new instrument. It plugs into the existing system.

| Layer | Maps onto | What Changes | New Objects Needed |
|-------|-----------|-------------|-------------------|
| Voice → waveguide body (formants) | **P1 (Feedback)** | `fluid.mfcc~` → resonator damping/brightness params | `adc~`, `fluid.mfcc~`, `scale` |
| Voice → chaos steering (pitch) | **P1 (Feedback)** | `fluid.pitch~` → Lorenz ρ | `fluid.pitch~`, `scale` |
| Voice HPSS → waveguide excitation | **P1 (Feedback)** | Harmonic/percussive/residual replace/blend with chaos exciter | `fluid.hpss~` |
| Voice → dundun speech tones | **P3 (Kuramoto)** | `fluid.pitch~` → 3-tone classifier → Kuramoto pitch contour | `fluid.pitch~`, classifier logic |
| Voice → swarm attractor | **P4 (Swarm)** | Voice pitch → gravitational Y-position in swarm space | `fluid.pitch~`, `fluid.loudness~` |
| Voice → PERI/RAVE | **P2 (Corpus)** | nn~ encode/decode + latent coords → corpus navigation | `nn~` |

Every layer uses existing parameters. No new synthesis architecture. New input modality, same instrument.

---

## 7. Why This Is Different

| Reference | What They Did | What Àṣẹ Does Differently |
|-----------|--------------|--------------------------|
| **Alvin Lucier** — I Am Sitting in a Room (1969) | Voice → room → tape → room → room modes dominate | Voice → Yoruba pentatonic waveguides → feedback → tuning system dominates. Real-time, not 45 minutes of re-recording. Culturally specific resonance, not architectural. |
| **Holly Herndon** — Spawn/Holly+ (2019-) | AI choir imitates her voice | Your voice STRUCTURES the system — rhythm, timbre, pitch, emergence. Not imitation, architecture. |
| **Pamela Z** | Extended vocal technique + digital processing | No emergence, no collective behavior, no African tuning, no feedback dissolution |
| **George Lewis** — Voyager (1993) | Interactive AI improviser responds to input | Pre-neural, no timbre transfer, no African tuning, no swarm dynamics |
| **Standard voice-through-RAVE** | Encode → decode as trained timbre | One-dimensional timbre swap. Àṣẹ uses RAVE as one layer in a multi-layer voice architecture |
| **Imogen Heap** — mi.mu gloves | Gesture controls synthesis | Hands, not voice. No cultural architecture. No emergence. |
| **David Tudor** — Rainforest (1968) | Objects as resonators for electronic signals | Àṣẹ: your vocal tract as resonator parameters for waveguide synthesis. Digital successor to Tudor's physical approach. |

**Nobody has combined:** voice-HPSS-to-waveguide + pitch quantization to African tuning + feedback dissolution + dundun speech-tone-to-Kuramoto + voice-as-swarm-attractor + RAVE identity stamp.

---

## 8. ICP Resonance

### Existing ICPs That Score Higher With Àṣẹ

| ICP # | Profile | Feedback Score | With Àṣẹ | Why Higher |
|-------|---------|---------------|-----------|-----------|
| 6 | Lagos electronic producer | 9 | **10** | "Living musical knowledge" — your Yoruba speech tones ARE the instrument's structural logic |
| 7 | Nairobi sound artist | 9 | **10** | "Every synth makes me translate" — starts with YOUR VOICE in YOUR LANGUAGE |
| 10 | Kampala experimental | 10 | **10** | "The instrument I would have designed" — and now it responds to your voice |
| 13 | Conceptual sound artist | 9 | **10** | "Tuning systems aren't decorative" — your voice isn't decorative either. Voice IS the synth. |
| 14 | Field recording / GRM artist | **5** | **9** | "I need audio input to excite the resonators" — THIS IS THAT. Voice dissolution is exactly what they wanted. |
| 21 | Documentary film composer | 9 | **10** | "Authentically rooted without strip-mining culture" — your literal voice, your language, your tuning |
| 28 | Fashion show director | 8 | **10** | "Unrepeatable, culturally-rooted, high-tension sound that photographs well" — you on stage, singing, 200 agents answering |
| 30 | Dance choreographer | 8 | **9** | "Rhythmic anchor for choreography" — your VOICE is the anchor. Dancers hear and see you control the system. |

### New ICPs Unlocked

| Profile | Score | Why |
|---------|-------|-----|
| **Vocal performance / new music community** (Meredith Monk, Maja Ratkje lineage) | **10** | Extended vocal technique meets emergent synthesis. Voice dissolution is their entire aesthetic but from a completely different technical and cultural angle. |
| **Spoken word / poetry community** (African diaspora poets) | **9** | Your words dissolve into your tuning system. Poetry becomes music becomes resonance. Collaborations with poets where their words literally become the composition. |
| **Theatre / opera directors** (contemporary, experimental) | **8** | A performer speaks on stage and their words become an orchestra. Staging possibilities are enormous. |

---

## 9. Build Order

### Phase 1: Voice Dissolution (This Week — 2 Days)

Everything needed is in the existing step6 patch + FluCoMa.

```
DAY 1:
  1. adc~ → fluid.hpss~ (harmonic, percussive, residual separation)
  2. Harmonic out → fluid.pitch~ → quantize to nearest Yoruba pentatonic degree
  3. Quantized pitch → set waveguide delay length (replacing/blending with chaos-driven pitch)
  4. Harmonic out → waveguide excitation input (replacing/blending with Lorenz)
  5. Percussive out → trigger waveguide voices (route by amplitude band)
  6. Residual out → broadband excitation (replace Lorenz chaos)
  7. Test: speak into mic, hear waveguides respond in Yoruba pentatonic

DAY 2:
  8. Add feedback: waveguide output → back into waveguide input (you already have this)
  9. Tune feedback gain for 90-second dissolution window
  10. Add dry/wet: blend between chaos-driven and voice-driven excitation
  11. Record 15 minutes: speak → dissolve → speak → dissolve
  12. Test with Yoruba speech vs English speech — compare dissolution character
```

### Phase 2: Voice as Parameter Modulator (Week After)

```
  13. fluid.mfcc~ on mic input → map 13 coefficients to resonator damping/brightness
  14. fluid.pitch~ confidence → Lorenz rho (voice steers chaos when chaos is active)
  15. fluid.loudness~ → excitation energy scaling
  16. Blend mode: chaos attractor + voice excitation simultaneously
      (voice shapes the body, chaos provides continuous energy)
```

### Phase 3: Dundun Machine (When P3 Is Built — Roadmap Week 4)

```
  17. fluid.pitch~ → speech tone classifier (Low/Mid/High thresholds calibrated to your voice)
  18. Speech tones → Kuramoto oscillator target pitches
  19. Variable coupling per oscillator (K1=0.9, K2=0.6, K3=0.3, etc.)
  20. Test: speak Yoruba, hear 6 drums speak back in polyrhythmic canon
```

### Phase 4: Breath Choir (When P4 Is Built — Roadmap Weeks 5-6)

```
  21. fluid.pitch~ → swarm gravitational Y-position
  22. fluid.loudness~ → gravitational strength
  23. Dry voice → mix bus alongside swarm agent resonators
  24. Test: sing into 200-agent choir, hear them respond
```

### Phase 5: PERI Integration (When Training Reaches 500k+ Steps)

```
  25. Voice → nn~ PERI encode → decode → additional excitation stream
  26. PERI latent coordinates → P2 corpus navigation
  27. Blended output (voice dissolution + resonance) → nn~ PERI → sonic identity stamp
```

---

## 10. Performance Structure

### Voice Dissolution Set (35 Minutes — Buildable Now)

```
0:00  — Silence. Walk on stage. Breathe into mic.
        Breath excites waveguides through residual channel.
        First sound: your breath ringing through Yoruba pentatonic resonators.

2:00  — Begin speaking. English or Yoruba.
        Words are recognizable but pitched wrong — bent to Yoruba pentatonic.
        Consonants punctuate the resonators. Speech rhythm = polyrhythm.
        The audience hears words becoming music in real-time.

5:00  — Feedback loop engages (or gradually increases).
        Words start dissolving. Vowels stretch into resonant tones.
        Consonants become percussive ghosts.
        Your sentences leave traces in the tuning system.

8:00  — Words are gone. A Yoruba pentatonic chord rings.
        It evolved from your speech. The chord IS your words.
        You keep speaking — new words feed the system.
        But the feedback absorbs them before they're understood.

12:00 — Switch tuning system (live, via MIDI).
        Yoruba Pentatonic → Equiheptatonic.
        The resonant chord shifts. All intervals change.
        Your same voice, dissolving into a different tuning = different music.

18:00 — Switch to Dundun 3-Tone.
        Only 3 pitches remain. Starker. More rhythmic.
        Your speech reduced to its most essential skeleton.

22:00 — Return to Yoruba Pentatonic.
        Resolution. The audience recognizes the return.
        But after the journey through other tunings, home sounds different.

28:00 — Reduce voice input. Whisper.
        The system runs on the residue of your previous speech.
        Fading chord. Waveguides decaying.

32:00 — Silence. The last resonator rings out.
        Your words have become a tuning system.
        The tuning system has become silence.

35:00 — End.
```

### Full System Set (60 Minutes — When P3 + P4 Are Built)

```
0:00  — Voice Dissolution alone (intimate, textural)
10:00 — Dundun Machine enters (your speech becomes rhythm)
20:00 — Breath Choir enters (200 agents join, you're in the ensemble)
30:00 — Peak: all three layers. Voice + dundun + choir.
        Your voice dissolving, your speech generating rhythm,
        200 agents responding, all in Yoruba pentatonic,
        all through PERI. Maximum density.
40:00 — Dundun Machine fades (rhythm loosens)
50:00 — Choir scatters (agents drift, call-and-response thins)
55:00 — Voice Dissolution alone again (you and the waveguides)
58:00 — Whisper → silence → last resonator → end
```

---

## 11. References

### Artistic Lineage

| Artist | Work | Relationship to Àṣẹ |
|--------|------|---------------------|
| Alvin Lucier | *I Am Sitting in a Room* (1969) | Direct ancestor. Room as resonant filter on voice. Àṣẹ: tuning system as resonant filter on voice. |
| David Tudor | *Rainforest* (1968-2006) | Physical objects as resonators. Àṣẹ: vocal tract as resonator parameter source. |
| Meredith Monk | Extended vocal work (1960s-present) | Voice as pure sound, beyond language. Àṣẹ: voice as synthesis architecture, beyond control. |
| Holly Herndon | *PROTO* / Spawn (2019) | AI vocal choir. Àṣẹ: emergent ensemble (not imitative), culturally grounded. |
| George Lewis | *Voyager* (1993) | Interactive AI improviser. Àṣẹ: interactive emergence through swarm/Kuramoto, African tuning. |
| Éliane Radigue | ARP 2500 feedback works (1970s) | Patience with feedback systems. Àṣẹ: patience with voice dissolution. |
| Demetrio Stratos | Extended vocal technique (1970s) | Voice pushed to physical limits. Àṣẹ: voice pushed through cultural/mathematical limits. |

### Musicological

| Scholar | Work | Relevance |
|---------|------|-----------|
| Akin Euba | *Yoruba Drumming* (1990) | Dundun speech-tone system. The talking drum as speech surrogate. Direct source for Dundun Machine concept. |
| Simha Arom | *African Polyphony and Polyrhythm* (1991) | Emergent polyphony from simple rules. Theoretical foundation for Breath Choir. |
| Olly Wilson | "The Heterogeneous Sound Ideal" (1992) | Timbral contrast in ensemble. Why each voice/agent should sound different. |
| Kofi Agawu | *Representing African Music* (2003) | Why Western frameworks fail. Àṣẹ doesn't impose Western voice processing paradigms. |
| Samuel Akinbo | "Representation of Yoruba Tones by a Talking Drum" (2019) | Exact interval measurements for dundun speech tones. Calibration data for speech tone classifier. |

### Technical

| Tool | Role in Àṣẹ |
|------|-------------|
| `fluid.hpss~` | Harmonic/percussive/residual separation of live voice |
| `fluid.pitch~` | Real-time pitch tracking + confidence (speech tone extraction) |
| `fluid.mfcc~` | 13-coefficient vocal formant tracking → waveguide body parameters |
| `fluid.loudness~` | Energy tracking → excitation amplitude / swarm gravitational strength |
| `fluid.spectralshape~` | Spectral centroid/spread → resonator material character |
| `nn~` | PERI RAVE model — voice encoded/decoded through sonic identity |
| gen~ | All waveguide resonators, chaos attractors, Kuramoto oscillators |

---

## Grant Pitch (Voice Dissolution Specific)

> "Àṣẹ extends the Feedback instrument with a voice-body layer where live speech dissolves into Yoruba pentatonic resonance through waveguide feedback. Drawing on Lucier's 'I Am Sitting in a Room' (1969) and the Yoruba dundun talking drum tradition (Euba 1990, Akinbo 2019), the instrument treats voice not as a controller but as material — harmonic content excites tuning-quantized resonators, consonants become percussion, breath replaces the chaos oscillator, and the feedback loop gradually absorbs speech into pure tonal resonance. When the performer speaks Yoruba, the speech tones (~200 cents apart) align with the pentatonic intervals (~200/300 cents) — language and music revealed as the same system. The result is a real-time dissolution of the word into the tuning system: Àṣẹ, the power of the word to create reality, made literal through physical modeling synthesis."

---

*This document is part of the [Feedback](../) instrument system.*
*See also: [Approaches.md](../Approaches.md) | [Tuning-Systems.md](../Tuning-Systems.md) | [Call-and-Response.md](../Call-and-Response.md)*

*Last updated: 2026-03-03*
