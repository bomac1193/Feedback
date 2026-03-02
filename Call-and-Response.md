# Call-and-Response as Emergent Behavior

> Call-and-response is not a "structure" — it's an emergent phenomenon. In African ensemble music, nobody decides "now I call, now you respond." It arises from the social dynamics of musicians listening to each other. The swarm polyphony engine produces it the same way: from simple rules, not from programming.

---

## The Western Misunderstanding

Western music theory reduces call-and-response to:
- A leads, B answers
- Fixed roles: caller and responder
- Sequential: call finishes, THEN response begins
- Binary: one call, one response

This is wrong. It's the colonizer's transcription of something far more complex.

## What Call-and-Response Actually Is

In Akan, Yoruba, Igbo, Shona, Zulu, Aka, Banda Linda, and hundreds of other musical traditions, call-and-response is:

### 1. Overlapping, Not Sequential

The "response" begins BEFORE the "call" finishes. There is no silence between them. The overlap is the structure. The interlocking IS the music. Arom documented this precisely in Aka polyphony — the voices overlap by 30-60% of the phrase length. The "response" is not an answer — it's a continuation that overlaps.

In the swarm engine: agents don't wait for silence. When one agent triggers a note and moves away (scattering), nearby agents are pulled slightly toward that pitch region (cohesion at distance). They arrive while the first note is still ringing in its resonator. The overlap emerges from the physics of attraction and delay.

### 2. Roles Are Fluid, Not Fixed

In a Yoruba dundun ensemble, the lead drummer (iya ilu) initiates, but any supporting drummer can momentarily become the "caller" through dynamic emphasis. The lead listens as much as they lead. Nketia (1974): "The relationship between the leader and chorus is not one of dominance and submission but of mutual dependence."

In the swarm engine: there is no designated "lead agent." Any agent can become the momentary initiator by virtue of its position and velocity. An agent that moves to an isolated pitch region becomes a "caller" — other agents respond by being pulled toward it (cohesion). But that "caller" is also being pulled back toward the group. Leadership is temporary and emergent. No hierarchy.

### 3. Multi-Layered, Not Binary

Real call-and-response often involves 3, 4, 5+ overlapping layers:
- Lead voice calls
- First chorus responds
- Second chorus responds to the first response
- Instrumental layer provides a counter-call
- Audience participates as another layer

This is not A→B. It's A→B→C→D→A' where A' is already different from A because A has heard B, C, and D.

In the swarm engine: with 200 agents and varying neighborhood sizes, you get multi-layered call-and-response naturally. Agent clusters form "choruses." An agent at the edge of one cluster calls across empty space. The nearest cluster responds. A third cluster, hearing both, responds differently. The number of layers is emergent.

### 4. The Space Between Is Musical

The SILENCE between call and response (when it exists) is not empty — it's charged. It's a held breath. The audience knows the response is coming. In Ewe drumming, the "gap" between the call pattern and response pattern is precisely timed and musically meaningful — it's part of the rhythm, not an absence of rhythm.

In the swarm engine: when separation is high, agents scatter. Notes are sparse. But the listener can HEAR the swarm dynamics — you sense that the agents are being pulled back, that a response is forming. The silence is the tension of cohesion fighting separation. When the next note comes, it lands with the weight of that tension resolved.

### 5. Response Transforms the Call

The response is never a repetition. It comments on, extends, varies, contradicts, or completes the call. Agawu (2003): "Response is a creative act, not an echo."

In the swarm engine: the response is always transformed because:
- Different agent = different resonator timbre (heterogeneous sound ideal)
- Different position in pitch space = different equiheptatonic degree
- Different velocity = different dynamic (louder/softer)
- Different local neighborhood = different harmonic context

The response literally cannot be the same as the call. Transformation is built into the physics.

---

## How the Swarm Produces Call-and-Response

### The Parameter Space

```
CALL-AND-RESPONSE ZONE:
  Cohesion:    0.2 - 0.4  (low-medium: agents attracted but not clustered)
  Separation:  0.5 - 0.8  (medium-high: agents maintain distance)
  Alignment:   0.1 - 0.3  (low: voices move independently)
  Neighborhood: 3 - 8     (small: only nearby agents "hear" each other)
  Max speed:   LOW         (slow melodic movement = sustained notes, space)
```

### What Happens Mechanically

1. Agent A moves to an isolated pitch region (e.g., equiheptatonic degree 5, octave 2)
2. Agent A triggers its resonator. A note sounds in space.
3. Nearby agents B, C, D feel cohesion pull toward A's pitch region
4. But separation keeps them from reaching the SAME pitch — they land on adjacent degrees (4 and 6)
5. Agents B, C, D trigger their resonators. Different timbres, different pitches. The "response."
6. But the response creates a new local density. Agents E, F are now pulled toward the B-C-D cluster.
7. Meanwhile, Agent A has been pushed away by separation from the arriving B-C-D.
8. Agent A is now isolated again. It becomes a new "call" from a different position.
9. The cycle continues. Call-and-response is self-sustaining.

### The Emergent Patterns

With 200 agents in the call-and-response parameter zone, several patterns emerge simultaneously:

**Solo-Chorus Pattern:**
One isolated agent (solo) triggers → nearby cluster responds (chorus). This is the most recognizable call-and-response form. It happens naturally when one agent breaks away from a group.

**Antiphonal Pattern:**
Two clusters on opposite sides of the pitch space alternate. Group A triggers → Group B responds → Group A responds to the response. This happens when the swarm bifurcates (splits into two camps). It's the pattern of two choirs answering each other. Common in East African vocal music.

**Cascade Pattern:**
A note triggers in one region → nearby agents respond → THEIR response triggers agents further away → a wave of notes cascades across the pitch space. This is like a ripple in water. It happens when neighborhood size is small (each agent only hears its immediate neighbors, so the "information" propagates gradually).

**Canonic Pattern:**
An agent's melodic contour (sequence of pitch changes) is followed — with delay — by neighboring agents. This emerges from ALIGNMENT: agents match their neighbor's melodic direction. The result is a canon (round) that nobody composed. The delay comes from the physical time it takes for the alignment force to propagate.

**Fragmented Pattern:**
Many simultaneous micro-calls and micro-responses across the pitch space. No single dominant call. A field of conversing voices. This is the pattern Arom documented in Aka music — many simultaneous interlocking parts, no hierarchy, no single "melody." The most complex and the most beautiful.

---

## Call-and-Response + Kuramoto Rhythm (P3 + P4)

When the Kuramoto rhythm engine (P3) provides the pulse, call-and-response gains RHYTHMIC structure:

```
P3 Kuramoto: provides the WHEN
  - Trigger pulses from coupled oscillators
  - These pulses "seed" moments when agents can trigger notes
  - Between pulses: silence (the charged space)
  - On pulses: notes fire (if agents are at pitch gridlines)

P4 Swarm: provides the WHAT
  - Which agents trigger on which pulse
  - What pitches they're at
  - The call-and-response happens WITHIN the rhythmic framework
  - But the response timing is slightly off the Kuramoto grid
    (because agents don't align perfectly with the pulse)
  - This creates the GROOVE FEEL: some notes land on the grid,
    some float between pulses
```

The result: polyrhythmic call-and-response where the rhythm (Kuramoto) and the melody (swarm) are both emergent but interact. The call might land on a strong Kuramoto pulse. The response might float between pulses. The tension between the two systems IS the groove.

### Performance: Controlling the Call-and-Response

```
SPARSE CALL-AND-RESPONSE (intimate, chamber music):
  P3 K (coupling):  LOW (0.1-0.2, pulses are irregular, non-metered)
  P4 cohesion:      LOW (0.2, agents scattered)
  P4 separation:    HIGH (0.7, wide intervals)
  P4 neighborhood:  SMALL (3-5, local conversations)
  → Individual notes across silence. Kora-like. Mbira-like.
  → 2-3 voices in intimate dialogue.

RHYTHMIC CALL-AND-RESPONSE (groove-based, ensemble):
  P3 K (coupling):  MEDIUM (0.4-0.6, pulse is present but loose)
  P4 cohesion:      MEDIUM (0.4, groups forming)
  P4 separation:    MEDIUM (0.5, moderate spacing)
  P4 neighborhood:  MEDIUM (10-20, section-level coordination)
  → Recognizable call-and-response patterns locked to pulse.
  → Dundun ensemble feel. Multiple rhythmic layers answering.

DENSE ANTIPHONAL (two-choir, massive):
  P3 K (coupling):  HIGH (0.7+, strong pulse)
  P4 cohesion:      HIGH within groups (0.7), LOW between groups
  P4 separation:    HIGH between groups
  P4 neighborhood:  LARGE (50+, agents coordinate in large groups)
  → Two massive clusters alternating. Wall of sound → silence → wall.
  → Gospel choir antiphony. South African isicathamiya.

FRAGMENTED FIELD (Aka polyphony, maximum complexity):
  P3 K (coupling):  MEDIUM-LOW (0.3, pulse suggested but not imposed)
  P4 cohesion:      LOW-MEDIUM (0.3, loose grouping)
  P4 separation:    MEDIUM (0.4, moderate spacing)
  P4 alignment:     LOW (0.1, independent motion)
  P4 neighborhood:  SMALL (5-8, hyper-local interactions)
  → Many simultaneous micro-conversations.
  → No dominant call. A forest of voices.
  → The most complex state. The Arom state.
```

---

## The Sound

### What It Actually Sounds Like

**Sparse call-and-response** (P4 alone, low cohesion, high separation):
A single equiheptatonic note rings from a waveguide resonator — warm, woody, like a large kalimba. Silence. From another part of the pitch space, a different resonator responds — brighter, metallic, a different scale degree. The interval is not major, not minor — it's the 171-cent equiheptatonic step. Unfamiliar but consonant within its own logic. A third voice enters, lower, overlapping with the second. The three voices converse across silence. Each note has weight because it's a physical model resonating, not a sample triggering. The overtones interact. The equiheptatonic intervals create beating patterns between the harmonics — a shimmer that Western equal temperament doesn't produce.

**Rhythmic call-and-response** (P3 + P4, medium coupling):
A Kuramoto pulse establishes a loose groove — not a metronome, a living pulse that breathes. On the pulse: a cluster of agents trigger — three resonators at once, close equiheptatonic degrees, a thick chord. Between pulses: a single agent responds from far away in pitch space — a high, clear tone. Next pulse: the response has pulled agents upward — the cluster has shifted. The chord is different. The groove is constant but the harmonic content evolves with every cycle. This is the Hyperdub track. This is the Atonal moment. Sub bass from the lowest resonator anchoring the pulse, equiheptatonic melody floating above.

**Dense antiphonal** (P3 high K + P4 two clusters):
Two walls of sound alternate. 100 agents clustered at the low end — they trigger together on the Kuramoto pulse. MASSIVE equiheptatonic chord. Then silence (separation pushes them apart). Then 100 agents at the high end respond. Bright, shimmering, crystalline. The alternation is not perfectly regular — the Kuramoto coupling has slight variation. The timing breathes. It's call-and-response at architectural scale. This is the EMPAC 7.1 surround piece — each cluster occupies a different region of the speaker array. The call comes from behind you. The response comes from above.

**Fragmented field** (the Arom state):
Dozens of tiny conversations happening simultaneously. No dominant voice. A note here, a response there, another conversation underneath. The overall texture is dense but translucent — you can hear into it. It's a forest. It's a market. It's the sound of collective life. This is the most complex state and the most beautiful. It requires patience from the audience and rewards deep listening. This is the Unsound set. This is the PAN Records album.

---

## Why Call-and-Response Is the Core of the Whole Practice

It's not just a feature of P4. Call-and-response is the THESIS:

| Project | Call | Response |
|---------|------|----------|
| P1 (Feedback) | The system outputs sound | FluCoMa analyzes → parameters change → the system responds to itself |
| P2 (Corpus) | The archive speaks (corpus segment plays) | The resonator responds (physical model transforms it) |
| P3 (Rhythm) | One oscillator fires | Others are pulled into sync (or resist) — rhythmic call-and-response |
| P4 (Polyphony) | An agent triggers a note | Neighboring agents respond with their own notes |
| **You (performer)** | You change a parameter | The system responds. You respond to the response. |
| **The audience** | They listen | The system hears the room (if using microphone feedback in P1) |

Every layer is call-and-response. The instruments call to each other. You call to the instruments. The audience's presence is a call the room responds to. It's call-and-response all the way down.

**The one-line pitch for the whole practice:**

> "Four instruments that call and respond — to themselves, to each other, to African musical principles, to the room, and to you."

---

## The Musicological Depth

### Why This Matters Beyond Music

Call-and-response is not just a musical technique. In African philosophical and social contexts, it's a model of community:

- **Ubuntu** ("I am because we are"): The self exists through relationship. A call without response is incomplete. An agent without neighbors is silent. Music, identity, community — all require the other.

- **Sankofa** (go back and get it): The response reaches back to the call, transforms it, brings it forward. The swarm's cohesion force IS sankofa — agents reach back toward each other.

- **Nommo** (the power of the word): In Dogon philosophy, speech creates reality. The call brings something into existence. The response affirms it. In the swarm: the first note creates a region of pitch space that didn't exist as music until it was sounded. The response confirms it as musical.

These are not metaphors grafted onto the technology. The swarm dynamics ENACT these principles. Cohesion IS ubuntu. Reaching back IS sankofa. The first note IS nommo. The technology and the philosophy are isomorphic.

### The Grant Pitch Version

> "This project investigates call-and-response not as a musical 'structure' to be replicated but as an emergent social phenomenon to be computationally modeled. Drawing on Arom (1991), Agawu (2003), and Wilson (1992), the swarm polyphony engine implements call-and-response as a property of collective behavior in equiheptatonic and equipentatonic tuning systems. The resulting instrument produces polyphonic music that is neither composed nor random — it is emergent, embodying the communal generative principles that underlie African ensemble performance. The work contributes to both creative practice (albums, performances, installations) and musicological research (computational modeling of African musical systems)."

### Reading List (Essential)

| Author | Work | Why It Matters |
|--------|------|---------------|
| Simha Arom | *African Polyphony and Polyrhythm* (1991) | The science. Proves complex polyphony from simple rules. Central African Republic. |
| Kofi Agawu | *Representing African Music* (2003) | The critique. Why Western analysis fails. How to think about African music on its own terms. |
| Gerhard Kubik | *Africa and the Blues* (1999), *Theory of African Music* (2010) | Tuning systems. Proves equiheptatonic/equipentatonic are precision systems. |
| J.H. Kwabena Nketia | *The Music of Africa* (1974) | The foundation. Overview of structures across the continent. |
| Olly Wilson | "The Heterogeneous Sound Ideal" (1992) | Timbral contrast in ensemble. Why each voice should sound DIFFERENT. |
| Akin Euba | *Yoruba Drumming* (1990) | Talking drum. Pitched percussion. Melody from rhythm. |
| Steven Strogatz | *Sync* (2003) | Coupled oscillator science. Accessible. Why things synchronize. |
| Craig Reynolds | "Flocks, Herds, and Schools" (1987) | The boids paper. Three rules → complex collective behavior. |
| Mark Butler | *Unlocking the Groove* (2006) | Rhythm analysis for electronic music. Bridges academic and practice. |

---

## Visualization: Call-and-Response in TouchDesigner

```
PRIMARY VIEW: "The Conversation"

  - Black background. Points of light = agents.
  - When an agent triggers a note: BRIGHT FLASH at its position.
  - Flash sends a visible RIPPLE outward (concentric circle).
  - When the ripple reaches another agent AND that agent triggers:
    a LINE draws between them (call → response connection).
  - Lines fade over 2-3 seconds.
  - The audience SEES the conversation topology:
    who is calling, who is responding, how the conversation spreads.

  SPARSE state: occasional flashes, single lines across dark space.
  DENSE state: constant flashes, web of interconnected lines. A neural network firing.
  ANTIPHONAL: two bright clusters alternating, thick lines between them.
  FRAGMENTED: many dim flashes, short local lines, a buzzing network.

SECONDARY VIEW: "The Breath"

  - A single curve that represents the GROUP DYNAMICS over time.
  - X axis = time (scrolling).
  - Y axis = average inter-agent distance (spread vs. cluster).
  - When the curve rises: scattering. Agents separating. Calls go out.
  - When the curve falls: clustering. Agents converging. Responses arriving.
  - The oscillation of this curve IS the breathing of the call-and-response.
  - Slow breathing = spacious, meditative.
  - Fast breathing = urgent, dense.
  - The performer can see this and respond to it.

COMBINED P3+P4 VIEW: "The Organism"

  - P3 Kuramoto ring in the center (rhythm).
  - P4 swarm particles orbiting around it.
  - Kuramoto trigger pulses radiate outward as rings of light.
  - Swarm agents flash when they trigger.
  - Call-response lines connect agents.
  - The whole system looks like a living organism:
    heartbeat (P3) pumping energy into a network (P4)
    that converses with itself.
```

---

## Implementation Priority for Call-and-Response

The call-and-response behavior should be the FIRST thing you tune when building P4. Before dense chords, before parallel sweeps — get the sparse conversational state working. Because:

1. It's the most immediately compelling sound (single notes across silence = anyone can hear it)
2. It validates the swarm model (if call-and-response doesn't emerge, something's wrong)
3. It's the most recordable state (PAN Records 15-min demo = sparse call-and-response in equiheptatonic tuning)
4. It's the most visually clear (flashes and lines on black = clean, striking)
5. It's the most conceptually communicable ("the instruments are having a conversation")

### First Test

```
Build the swarm with just 6-10 agents (not 200).
Set: cohesion LOW, separation HIGH, alignment LOW.
Each agent triggers a DIFFERENT waveguide resonator
  tuned to a DIFFERENT equiheptatonic degree.
Run it.
Listen.
You should hear: individual notes ringing, answering each other,
  sometimes overlapping, sometimes with space between.
If you hear this: the system works. Scale to 200 agents.
If you don't: adjust separation/cohesion until you do.
```

---

*This document is part of the [Approaches.md](./Approaches.md) practice documentation.*

*Last updated: 2026-03-01*
