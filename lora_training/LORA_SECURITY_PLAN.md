# LoRA security plan

A practical security baseline for the alabo_eye / ubani / ubani_v2 LoRAs and any future trained weights. Treats character LoRAs as biometric assets and style LoRAs as commercial IP.

Owner: bomac1193
Last reviewed: 2026-04-30
Review cadence: quarterly

---

## 1. Asset inventory

| Asset | Type | Storage | Risk class |
|---|---|---|---|
| `alabo_eye_v1.safetensors` | Style LoRA | Local D, Replicate private | Medium (commercial IP) |
| `ubani_v1.safetensors` | Character LoRA (face) | Local D, Replicate private | High (biometric) |
| `ubani_v2.safetensors` | Character LoRA (face) | Local D, Replicate private | High (biometric) |
| `REPLICATE_API_TOKEN` | Auth credential | Windows env var, gen.py shell | Critical (controls all above) |
| Training datasets | Source images | WSL `~/Feedback/lora_training/` | Medium (recoverable) |
| Boveda character JSON | Registry pointers | WSL `~/boveda/characters/` | Low (no weights, just metadata) |

---

## 2. Threat model

| Threat | Likelihood | Impact | Mitigation tier |
|---|---|---|---|
| LoRA file leak (collaborator overshare) | Medium | High | Tier 1 |
| LoRA file leak (machine compromise) | Low | High | Tier 1 |
| Replicate API token theft | Medium | High | Tier 1 |
| Service-side breach (Replicate, Boveda, etc.) | Low | High | Tier 2 |
| Style scraping (someone reverse-engineers via outputs) | Medium | Medium | Tier 2 |
| Training data leak (real photos of artist) | Medium | Medium | Tier 2 |
| Misuse of leaked LoRA (deepfake / NSFW / defamation) | High (if leaked) | Critical | Tier 3 |
| Unauthorized commercial use of style LoRA | Medium | Medium | Tier 3 |

Tier 1 = preventive. Tier 2 = detective + recovery. Tier 3 = legal + brand response.

---

## 3. Tier 1 — preventive controls

### Storage hygiene
- **Never** publish to HuggingFace, Civitai, or any public model host.
- Verify all Replicate models are private. Check at https://replicate.com/bomac1193 monthly.
- Local LoRA files stay only on a machine you physically control. Do not place in synced folders (Dropbox, OneDrive, Google Drive) unless that folder is encrypted.
- Backup LoRAs to an encrypted volume only:
  - VeraCrypt container, OR
  - BitLocker drive, OR
  - rclone + cryptomator/age before cloud sync.

### Sharing rule
- The default is **never share the .safetensors file**.
- If a collaborator genuinely needs use rights:
  - Give them API-gated access (run on your Replicate, they call your endpoint).
  - Or wrap with a custom license + NDA + time-bounded URL. Never raw file in chat or email.
- Same rule for ANY file path containing the .safetensors. A signed S3 URL valid for 1 hour is acceptable. Persistent dropbox link is not.

### Token hygiene
- `REPLICATE_API_TOKEN` rotated **quarterly** (calendar reminder).
- Never commit tokens to git. Even private repos. Use `.env` + `.gitignore`.
- One token per machine where possible. If you replace your laptop, rotate the token immediately on the old machine.
- Replicate tokens can be scoped: prefer scoped read-only or model-specific tokens for non-rendering uses (e.g. if Boveda only needs to fetch metadata, not generate).

### Source data hygiene
- The 23 real photos used to train ubani_v2 should also be encrypted at rest. They are the seed; if leaked, others can train an equivalent LoRA themselves.
- Keep training datasets in `~/Feedback/lora_training/` only on the local WSL. Encrypted backup, no public mirror.

---

## 4. Tier 2 — detective + recovery

### Provenance watermarking
- All images generated via `gen.py` should embed:
  - EXIF metadata: owner, LoRA used, version, seed, timestamp, signed hash.
  - Optional visible mark: low-opacity corner glyph (configurable on/off).
- Watermarks let you publicly claim: "if it doesn't carry the mark, it's not me." Doesn't stop generation but establishes authenticity baseline.
- Implement via gen.py post-processing step. Add to TODO if not yet wired.

### Hash + signature registry
- Compute SHA-256 of each .safetensors file. Store in Boveda registry.
- If a leaked file appears, you can prove it is yours by hash match.
- Sign the hashes with your PGP/age key for non-repudiation. Stored in `~/boveda/characters/_signatures.txt`.

### Access logs
- Replicate logs every prediction call. Review monthly.
  - Unexpected spike in usage = stolen token. Rotate immediately.
  - Geographic anomalies (calls from regions you don't operate) = check for compromise.
- If Boveda or any internal app stores LoRAs, require it to log every read/access by user/timestamp.

### Reverse-search for misuse
- Periodically search Civitai, HuggingFace, ArtStation, Google Images for outputs that match your visual signature.
- If a LoRA labelled "Ubani style" or similar appears anywhere, file a takedown.
- Manual quarterly check; long-term consider automating with CLIP-similarity scan.

---

## 5. Tier 3 — legal + brand response

### Custom license file
Ship every LoRA with a `LICENSE.txt` companion:

```
This LoRA model artifact and its weights are the exclusive property of bomac1193.

Permitted: personal review for collaboration evaluation only.
Prohibited: redistribution, commercial use, derivative training, public hosting,
            generation of content that depicts the trained subject without
            written permission.

The trained subject ('Ubani') asserts personality / right-of-publicity rights
under applicable jurisdictions including UK Data Protection Act 2018 and
EU GDPR Article 9 (biometric data).

Violations subject to takedown notice, civil claim, and criminal referral
where applicable.

Owner contact: [your email]
```

### Right-of-publicity assertion
- UK / EU / US all recognize personality rights over commercial use of likeness.
- Document the assertion publicly: a single page on your artist site stating that any AI-generated content depicting "Ubani" not from official channels is unauthorized.
- This becomes your legal anchor when filing takedowns.

### Trademark consideration
- If "Ubani" becomes commercially material (record release, merchandise, branded content), file a trademark in your operating jurisdiction. Even a UK Class 9 (digital media) + Class 41 (entertainment) registration is cheap and significantly strengthens enforcement posture.

### Incident response playbook

| Trigger | Response |
|---|---|
| Replicate token exposed | Rotate within 1 hour. Audit usage logs. Re-create token, update Windows env var, update gen.py. |
| .safetensors file leaked (you find a public link) | DMCA takedown to host. File evidence (hash match against your registry). Notify any service that claims to host LoRAs to add hash to denylist. |
| Deepfake / impersonation discovered | Public statement on official channels with provenance proof. Takedown via platform reporting. Legal escalation if commercial / defamatory. |
| Service breach (Replicate / Boveda / etc.) | Treat all weights stored there as compromised. Re-train on fresh seed. Rotate tokens. Issue takedowns on any derivative content. |

---

## 6. Operational rituals

| Cadence | Action |
|---|---|
| **Daily** | Use only via gen.py / Boveda. Never via raw file paths in shared docs. |
| **Weekly** | Confirm Replicate models still marked private. |
| **Monthly** | Review Replicate prediction logs for anomalies. Manual reverse search for misuse. |
| **Quarterly** | Rotate `REPLICATE_API_TOKEN`. Review this plan. Verify backups are encrypted and recent. |
| **On collaborator change** | Re-evaluate access list. Rotate tokens if any departing collaborator had access. |
| **On model retrain** | Add new artifact to inventory, update Boveda, sign + hash. |

---

## 7. Boveda integration policy

Before uploading any LoRA to Boveda:

1. Confirm Boveda storage is **encrypted at rest** (AES-256 minimum).
2. Confirm Boveda storage is **single-tenant** (only the owner can read), not multi-user shared.
3. Confirm Boveda **logs every weight access**.
4. Boveda should **never expose a public download URL** for raw weights — only API-gated inference.
5. If Boveda runs on cloud infra: read its provider's data processing agreement. Confirm no training-on-customer-data clause.

If any of the above fails, do not upload weights. Upload metadata only (registry JSON), keep weights local.

---

## 8. What this plan does NOT defend against

Be honest about residual risk:

- **Determined attacker with weights in hand** can use them on their own infrastructure. No defense, only legal recourse.
- **State-level adversary** is out of scope.
- **Co-conspirator collaborator** with legitimate access who later defects. Mitigated only by access discipline + legal contracts.
- **Style imitation by a different model trained on your public outputs.** Mitigated only by output watermarking (which makes it costly to scrape).

The realistic security posture is: **make leakage rare, recovery fast, and misuse expensive enough to deter casual abuse.** A motivated bad actor with budget and intent will eventually win against any single artist's defenses. The plan minimizes that population to a vanishingly small set.
