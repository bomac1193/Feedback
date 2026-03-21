# Agentic Directions

> Future directions for AI agent integration with the Feedback instrument (Max/MSP gen~).

---

## 1. Attractor Discovery Agent

**Status: IMPLEMENTING**

An agent that sweeps the parameter space of all 5 attractors programmatically, records which parameter combinations produce "musical" output (using spectral analysis to detect pitched content vs noise ratio), and builds a map of sweetspots that you can navigate as a performance surface. No more hunting for good settings.

**How it works:**
- Systematically samples parameter combinations for each attractor
- For each combination, runs the attractor equations and analyzes the output signal
- Classifies output as: pitched (periodic orbit), chaotic-musical (structured chaos), noise (flat spectrum), or silent (convergent/dead)
- Builds a multi-dimensional map of sweetspots
- Exports the map as presets or a navigable surface for live performance

---

## 2. Self-Writing gen~ Patches

An agent that listens to the output via FluCoMa analysis, evaluates it against your taste vector (from Clarosa), and rewrites the gen~ codebox in real-time. The patch evolves toward sounds you like. Genetic algorithms on DSP code.

**Key idea:** The fitness function is YOUR taste. The agent doesn't optimize for "interesting" in the abstract — it optimizes for what YOU find musical, using your Visual/Audio DNA as the objective function.

---

## 3. Live gen~ Code Injection

During a performance, describe what you want ("darker, more sub, less metallic") and the agent rewrites resonator coefficients, chaos_gain, brightness, tuning system in real-time. Voice-to-DSP.

**Implementation path:**
- Speech-to-text (Whisper via Modal)
- Text-to-parameter mapping (Claude)
- Parameter injection via `[s toGen]` send chain
- Latency target: < 2 seconds from spoken word to parameter change

---

## 4. Corpus-Driven Attractor Navigation

Use the PERI/RAVE model in nn~ to encode your corpus, then map the Lorenz xyz to positions in the RAVE latent space. The chaos attractor literally navigates through your sound identity. Your timbre IS the attractor trajectory.

**Signal chain:**
```
Lorenz xyz → scale to RAVE latent dims → nn~ decode → excitation signal
```

The attractor doesn't just excite resonators — it navigates your personal sonic space. Periodic orbits = loops through familiar timbres. Chaotic regimes = exploration of liminal timbral zones.

---

## 5. Multi-Agent Max Patchers

Multiple Claude agents each controlling different sections of the patch simultaneously. One agent handles rhythm (arp patterns), another handles timbre (attractor params), another handles structure (fade between tuning systems). They negotiate via shared state. An AI ensemble.

**Architecture:**
- Agent 1: Rhythm (arp_mode, arp_bpm, pattern selection)
- Agent 2: Timbre (att_sel, chaos_gain, rho, brightness)
- Agent 3: Structure (tuning_system, root, transpose, register)
- Shared state: FluCoMa analysis of combined output
- Negotiation: each agent sees what the others are doing and adjusts

---

## 6. Feedback Between Claude and FluCoMa

The feedback loop from Phase 3 of the roadmap, but instead of fixed mappings (loudness to rho), an agent learns the mappings dynamically. It observes what mapping produces the most interesting behavior and adjusts the routing in real-time.

**Key difference from fixed feedback:** The mapping itself evolves. Monday the system learns that centroid-to-brightness creates self-correction. Tuesday it discovers that pitch-confidence-to-chaos_gain creates more interesting behavior. The instrument's self-regulation strategy is itself emergent.

---

## 7. Live Patching

An agent that creates and wires Max objects during a performance. Not just parameter changes — actually adding new gen~ objects, new signal chains, new routing. The instrument architecture evolves mid-performance.

**Implementation:** Max's `thispatcher` scripting interface allows programmatic object creation and connection. An agent could:
- Add/remove resonator voices
- Insert effects (delay, reverb, granular) into the signal chain
- Create new feedback paths
- Wire OSC outputs to TouchDesigner

---

## Priority Order

1. **Attractor Discovery Agent** (immediate — sweetspot mapping)
2. **Live gen~ Code Injection** (next — voice control of parameters)
3. **Corpus-Driven Attractor Navigation** (when PERI model is ready at 500k+ steps)
4. **Feedback Between Claude and FluCoMa** (Phase 3 of roadmap)
5. **Multi-Agent Max Patchers** (experimental)
6. **Self-Writing gen~ Patches** (research)
7. **Live Patching** (advanced)

---

*Part of the Feedback instrument system.*
*Last updated: 2026-03-11*
