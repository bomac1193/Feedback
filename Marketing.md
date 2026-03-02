# Marketing — Feedback Chaos Resonator

---

## Positioning: Luxury Rare Instrument

**Frame**: This is a Monomachine, not a Serum. A Lyra-8, not a Massive. A Ciat-Lonbarde instrument, not a Splice pack.

**Why luxury/rare works**:
- The chaos-to-waveguide topology is genuinely novel (D2 admits this even while critiquing)
- African tuning systems validated by ethnomusicology research = provenance = value
- Real-time gen~ DSP = you can't pirate the *feel* of playing it live
- The beachhead (Afro-experimental performers) already operates in "rare instrument" culture — they collect Soma Lyra-8s, Ciat-Lonbarde Cocoquantus, vintage Roland x0x boxes
- Scarcity creates desire: "only works in Max" becomes a feature, not a bug (for now)

**Why luxury/rare beats "works in FL Studio"** for launch:
- FL Studio users (D10, DJ Lag) want $29 plugins. The engineering cost of VST wrapper is $5-10k minimum.
- Luxury positioning lets you charge $99-249 for a Max device and people respect it
- You can always move downmarket later (M4L → VST). You can never move upmarket from $0/free.
- Soma Pulsar-23 is $1,400. Monomachine sells used for $2,000+. The market exists.

**The one-sentence pitch**:

> "A live instrument that turns your body movements into music tuned to African scales — the harder you push, the farther it bends, and it always finds its way home."

**Backup pitches by audience**:
- For electronic musicians: "5 chaos attractors excite 6 waveguide resonators through 19 African tuning systems. In real-time."
- For journalists (D6): "It's a performance instrument. Think: West African string theory."
- For academics: "Computational ethnomusicology meets nonlinear dynamics in a real-time synthesis engine."
- For dancers: "One MIDI fader. Six voices. The spring brings you home."

---

## Pricing Tiers (Stress-Tested)

| Tier | Price | What | Who |
|------|-------|------|-----|
| **Instrument** | $149 | Max patch + 19 tuning systems + all patterns + spring root + chaos outputs | Beachhead, power users |
| **M4L Device** | $79 | Simplified 8-control Ableton device (when built) | Ableton producers |
| **Expansion Packs** | $29 each | Additional tuning systems (Raga, Gamelan, user-submitted), pattern packs (Kuduro, Singeli) | Existing users |
| **Academic License** | Free | Full instrument, requires .edu email | Students, researchers |
| **Hardware Module** | $299-449 | Daisy/Eurorack (when built) | Hardware community |

**Why not free/open-source?**
- The tuning data has real research value. Giving it away devalues the ethnomusicology work.
- Free instruments get downloaded and forgotten. Paid instruments get used.
- Open-source the *engine* (gen~ codebox) later if you want community contributions. Keep the *instrument* (UI, tunings, patterns, presets) as the product.

---

## Critic-Driven Documentation Strategy

Every critic (D1-D10) reveals a documentation gap. Turn their objections into preemptive content:

### From D2 (Synthesis purist: "chaos is just noise")
**Content**: Technical paper/blog post — "Why Chaos Attractors Produce Different Excitation Than Filtered Noise"
- Show spectral analysis: Lorenz vs white noise → bandpass, same frequency range
- Demonstrate: Lorenz has temporal correlations (deterministic), noise doesn't
- The waveguide responds differently to correlated vs uncorrelated excitation
- Include audio examples: A/B test, identical waveguide, chaos vs noise excitation
**Format**: Blog post with embedded audio, also submitted to NIME or AIMC

### From D3 (Cultural gatekeeper: "this is appropriation")
**Content**: Cultural Context Document (shipped WITH the instrument, not hidden in a README)
- "What this instrument is": A new instrument inspired by West African tuning principles
- "What this instrument is NOT": A simulation of dundun, balafon, or any specific instrument
- Full citation list: Akinbo 2019, Agawu, Nzewi, Kubik, specific papers per tuning system
- Acknowledgments: Name the ethnomusicology advisor, the scene connectors, the cultural reviewers
- "How to use responsibly": Context for each tuning system — what tradition it comes from, what it means
**Format**: PDF/markdown document, also a section in the Max patch help file

### From D4 (UX designer: "incomprehensible")
**Content**: Onboarding Guide — "Your First 5 Minutes"
- Step 1: Turn on ezdac (with screenshot)
- Step 2: Choose a preset from Zone C (one click = sound)
- Step 3: Twist the root offset fader (feel the spring)
- Step 4: Try a different tuning system
- Step 5: Connect your MIDI controller
**Format**: In-patch walkthrough (using Max's built-in tutorial system) + video

### From D6 (Journalist: "what genre is this?")
**Content**: Press Kit
- One-sentence pitch (above)
- 3 paragraphs: what it is, who it's for, why it matters
- 5 audio examples (30 seconds each): gqom sub-bass drone, Yoruba-tuned arpeggio, chaos texture for film, spring root performance, dual-attractor blend
- 3 high-res images: the patch, a performer using it, the tuning system diagram
- Comparison: "If [Mutable Instruments Rings] is a resonator controlled by Eurorack, this is a resonator controlled by chaos mathematics and African tonality"
**Format**: Notion page or static site, shareable URL

### From D7 (Live sound engineer: "this is a liability")
**Content**: Technical Safety Document
- "Maximum output level": tanh() saturates at +/- 1.0, master_gain scales, *~ 0.8 in audio chain. Worst case: 0dBFS.
- "What happens when the attractor diverges": It doesn't. Lorenz is bounded. All attractors are clamped. History variables are clamped.
- "What if chaos_gain is set to maximum": tanh() in the waveguide feedback loop self-limits. Distortion, not blowout.
- "Recommended signal chain": Instrument → limiter → PA. Same as any synth.
**Format**: One-page PDF, also in the Max patch [p safety_info] subpatcher

### From D8 (Traditional musician: "doesn't replace real instruments")
**Content**: Positioning Statement (woven into Cultural Context Document)
- "This instrument does not model specific African instruments"
- "It uses tuning principles from African musical traditions as a starting point for new sounds"
- "The best way to hear dundun is to hire a dundun player. This instrument creates sounds that don't exist yet."
**Format**: Part of Cultural Context Document, also in press kit

### From D9 (Max beginner: "can't learn from this")
**Content**: Tutorial Series — "Build a Chaos Resonator from Scratch"
- Episode 1: One waveguide resonator in gen~ (20 lines)
- Episode 2: Lorenz attractor as excitation source
- Episode 3: Tuning tables (start with Yoruba Pentatonic)
- Episode 4: Arpeggiator basics
- Episode 5: Adding the spring root system
- Episode 6: The full instrument (how all pieces connect)
**Format**: Video series + companion patches (step1 through step6 — you already have these!)

### From D10 (Budget musician: "Max costs $400")
**Content**: Alternatives Page
- "Try it free": Max has a 30-day trial. The patch works in the trial.
- "M4L version": Coming Q2 (Ableton Suite includes Max4Live)
- "Free alternatives": Link to Pure Data resources, SuperCollider resources
- "Hardware version": Coming (Daisy port — standalone, no computer needed)
- Frame the Max cost as an investment, not a barrier: "Max is a platform, not a plugin host"
**Format**: FAQ section on product page

---

## Distribution Channels

| Channel | Audience | Priority |
|---------|----------|----------|
| Direct (your site) | Beachhead, word-of-mouth | Phase 1 |
| maxforlive.com | Ableton producers (when M4L ready) | Phase 2 |
| Gumroad / Payhip | General electronic musicians | Phase 1 |
| NIME / ISMIR paper | Academic community | Phase 1 (free academic license + paper) |
| YouTube demos | Discovery | Phase 1 |
| Cycling '74 Package Manager | Max users | Phase 2 |
| Modular Grid (listing) | Hardware community (when Eurorack ready) | Phase 3 |

---

## Launch Sequence

1. **Week 1-2**: Cultural Context Document + tuning citations complete
2. **Week 2-3**: Onboarding video + press kit
3. **Week 3**: Private beta to 5-8 beachhead users (free)
4. **Week 4-6**: Incorporate beta feedback, fix bugs
5. **Week 6**: Public launch at $149 (Max patch) + free academic license
6. **Week 8+**: M4L device development begins
7. **Week 12+**: First expansion pack (user-contributed tunings)

---

## Content Calendar (First 8 Weeks Post-Launch)

| Week | Content | Channel |
|------|---------|---------|
| 1 | Launch announcement + 90sec demo video | YouTube, Instagram, X |
| 2 | "Why Chaos Attractors, Not Oscillators" (D2 response) | Blog |
| 3 | Beachhead artist performance video | YouTube, shared by artist |
| 4 | "19 African Tuning Systems Explained" (tuning deep-dive) | Blog + YouTube |
| 5 | "Building a Chaos Resonator from Scratch" Ep 1 | YouTube |
| 6 | Artist interview: how they use it live | Blog/podcast |
| 7 | Pattern pack teaser (Kuduro, Singeli) | Instagram |
| 8 | Spring root + MIDI controller demo (dancer focus) | YouTube, TikTok |
