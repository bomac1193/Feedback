# Feedback — Performance Equipment Options

## Current Setup
- **Elektron Analog Rytm** — MIDI clock source, BPM sync, unmute/mute on start/stop
- **Max patch** — 12 MIDI-learnable CC params, 5 attractors, 19 tunings, 6 veve presets
- **TouchDesigner** — Gerdes lusona + Chladni cymatics via OSC from Max

---

## Controllers

### Faderfox EC4 (~$300) — RECOMMENDED
- 16 push-encoders, palm-sized, bus-powered USB
- Encoders = infinite turn, no start/end position. No value-jump problem
- Push-click for discrete selection (attractor, combine mode, tuning)
- Map: 12 encoders → MIDI learn params, 4 push-encoders → discrete switches
- Best for chaos params where sweet spots shift constantly depending on attractor/tuning combo
- Sits beside Rytm on small table/podium

### Faderfox MX12 (~$400)
- 12 faders + 12 encoders. More traditional layout
- Faders for "known" params (gain, mix, brightness), encoders for chaos params (rho, sigma, beta)
- Bigger footprint than EC4

### Novation Launch Control XL (~$170)
- 24 knobs + 8 faders + buttons
- Pots have hard stops (0–127) — value jumps when you touch a knob after preset change
- Workaround: smooth with `line` objects in Max on the receiving end
- Good mid-budget option. More controls than nano, better build

### Korg nanoKONTROL2 (~$60) — BUDGET PICK
- 8 faders + 8 knobs + buttons
- Tiny plastic knobs, minimal resistance — fine for studio, less ideal for blind live reaching
- Same hard-stop jump problem as Launch Control
- Gets you performing immediately. Upgrade later once you know which params matter live

---

## Gesture Controllers

### Genki Wave (~$300) — BEST GESTURE OPTION
- Ring form factor, 6DOF (acceleration + gyroscope all axes)
- BLE-MIDI, low latency, built for music
- Map: hand height → chaos_gain, wrist tilt → rho, finger roll → blend_mix, shake → trigger tuning change
- Invisible tech, maximum theatre. Best-in-class for wearable music control
- Secondary controller (finite axes — good for 3-4 params, not 12)

### Playtronica Orbita (~$200)
- Wearable ring. Accelerometer + gyroscope
- MIDI CC from hand tilt, rotation, shake intensity
- Wave hand over audience, chaos responds. Invisible tech
- 3 axes only — good for 3 params, not 12
- Conceptually strong: spiritual gesture → machine response

### Leap Motion Controller 2 (~$100)
- Hands-free gesture in air. Hand height/tilt/spread mapped to params
- Visually dramatic — audience sees you "sculpting" sound
- No haptic feedback, some latency, imprecise. Better as secondary expressive layer

### Contact Mic on Body (~$20) — CONCEPTUALLY STRONGEST
- Piezo on chest/throat → amplitude envelope drives chaos_gain
- Hum, breathe, tap chest → system responds to your body
- Max chain: `adc~` → `peakamp~` → `scale` → `s toGen` with `chaos_gain $1`
- Feedback system feeds back from your body. No visible tech. Audience sees you breathing and lusona unfolds
- Limited to amplitude + maybe pitch tracking (1-2 params)

---

## Recommended Combos

### $60 — Start Now
nanoKONTROL2 + contact mic on body. Knobs for 12 params. Body drives chaos_gain. Perform next week.

### $350 — Full Setup
Faderfox EC4 + Genki Wave ring. EC4 = desk (precise, every param). Wave = stage (3 chaos params via gesture for dramatic moments). Switch between mid-performance.

### $80 — No Extra Gear
Contact mic + Rytm pads. Use Rytm's 12 knobs (performance mode) to send CCs to chaos resonator while drumming the rhythm that clocks it. Drummer IS the chaos controller. Demands serious performance chops.

---

## Skip List
- **MIDI keyboard** — not playing notes, Kuramoto oscillators generate pitch from chaos
- **Grid controllers** (Launchpad, Push) — grid implies quantized regular structure, fights the continuous chaos + African tuning irregularity
- **Expensive motion capture** (Myo armband, full mocap) — over-engineered for 12 continuous params + switches
