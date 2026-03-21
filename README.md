# Feedback

Six Kuramoto coupled oscillators driven by Vodou veve adjacency matrices, exciting Karplus-Strong resonators tuned to African tuning systems. Visualization via GLSL in TouchDesigner.

## Thesis

Veve are cosmograms. They encode topology — which forces connect to which — not pictures. This instrument uses that topology as its core musical parameter: the adjacency matrix of a veve determines which oscillators couple, and coupling determines synchronization, which determines what you hear.

When oscillators lock phase, energy flows through the connection and the resonator rings. When they drift apart, the connection vibrates at the beat frequency and the string decays. The tuning system sets the intervals. The topology sets the relationships. The performer controls coupling strength, root frequency, decay, and drive.

Nothing is mapped symbolically. The visualization shows what the system is doing: phase alignment as line brightness, phase difference as vibration rate, connection length as thickness, root frequency as circle size and line weight. White on black. The veve's structure operates directly — it is not illustrated.

## Architecture

```
Max/MSP                          TouchDesigner
─────────                        ─────────────
gen~ (Kuramoto oscillators)      oscinCHOP (port 7000)
  6 oscillators                    ↓
  19 tuning systems              GLSL TOP (veve_viz)
  7 veve topologies                phase → brightness
  ↓                                alignment → line thickness
gen~ (KS resonators)               root → circle size + line weight
  6 heterogeneous strings          decay → trigger sharpness
  decay, drive, root               ↓
  ↓                              Output
node.script (osc_send.js)
  UDP OSC → port 7000
```

**OSC channels**: `/kuramoto/phases` (6 floats), `/kuramoto/r` (order parameter), `/veve/preset`, `/resonator/decay`, `/root/freq`

## Parameters

| Parameter | Range | Effect |
|-----------|-------|--------|
| Veve | 7 presets | Topology — which oscillators couple |
| K (coupling) | 0-1 | Synchronization strength. Sweet spot 0.3-0.7 |
| Root | 55-880 Hz | Base frequency. Low = large circles, thick lines. High = small, thin |
| Tuning | 19 systems | Interval ratios between the 6 oscillators |
| Decay | 0-1.5 | KS feedback coefficient. Low = percussive flash. High = sustained drone |
| Drive | 0-1 | Excitation energy into resonators |

## Physical Build

The instrument is designed for physical vibration, not conventional speakers. Six channels of audio should be felt on a surface, not projected into air.

### Recommended: Tactile Transducer Array

Mount 6 tactile transducers on a resonant surface. Each transducer corresponds to one oscillator. Their physical positions should mirror the veve topology — the spatial arrangement IS the veve.

**Transducers** (per unit, need 6):
- Dayton Audio TT25-16 (25W, clean for KS tones, ~$10 each)
- Clark Synthesis TST329 Gold Transducer (higher fidelity, ~$80 each)
- Rolen Star RS-24B (wide bandwidth, ~$90 each)

**Amplification**:
- 6-channel amp: Dayton Audio MA1240a (12-channel, bridgeable) or 3x stereo amps
- Per-channel power: 20-50W sufficient for transducers on resonant surface

**Surfaces** (the surface IS the instrument):
- Hardwood panel (oak, maple) — 18mm+, warm resonance, sustain
- Sheet metal (steel, brass) — 1-3mm, bright, metallic harmonics, short decay
- Glass panel (tempered, 6mm+) — crystalline, fragile aesthetically and literally
- Gourd/calabash — traditional, curved resonance, uneven harmonics
- Concrete slab — heavy, subharmonic emphasis, brutalist

**Mounting**: Bolt transducers directly to surface underside. Isolation feet (sorbothane pads) underneath to decouple from floor/table. Surface should be free to vibrate — don't clamp edges unless you want nodal damping.

**Wiring**: 6-channel audio interface (e.g. MOTU UltraLite, Focusrite 18i8) → 6-channel amp → 6 transducers. Route each Max output channel to one transducer.

### Alternative: Spatial Speaker Array

6 small full-range speakers (Genelec 8010, Auratone 5C, or DIY 3" drivers in sealed boxes) arranged in the veve topology pattern. Suspended or mounted on stands. Less visceral than transducers but more conventional monitoring.

### Minimal: Stereo + Sub

Standard stereo monitoring works for development. The spatial and haptic dimensions are lost but the tonal and rhythmic content is preserved.

## Requirements

- Max/MSP 9 (gen~, node.script)
- TouchDesigner (GLSL TOP, oscinCHOP)
- Node.js (for osc_send.js via node.script)

## Files

```
max/
  feedback_veve.maxpat     Main patch
  kuramoto_veve.genexpr    Kuramoto oscillator engine
  kuramoto_veve.gendsp     gen~ patcher wrapper
  resonator_ensemble.gendsp KS resonator bank
  veve_loader.js           Preset loader
  osc_send.js              OSC bridge to TouchDesigner
  max_mcp*.js              MCP bridge (Claude ↔ Max)
td/
  build_veve_viz.py        TD network builder
```

## Usage

1. Open `feedback_veve.maxpat` in Max
2. DSP turns on automatically (ezdac~)
3. OSC starts sending after 1 second (loadbang → delay → metro)
4. Open TouchDesigner project with veve_viz network
5. Adjust veve, coupling, root, tuning, decay, drive
