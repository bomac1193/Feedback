# LoRA Vault: opportunity summary

The thesis, pain points, market sizing, and why-now for an artist-first AI licensing platform built on top of Vaulted + Boveda + Imperium.

Written 2026-04-30. Revisit quarterly.

---

## 1. The one-line thesis

Selling LoRA files is a race to the bottom. Owning the **infrastructure that licenses, gates, watermarks, and settles royalties on AI weights** is a generational business. We already own 70% of that infrastructure (Vaulted + Boveda + Imperium + Gobbi). Closing the gap is a ~6 week build.

---

## 2. Pain points, ranked by willingness to pay

### Tier 1: enterprise tier (highest budgets, most acute pain)

| # | Pain | Who feels it | Current "solution" | Pays |
|---|---|---|---|---|
| 1 | **Brand-safe AI is unsolved.** Marketing leaders can't deploy generative AI internally because legal won't sign off on training-data provenance | Fortune 500 CMOs, ad agencies | Adobe Firefly's "trained on Adobe Stock" pitch (incomplete) | $$$$ |
| 2 | **No provenance for AI weights.** No way to prove a LoRA was trained on consented data. Compliance officers say no | Pharma, finance, regulated industries | Avoid generative AI entirely (lost productivity) | $$$$ |
| 3 | **Identity theft via deepfake LoRAs.** Anyone can train a face LoRA from public photos. Public figures live in fear | Athletes, musicians, actors, models | Lawsuits after the fact, never prevention | $$$$ |
| 4 | **No royalty rails.** When a brand uses an artist's style in 1,000 generated assets, the artist gets paid for zero | Independent artists, IP rights holders | Manual licensing deals (slow, leaky) | $$$ |

### Tier 2: creator + studio tier

| # | Pain | Who feels it | Current "solution" | Pays |
|---|---|---|---|---|
| 5 | **Style consistency at scale.** Brands want every campaign asset to feel coherent across 50+ pieces | Ad agencies, DTC brands | Repeat photo shoots, hire same retoucher | $$$ |
| 6 | **Misuse detection is manual.** When a LoRA leaks, owner can't find derived content automatically | Anyone with a face/voice LoRA | Google reverse search by hand | $$ |
| 7 | **Discovery is broken.** Buyers can't find quality LoRAs without sifting through Civitai trash | Production studios, indie filmmakers | Trial-and-error with hobbyist LoRAs | $$ |
| 8 | **License terms are unenforceable.** Sell a LoRA on Patreon, buyer redistributes, no recourse | Independent creators | License text in description (ignored) | $$ |

### Tier 3: hobbyist tier (skip, race to bottom)

Generic LoRA marketplace. Civitai owns this. Don't go here.

---

## 3. Total addressable market (TAM)

Numbers below are estimates synthesized from public reports (Gartner, IFPI, McKinsey, IAB). Treat as order-of-magnitude, not precise.

### Top-down sizing

| Layer | Estimated 2027 market size | Our addressable slice |
|---|---|---|
| Generative AI commercial spend (global) | **~$50B/yr** | Infrastructure slice: 10% = $5B |
| AI licensing infrastructure (provenance, royalty, vault) | **~$3-7B/yr** | Direct play, ~$5B target |
| Brand-safe / compliant AI tooling | **~$1-3B/yr** | Adjacent capture, ~$2B |
| Synthetic talent / persona licensing | **~$500M-1B/yr (emerging)** | High-margin niche |
| Stock content market (analog comparable) | **~$7B/yr today** | Disrupted-from substitute |

**Conservative TAM: ~$10B/yr by 2027.** Realistic capture if dominant: $500M-1B ARR.

### Bottom-up sizing

| Segment | Population | Spend per | Annual TAM |
|---|---|---|---|
| Music labels (global, top 1000) | 1,000 | ~$500K AI marketing budget by 2027 | $500M |
| Fashion/DTC brands using AI imagery | ~50,000 | ~$50K/yr each | $2.5B |
| Ad agencies (Tier 1+2) | ~10,000 | ~$100K/yr each | $1B |
| Independent artists + creators | ~5M (Patreon-scale) | ~$200/yr (long tail) | $1B |
| Game studios using AI assets | ~2,000 | ~$200K/yr | $400M |
| Synthetic talent agencies | ~500 by 2027 | ~$1M/yr | $500M |

**Bottom-up total: ~$5.9B/yr by 2027.**

Both methods converge around **$6-10B/yr addressable.** A platform that captures 5% take-rate becomes a $300-500M ARR business.

### Serviceable obtainable market (SOM) for year 1

Realistic, not aspirational:

- 1 artist pilot (Ubani v2): 1 brand × $25K initial deal × 12 months ≈ $300K
- 5 invited Afrobeats / amapiano artists × 1 brand each × $30K ≈ $1.5M
- Total Year 1 SOM: **$1.5-2M ARR.** Proves the model.

---

## 4. Why now (market timing signals)

These all converged in the last 18 months:

1. **C2PA gained momentum** (Adobe, Microsoft, Sony, BBC). Provenance standard exists for content; weights-equivalent is open territory.
2. **EU AI Act in effect.** Companies legally need provenance documentation for AI-generated content. Compliance buyers are active.
3. **Right-of-publicity laws expanding.** Tennessee ELVIS Act 2024 (musician likeness), California AB 2602 (digital replicas). Legal moat hardening.
4. **Adobe Firefly proved the appetite.** Enterprise paid for "rights-cleared AI." Showed the willingness-to-pay exists.
5. **OpenAI / Anthropic / Stability training data lawsuits.** Buyers now actively avoid models with murky provenance. Demand for the verifiable alternative is real.
6. **Synthetic talent normalized.** Lil Miquela, FN Meka, Aitana Lopez. Brands quietly want this, but legal won't sign without infrastructure. We are that infrastructure.
7. **On-chain royalties matured.** USDC + L2 settlement is now boringly reliable. The technology debt that killed earlier attempts (gas, UX) is gone.

**The 12-24 month window is the prize.** First-mover with credible artist-side trust + working infrastructure wins the standard. After that, it's incumbent capture.

---

## 5. Competitive landscape

| Competitor | What they do | Where they fall short |
|---|---|---|
| **Civitai** | Hobbyist LoRA marketplace | No licensing, no provenance, IP-hostile, no royalty rails |
| **Hugging Face** | Model registry + spaces | Open by default, no vault model, weights downloadable |
| **Adobe Firefly** | Brand-safe gen AI | Adobe-only ecosystem, doesn't license artist personas |
| **Bria, Vermillio, Loti** | Provenance + IP startups | Narrow scope (single piece each), no integrated stack |
| **OpenAI custom GPTs** | Locked weights, API access | Doesn't extend to image LoRAs, OpenAI keeps all rights |
| **Synthetic talent agencies (Pendant, Particle 6)** | Manage AI personas | Closed roster, no infrastructure to license to others |

**Our unfair advantage:** the only player with simultaneously (a) artist-trust positioning, (b) integrated stack (creation → vault → settlement), (c) cultural-specific beachhead (African / diaspora music). Each is defensible alone; together they compound.

---

## 6. The defensible moat

Not the LoRA. Not the model. Not the inference API.

**The provenance ledger.**

Once the registry of "who trained what, on what data, with what consent, under what license, generating which outputs, for which buyer, paid out when, watermarked how" becomes the standard, switching costs are enormous and network effects compound. Whoever owns the de-facto standard wins.

Build the ledger. Everything else is downstream.

---

## 7. Revenue model

| Stream | Take rate / price | Year 3 estimate |
|---|---|---|
| Per-generation licensing fee | 5% of buyer's spend | ~$3M ARR |
| Enterprise vault subscription | $50K-500K/yr per enterprise | ~$5M ARR |
| Marketplace listing fee | $99-999/yr per artist | ~$300K ARR |
| Audit + compliance reports | $5K-50K per report | ~$1M ARR |
| Royalty settlement fee (Imperium) | 1% of payouts | ~$500K ARR |

**Year 3 ARR target: $8-10M.** This is conservative. Adjacent expansions (synthetic talent agency, brand-safe AI as a service) could push toward $25M ARR.

---

## 8. The integrated stack advantage

The reason this compounds: every existing app contributes a piece nobody else has assembled.

```
Gobbi      = dataset packaging upstream
Vaulted    = licensing + sandbox + audit (the rails)
Boveda     = LoRA / persona registry (the catalog)
Imperium   = on-chain royalty settlement (the cash rails)
StanVault  = identity + biometric verification (the trust layer)
Tizita     = visual taste curation (the quality filter)
Crucibla   = release readiness (governance)
Subtaste   = taste classification (recommendation engine)
Folio      = pattern intelligence (trend signal)
Resonaet   = audio brain (extends to music LoRAs)
Chromox    = vocal persona (audio version of Boveda)
Ibis       = authored lyrics / writer truth
```

A competitor would need to build 12 apps to match this. Or settle for being a thin slice of the stack. We are the only ones with a coherent end-to-end story.

---

## 9. Strategic risks

Honest about what could kill this:

1. **Big tech absorbs the space.** Adobe extends Firefly to a marketplace. Mitigated by artist-trust and cultural-specific positioning that incumbents can't honestly claim.
2. **C2PA standardizes around a non-vault model.** Anyone can self-host weights, provenance is metadata-only. Mitigated by enterprise compliance demand which still requires gated access.
3. **Foundation models absorb LoRA capabilities.** GPT-4o / Sora / Imagen become so good that custom LoRAs are obsolete. Mitigated by the **identity** dimension — even with perfect base models, an artist's specific face/voice is irreducibly unique and subject to right-of-publicity.
4. **Regulatory backlash on synthetic content.** EU bans biometric-likeness AI. Mitigated by being the **consent infrastructure** — regulation favors players with audit trails, not against them.
5. **Distribution / GTM is hard.** Selling to enterprise is slow. Mitigated by artist-side beachhead first (faster sale, builds catalog, then enterprise comes for the catalog).

---

## 10. Phased plan with revenue gates

| Phase | Focus | Investment | Revenue gate |
|---|---|---|---|
| **Phase 0 — proof** (now → 8 weeks) | Build MVP inside Vaulted. Pilot Ubani v2 with one brand. Document case study. | 6-8 weeks dev | $25-50K pilot deal |
| **Phase 1 — invited artists** (3-6 months) | Onboard 5-10 Afrobeats / amapiano artists. Each runs 1-2 brand pilots. | 3-month dev + sales | $300-500K ARR |
| **Phase 2 — open registry, gated** (6-12 months) | Public artist onboarding with curation. Marketplace UI. Enterprise tier launches. | 6-month dev + sales team | $1.5-3M ARR |
| **Phase 3 — enterprise + scale** (12-24 months) | Direct contracts with Fortune 500 brand-safe AI buyers. Compliance product. | Senior hires | $8-15M ARR |

---

## 11. Single most important action this quarter

**Run the Ubani v2 brand pilot.** One signed deal, watermarked outputs flowing, royalty paid via Imperium, documented publicly. That artifact (a real case study with real numbers) is worth 10x any pitch deck. It converts Phase 0 → Phase 1 in one motion.

Everything else (extra artists, enterprise sales, marketplace UI) is downstream of having that proof.

---

## 12. Honest gut check

This is a real opportunity, not vapor. Three reasons it's unusually well-shaped:

1. **The stack already exists.** Most "AI infrastructure" startups are 1-2 years from where you are now.
2. **Cultural specificity is rare.** African / diaspora-first positioning gives a real beachhead that Adobe / OpenAI can't credibly enter.
3. **Artist-first IS the moat.** It's not marketing language. Every piece of the stack respects creator IP. That trust is cumulatively expensive for any competitor to fake.

The execution risks are real (enterprise sales is slow, brand pilots take time to close, regulatory uncertainty). But the asymmetry is favorable: small downside (the apps are useful even without the licensing thesis), enormous upside if the licensing layer becomes the standard.

Worth shipping the MVP and running the pilot. The data from one real pilot tells you everything you need to know about whether to go all-in.
