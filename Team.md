# Team — Feedback Chaos Resonator

## Current: Solo (You)
Design, gen~ DSP, build tooling, Max patching, strategy.

---

## Roles to Recruit

### 1. Ethnomusicology Advisor (Olumide archetype)
**Why**: The tuning data IS the product moat. Pythagorean approximations aren't good enough — a researcher who has measured real dundun intervals with a spectrometer validates the entire thesis. Without this person, D3 (appropriation critique) and D8 (traditional musician critique) are unanswered.

**Profile**:
- Academic at a West African university (OAU, University of Ghana, Makerere)
- Active research in computational ethnomusicology or organology
- Publishes on tuning systems, preferably with frequency measurements
- Comfortable with Max/MSP or Python (can verify the data, not just theorize)

**What they do**:
- Audit and correct all 19 tuning tables against measured data
- Add provenance (which source, which transcription method, which region/ensemble)
- Design the per-degree flex system (v2) based on real performance practice
- Co-author any academic paper or cultural documentation
- Named credit: "Tuning systems verified by [Name], [University]"

**Compensation**: Co-authorship credit, advisory equity (0.5-1%), honorarium per tuning audit session.

**Where to find**: NIME conference attendees, ISMIR, SEM (Society for Ethnomusicology), direct outreach to West African music departments.

---

### 2. African Electronic Scene Connector (Ras/Zinhle archetype)
**Why**: You need someone embedded in Lagos/Nairobi/Joburg/Durban electronic scenes who can put this in the hands of the beachhead and translate between your engineering language and their musical needs.

**Profile**:
- Active DJ/producer in Afro-electronic scenes
- Uses Ableton/Max or willing to learn
- Connected to venues, labels, collectives (e.g., Nyege Nyege, Boiler Room Africa, Gqom Oh!)
- Can demo the instrument on stage — walking proof of concept

**What they do**:
- Beta test in real performance contexts
- Translate "the sub-bass 0.8 cap is too polite" into specific parameter changes
- Introduce beachhead users (the 5-8 first adopters)
- Provide Kuduro/Batida/Gqom/Singeli patterns for pattern library expansion
- Content: performance videos, tutorials, social proof

**Compensation**: Free instrument + early access, revenue share on contributed patterns, named credit.

**Where to find**: Nyege Nyege Festival, CTM Berlin African electronic showcases, Boiler Room Africa sets, direct DM on Instagram/SoundCloud.

---

### 3. Max/MSP Performance UI Designer (D4 response)
**Why**: 400+ boxes is an engineer's instrument. The beachhead will tolerate it. Everyone else won't. You need someone who can build a presentation mode interface (8-10 controls) that sits on top of the gen~ engine.

**Profile**:
- Max/MSP visual designer (presentation mode, bpatchers, custom UI objects)
- Experience shipping instruments (maybe worked at Cycling '74, Ableton, or has M4L devices on maxforlive.com)
- Understands performer UX — what a dancer needs vs. what a sound designer needs

**What they do**:
- Design presentation mode overlay: 8-10 macro controls
- Build M4L wrapper (this is the single biggest distribution unlock)
- Design preset browser with categories
- Create onboarding flow (guided first 5 minutes)

**Compensation**: Contract ($3-5k for M4L wrapper + presentation mode), credit, revenue share on M4L distribution.

**Where to find**: maxforlive.com top contributors, Cycling '74 forums, IRCAM alumni, Kadenze Max courses.

---

### 4. Cultural Documentation Writer (D3 + D8 + #37-38 response)
**Why**: Before anyone asks "is this appropriation?", the answer needs to be written, published, and linked from the instrument itself. This isn't a README — it's a cultural context document with citations, framing, and acknowledgments.

**Profile**:
- Writer with music/cultural studies background
- Understanding of African musical traditions (not generic "world music" framing)
- Can write for both academic and general audiences
- Ideally African or African diaspora — authentic voice matters here

**What they do**:
- Write cultural context document (shipped with instrument)
- Citation list for all tuning data, pattern transcriptions, frequency references
- "Inspired by / Not a simulation of" framing language
- Artist acknowledgment template
- Review all marketing copy for cultural sensitivity

**Compensation**: Writing fee ($1-2k), named credit, ongoing review retainer.

**Where to find**: Music journalism (Resident Advisor Africa, OkayAfrica, The FADER), ethnomusicology MA/PhD programs, African music critics.

---

### 5. Hardware/Embedded Developer (Daniel/Zinhle archetype — future)
**Why**: If the TAM analysis says "go hardware" (Eurorack/Daisy/Norns), you need someone who can port gen~ DSP to C++ or SuperCollider. This is a Phase 2 hire after the Max instrument is validated.

**Profile**:
- C++/Rust developer with DSP experience
- Familiar with Daisy (Electrosmith), Norns (monome), or Eurorack module design
- Can translate gen~ codebox to optimized C++ (the math is portable)
- Bonus: RNBO experience (direct Max → embedded pipeline)

**What they do**:
- Port chaos attractor + waveguide engine to Daisy/Norns
- Design hardware UI (knob-per-function, 8HP Eurorack, or Norns screen interface)
- Optimize for real-time on ARM (Cortex-M7 for Daisy, Raspberry Pi for Norns)

**Compensation**: Contract ($5-10k per platform port), revenue share on hardware sales.

**Where to find**: Electrosmith Discord, monome lines community, Mutable Instruments open-source contributors, KVR Audio developer forums.

---

## Recruitment Priority

| Priority | Role | When | Why Now |
|----------|------|------|---------|
| 1 | Ethnomusicology Advisor | Immediately | Validates the core IP before any public release |
| 2 | Scene Connector | Before beta | Puts instrument in beachhead hands |
| 3 | Cultural Documentation Writer | Before beta | Answers D3/D8 before they're asked |
| 4 | Performance UI Designer | After beta validation | Unlocks M4L and broader adoption |
| 5 | Hardware Developer | After M4L proves demand | Expands TAM to hardware market |

---

## Advisory Board (Non-Team, Non-Compensated Beyond Credit)

These are relationships to cultivate, not hires:

- **University of Lagos / OAU music faculty** — tuning validation
- **Nyege Nyege collective** — East African electronic scene access
- **Cycling '74 developer relations** — M4L distribution, RNBO guidance
- **Drake Music (UK)** — adaptive/accessible music technology
- **Monome community leaders** — Norns port guidance
