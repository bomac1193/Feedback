# Technical Safety Document — Feedback Chaos Resonator

> For live sound engineers, venue techs, and performers. One-page reference.

---

## Maximum Output Level

| Stage | Limiter | Worst Case |
|-------|---------|------------|
| gen~ waveguide feedback | `tanh()` saturation | +/- 1.0 |
| gen~ master output | `master_gain` param (default 0.7) | 0.7 × tanh = 0.7 |
| Post-gen~ gain stage | `*~ 0.8` in audio chain | 0.8 × 0.7 = 0.56 |
| **Absolute maximum** | **tanh × master_gain × 0.8** | **0dBFS (cannot exceed)** |

**The instrument cannot produce output above 0dBFS.** The `tanh()` function in every waveguide feedback loop acts as a soft limiter. Combined with the master gain and post-gen~ scaling, typical output peaks at -3 to -6dBFS.

---

## What Happens When...

### "The attractor diverges"
**It doesn't.** All five chaos attractors (Lorenz, Rossler, Chua, Halvorsen, Aizawa) are bounded dynamical systems. Additionally:
- All attractor state variables are clamped (`clamp(x, -200, 200)`)
- History variables are clamped per-sample
- The `chaos_gain` parameter scales attractor output (default 0.01 = very quiet excitation)

### "chaos_gain is set to maximum"
Maximum `chaos_gain` (0.5) drives louder excitation into the waveguides. The `tanh()` in the feedback loop **self-limits**: louder input → more saturation → warm distortion, NOT blowout. At extreme settings, you get dirty, distorted resonance — not speaker-destroying transients.

### "The sub-bass is turned up all the way"
`sub_amt` maxes at 1.5. The sub-bass waveguide has the same `tanh()` limiter. Even with `sub_chaos` at 1.0 (full chaos excitation), output is bounded. **However**: sub-bass frequencies (27-55 Hz at default root) can move speaker cones significantly. Use a high-pass filter on your PA if the venue system is not rated for sub-bass content.

### "All 6 voices + sub play simultaneously at maximum"
This is the normal operating mode. The mix is normalized by the number of active voices. Even worst-case all-voices-max, the `*~ 0.8` stage and `tanh()` limiters keep output below 0dBFS.

### "Someone sends extreme MIDI CC values"
MIDI CC range is 0-127. All parameter mappings have defined ranges (e.g., `root_offset` maps CC 0-127 → -24 to +24 semitones). There is no way to set parameters outside their defined ranges via MIDI.

### "The root frequency is set very low"
Root minimum is 20 Hz. At 20 Hz with `sub_oct -1`, the sub-bass voice plays at ~10 Hz — below audible range but within speaker excursion range. **Use a high-pass filter on your PA** if root < 40 Hz.

---

## Recommended Signal Chain

```
Chaos Resonator → Limiter (safety, -1dBFS ceiling) → EQ (HPF 30Hz for PA) → Mixer/PA
```

This is the same signal chain recommended for any synthesizer. The instrument is no more dangerous than a standard analog synth with a resonant filter.

---

## Latency

- gen~ processing: 1 sample (sub-millisecond)
- Audio driver latency: depends on system settings (typically 5-20ms)
- No internal buffering or lookahead

---

## CPU Usage

Typical: 5-15% on modern hardware (tested on laptop i7/RTX 4090).
Peak: 25-30% with all 5 attractors active in blend mode + 7 waveguides (6 voices + sub) + arpeggiator at 50 Hz.

If CPU spikes, reduce `arp_rate` or switch to `Route` combine mode (processes fewer attractors).

---

## Emergency

**If something sounds wrong, click STOP.** The STOP toggle (`mute` param) applies a 10ms fade-out to prevent clicks, then silences all output. It is always accessible in both patching and presentation modes.

---

*Version 0.1 — Feedback Chaos Resonator v4.2*
