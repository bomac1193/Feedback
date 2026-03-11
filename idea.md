# Corpus Possession — Album Concept

## The Sound

Your voice pushed through 50,000 chaos-resonator grains. FluCoMa replaces every frame of your voice with its nearest mathematical twin from attractor space. RAVE (trained on your voice) smooths the seams with your own timbre. Your mouth is present but Lorenz is choosing the words.

Every consonant shatters into attractor dust and reforms. Held notes drift between tuning systems — you start in Yoruba and the math carries you somewhere unnamed. The RAVE model makes all of it sound like it came from one throat.

## Why It's A Genre

Every genre that mattered had a moment where someone's voice came out wrong in a way that felt more true than right. Auto-Tune on "Believe." 303 acid squelch. Daft Punk vocoder. Each was a human voice pushed through a machine that wasn't designed for it.

Singing through chaos-resonator grains with FluCoMa frame-matching and RAVE smoothing — that's the next version of that moment. Human enough to feel, alien enough to not exist yet.

## Album Structure

10 tracks, each seeded with a different attractor:
- Lorenz tracks = warmer, denser harmonics
- Rossler tracks = cyclical, breathing
- Chua tracks = periodic, crystalline
- Halvorsen tracks = angular, metallic
- Aizawa tracks = wildest, most chaotic

The chaos parameters ARE the track's mood.

## Signal Chain

```
Voice (dry, close-mic)
    |
    v
FluCoMa real-time analysis (2048-sample frames)
    |
    v
KDTree query → nearest grain from chaos-resonator corpus (50k grains)
    |
    v
Granular playback (frame-by-frame replacement)
    |
    v
RAVE voice model (nn~) → smooths grain boundaries, restores your timbre
    |
    v
Record / DAC
```

## What Needs To Happen

1. **Record voice corpus** — 30-60 min of singing, humming, talking, whispering, vowel drones, falsetto, chest voice, breath. Dry, close-mic, no reverb.
2. **Record chaos corpus** — 2 hrs of chaos resonator output across all sweetspots. All 5 attractors.
3. **Train voice RAVE model** — v2_small config, same as PERI. ~20 hrs to 500k steps.
4. **Slice chaos corpus** — `fluid.buftransientslice~` → ~50k grains. Build KDTree of descriptors.
5. **Build the possession patch** — FluCoMa real-time analysis → KDTree → grain playback → RAVE nn~.
6. **Perform and record tracks** — sing into it, record the output.

## Optional Extensions

- **Voice choir**: 6x nn~ decoders with perturbed latent streams = choir of impossible selves
- **Descriptor feedback worm**: feed RAVE output descriptors back into its own latent input, let it hallucinate
- **Draw the score**: navigate the sweetspot UMAP with gestures, compose by drawing paths through timbre space
- **Live performance**: TD camera reads crowd conviction, modulates which attractor the possession uses
