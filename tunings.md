# The Tuning Systems That Synthesizers Forgot

Every synthesizer you've ever played lies to you about pitch.

It divides the octave into 12 equal steps — 12-tone equal temperament, or 12-TET — and presents this as the natural order of sound. It isn't. It's a compromise invented in 18th-century Europe to let keyboard instruments modulate freely between keys. The trade-off: every interval except the octave is slightly out of tune with the harmonic series. We've been living inside that compromise so long we forgot it was one.

Meanwhile, across the African continent, instrument builders have spent centuries developing tuning systems that make completely different compromises — or refuse to compromise at all. These systems aren't historical curiosities. They're living technologies, refined across generations on xylophones, lamellophones, lyres, harps, and musical bows, encoding knowledge about psychoacoustics, community, and the physics of vibrating bodies that Western music theory is only beginning to reckon with.

This article documents 19 of these tuning systems as implemented in an open-source feedback instrument — a Lorenz attractor driving six waveguide resonators tuned to scales from across the continent. The goal isn't ethnomusicological completeness (that would take a library, not a blog post). It's to give synthesizer designers and electronic musicians a concrete starting point for building instruments that sound like something other than Europe.

---

## West Africa

### 0. Yoruba Anhemitonic Pentatonic

**Intervals (cents):** Flexible — interpolates between Pythagorean (0, 204, 408, 702, 906) and just intonation (0, 182, 386, 702, 884)

**Instruments:** Dundun (talking drum ensemble), bata drums, agogo (double bell)

The Yoruba tuning is the hardest to pin down because it's not fixed. Dundun players bend pitch continuously using the tension cords on the hourglass drum — the instrument is literally designed to slide between tuning targets. Samuel Akinbo's 2019 phonetic study of dundun speech surrogacy measured fundamental frequencies that cluster around Pythagorean ratios for speech-tone intervals but drift toward just intonation in musical contexts.

In the instrument, this is implemented as a `flex` parameter (0–1) that interpolates between Pythagorean and just ratios in real time. At flex=0 you get the crisp Pythagorean thirds; at flex=1 the warm just thirds. The truth is somewhere in between, and it moves.

**Key researchers:** Akinbo (2019), Euba (1990), Villepastour (2010)

### 1. Dundun Three-Tone

**Intervals (cents):** 0, 200, 400

**Instruments:** Iya ilu (mother drum), omele (supporting drums)

The dundun ensemble's melodic vocabulary, when stripped to its essential speech-tone targets, reduces to three pitch levels — low, mid, high — spaced at roughly equal whole-tone intervals. This isn't the full picture of dundun performance (which involves continuous glides), but it captures the structural framework that underlies Yoruba tonal language surrogate drumming.

**Key researchers:** Akinbo (2019), Villepastour (2010)

### 2. Balafon Equi-Pentatonic

**Intervals (cents):** 0, 220, 460, 690, 930

**Instruments:** Balafon (gourd-resonated xylophone), various West African xylophones

Five notes per octave, spaced at roughly 240 cents each (compared to 12-TET's 200-cent whole tone). Roderic Knight (1972) measured Mandinka balafons and found consistent intervals around 240 cents, forming what Kubik calls an "equi-pentatonic" system. The steps feel wider than Western whole tones — there's more space between notes, which changes everything about melody and ornamentation.

The slight deviations from perfect 240-cent spacing (220, 240, 230, 240) are characteristic — each instrument has its own personality within the system, carved into the keys by the maker.

**Key researchers:** Knight (1972), Kubik (2010), Jessup (1983)

### 18. Igbo Pentatonic

**Intervals (cents):** 0, 200, 386, 702, 884

**Instruments:** Ubo aka (lamellophone), ogene (iron bell), ekwe (slit drum)

The Igbo pentatonic scale maps closely to the 5-limit just intonation major pentatonic (1:1, 9:8, 5:4, 3:2, 5:3). This alignment with the harmonic series may reflect the strong tradition of vocal polyphony in Igbo music, where singers naturally gravitate toward just intervals. The ogene's fixed pitches provide the intonation reference for the ensemble.

**Key researchers:** Nzewi (1997), Echezona (1963)

---

## Mandinka / Senegambia

### 7. Kora Silaba

**Intervals (cents):** 0, 200, 385, 500, 700, 900, 1085

**Instruments:** Kora (21-string bridge harp)

Silaba is one of the principal tuning modes of the Mandinka kora. Roderic Knight documented it as a heptatonic scale that roughly corresponds to the Western major scale, but with consistently flatter thirds and sevenths. The 385-cent third sits exactly between the equal-tempered 400 cents and the just 386 cents — close to just intonation but not identical.

Kora tunings are transmitted orally from master (jali) to apprentice, and individual players maintain subtly different versions. The "standard" here is a composite of measurements from multiple instruments.

**Key researchers:** Knight (1972), Charry (2000)

### 8. Kora Sauta

**Intervals (cents):** 0, 185, 405, 605, 700, 885, 1105

**Instruments:** Kora

Sauta is the kora's other principal mode — darker and more ambiguous than Silaba. The 185-cent second is narrower than any Western interval, and the 605-cent fourth is 105 cents sharp of the just perfect fourth. This creates a harmonic tension that Western music theory would call "out of tune" but that kora players recognize as the correct emotional color for a whole repertoire of pieces.

The interval between Silaba and Sauta isn't like switching between major and minor on a piano. It requires retuning the instrument — loosening or tightening the leather rings on each string. The tuning IS the composition, not a parameter of it.

**Key researchers:** Knight (1972), Charry (2000), Durán (2005)

---

## Central Africa

### 4. BaAka (Pygmy) Equi-Pentatonic / 5-TET

**Intervals (cents):** 0, 240, 480, 720, 960

**Instruments:** Hindewhu (single-pitch papaya-stem flute), vocal polyphony

The BaAka of the Central African Republic sing in a pentatonic system with remarkably equal step sizes — close to a theoretical 5-TET (five-tone equal temperament, 240 cents per step). Simha Arom's extensive fieldwork (1985, 1991) documented this through a systematic method of having musicians validate re-synthesized versions of their own music.

This is one of the clearest examples of equal temperament arising independently of European theory. The BaAka system predates any contact with Western music and serves completely different aesthetic goals — facilitating the interlocking hocket polyphony that is the signature of Central African vocal music.

**Key researchers:** Arom (1985, 1991), Kubik (2010), Fürniss (2006)

### 3. Equi-Heptatonic (7-TET)

**Intervals (cents):** 0, 171, 343, 514, 686, 857, 1029

**Instruments:** Manza, Gbaya, and Zande xylophones; lukembe lamellophones

Seven notes per octave, equally spaced at ~171 cents each. This creates intervals that fall between all Western categories — the "thirds" are 343 cents (neither major nor minor), the "fifths" are 686 cents (16 cents flat of pure). Kubik documented this system across a wide swath of central Africa, from the Central African Republic through the Democratic Republic of Congo.

The 7-TET system is profoundly disorienting for ears trained on 12-TET because no interval "resolves" in the Western sense. Every step is the same size. There's no leading tone, no tritone, no dominant-tonic pull. Harmonic motion works through completely different principles — timbral contrast, rhythmic placement, and registral spacing do the work that harmonic tension does in European music.

**Key researchers:** Kubik (2010), Arom (1985), Jones (1959)

---

## East Africa

### 9. Ethiopian Tizita Major (Qiñit)

**Intervals (cents):** 0, 200, 400, 700, 900

**Instruments:** Krar (6-string lyre), masinko (single-string fiddle), washint (bamboo flute)

Tizita means "nostalgia" or "memory" in Amharic, and the scale sounds it — bright, open, with a characteristic gap between the 400-cent third and 700-cent fifth that leaves space for the ornamental melisma central to Ethiopian vocal style. The scale is anhemitonic pentatonic, like many Ethiopian modes, mapping closely to the major pentatonic but with intervals that don't quite match 12-TET.

**Key researchers:** Kimberlin (1978), Kebede (1971), Weisser (2010)

### 10. Ethiopian Tizita Minor

**Intervals (cents):** 0, 200, 300, 700, 800

**Instruments:** Krar, masinko, washint

The minor version of Tizita drops the third and sixth by 100 cents each, creating a scale that parallels the Western natural minor pentatonic. But the 300-cent and 800-cent intervals in Ethiopian practice often drift — singers and instrumentalists treat these as zones rather than fixed points, bending into and out of them for expressive effect.

**Key researchers:** Kimberlin (1978), Kebede (1971)

### 11. Ethiopian Bati

**Intervals (cents):** 0, 200, 500, 700, 900

**Instruments:** Krar, masinko, washint

Bati is the most common Ethiopian pentatonic mode, associated with religious music and the Ethiopian Orthodox Church tradition. The 500-cent fourth (just slightly sharp of the pure 498-cent fourth) and the 200-cent second give it a grounded, devotional quality. Many Ethiopian pop songs are built on Bati.

**Key researchers:** Kimberlin (1978), Kebede (1971)

### 12. Ethiopian Ambassel

**Intervals (cents):** 0, 200, 400, 700, 800

**Instruments:** Masinko, washint, vocal traditions of Wollo region

Named after the Ambassel mountain in the Wollo region of northern Ethiopia, this mode mixes a bright major-pentatonic opening (0, 200, 400) with a dark upper tetrachord (700, 800). The 100-cent step between the fifth and sixth degrees creates a distinctive melancholic color that is the emotional signature of Wollo music.

**Key researchers:** Kimberlin (1978), Kebede (1971)

### 13. Ethiopian Anchihoye

**Intervals (cents):** 0, 100, 500, 600, 900

**Instruments:** Washint, masinko

The most chromatic-sounding of the Ethiopian modes, Anchihoye features two semitone-like intervals (0→100, 500→600) that give it a restless, searching quality unlike the other four qiñit. It's used for specific emotional contexts — often associated with martial or intensely passionate music. The wide gaps (100→500, 600→900) create dramatic leaps that Ethiopian vocalists exploit for ornamental display.

**Key researchers:** Kimberlin (1978), Kebede (1971)

### 14. Bugandan Amadinda

**Intervals (cents):** 0, 240, 480, 720, 960

**Instruments:** Amadinda (12-key xylophone), embaire (17-key xylophone)

The Bugandan amadinda xylophone of Uganda uses an equi-pentatonic tuning essentially identical to the BaAka system — five tones per octave at 240-cent spacing. The amadinda is played by three interlocking players who alternate notes at high speed, creating composite melodies that no single player is performing. The equal spacing of tones facilitates this interlocking technique, since any combination of adjacent notes produces equivalent intervals.

Kubik's measurements of amadinda tuning (from instruments in the Kampala museum) show remarkable consistency with theoretical 5-TET, varying by less than 15 cents per step.

**Key researchers:** Kubik (2010), Anderson (1968), Cooke (1992)

### 17. Wagogo Ilimba (Harmonic Series)

**Intervals (cents):** 0, 386, 702, 969, 1200, 1404

**Instruments:** Ilimba (lamellophone)

The Wagogo people of central Tanzania tune their ilimba lamellophone to harmonics 4 through 9 of the natural series — the ratios 4:5:6:7:8:9. This produces a scale whose intervals are pure harmonic-series ratios: 5/4, 3/2, 7/4, 2/1, 9/4 (relative to the root). The 7th harmonic (969 cents, the "natural seventh") is 31 cents flat of the equal-tempered minor seventh, giving the scale a distinctive blues-like quality that predates any historical contact with American music.

This is one of the most theoretically significant tuning systems in Africa because it demonstrates conscious use of the harmonic series as an organizing principle — something European theory associates exclusively with brass instrument acoustics and spectralist composition.

**Key researchers:** Kubik (2010), Tracey (1969)

---

## Southern Africa

### 5. Shona Mbira — Nyamaropa Mode

**Intervals (cents):** 0, 180, 380, 500, 700, 880, 1080

**Instruments:** Mbira dzavadzimu, mbira nyunga nyunga (kalimba)

Nyamaropa is the most common of the seven modes of the Shona mbira tradition. Andrew Tracey and later Paul Berliner documented it extensively, finding a heptatonic system that defies Western modal categories. The 180-cent second is narrower than a whole tone; the 380-cent third is between major and minor; the 880-cent sixth sits in an ambiguous zone that makes the scale feel simultaneously major and minor to Western-trained ears.

The mbira's tuning is not abstract — it's built into the instrument by the smith who forges and tunes each tine. Berliner (1978) documented how master mbira makers tune by matching the sound to an internal model transmitted through apprenticeship, not by measurement.

**Key researchers:** A. Tracey (1970), Berliner (1978), Kauffman (1970)

### 6. Shona Mbira — Gandanga Mode

**Intervals (cents):** 0, 100, 300, 500, 700, 800, 1000

**Instruments:** Mbira dzavadzimu

Gandanga is a darker mode in the mbira repertoire, with a semitone opening (0, 100) and minor-sounding intervals throughout. Of all the Shona modes, it maps most closely to a Western scale (Phrygian), but the deviations from 12-TET are large enough that the resemblance is misleading. The 100-cent and 800-cent steps are zones, not fixed points — different mbira makers place them differently, and the "correct" tuning is the one that makes the buzz of the bottle caps mounted on the soundboard resonate sympathetically.

**Key researchers:** A. Tracey (1970), Berliner (1978)

### 15. Chopi Timbila (Measured)

**Intervals (cents):** 0, 175, 346, 519, 681, 854, 1025

**Instruments:** Timbila (xylophone orchestra)

The Chopi people of southern Mozambique build timbila xylophones in orchestras of up to 30 instruments, all tuned to a system that Hugh Tracey measured in the 1940s and Andrew Tracey re-measured in the 1970s. The intervals are close to 7-TET (171 cents per step) but consistently deviate — the system is near-equiheptatonic but not perfectly equal. Each step ranges from 166 to 181 cents.

The timbila orchestra is one of the most sophisticated ensemble traditions in Africa, with UNESCO Intangible Cultural Heritage status. The tuning system's slight asymmetry may be intentional — creating subtle interval variety within an approximately equal framework.

**Key researchers:** H. Tracey (1948), A. Tracey (1970), Kubik (2010)

### 16. San Musical Bow (Harmonic Series)

**Intervals (cents):** 0, 200, 386, 498, 702, 884

**Instruments:** Uhadi, umrhubhe (braced mouth bow)

The San (and related Khoekhoe and Nguni) musical bow tradition extracts melodies from the harmonic series of a single vibrating string. By touching the string at a nodal point (usually 1/3 or 1/4 of the length), the player selects a fundamental; by shaping the mouth cavity, they amplify individual harmonics to create melody. The resulting scale is a subset of the harmonic series — pure intervals including the just major third (386c), perfect fourth (498c), and perfect fifth (702c).

This is arguably the oldest continuously practiced tuning system in the world, with archaeological evidence for musical bows in southern Africa going back thousands of years.

**Key researchers:** Dargie (1988), Kubik (2010), Rycroft (1966)

---

## Kubik's Taxonomy

Gerhard Kubik, the Austrian ethnomusicologist who spent decades doing fieldwork across Africa, proposed a taxonomy of African tuning systems that remains the most useful framework:

**Equi-pentatonic** (5-TET, ~240c steps): BaAka Pygmy vocal polyphony, Bugandan amadinda, Balafon traditions across West Africa. The equal spacing facilitates interlocking (hocket) performance techniques.

**Equi-heptatonic** (7-TET, ~171c steps): Central African xylophones (Manza, Gbaya, Zande), Chopi timbila (approximate). Creates a harmonic world with no semitones and no leading tones — pure equidistance.

**Harmonic-series-derived**: Wagogo ilimba (harmonics 4–9), San musical bow (selected harmonics), Igbo ogene patterns. These systems arise from the physics of vibrating bodies and produce just intonation intervals.

**Non-equidistant heptatonic**: Shona mbira modes, Kora tunings, Ethiopian qiñit. Seven notes per octave with unequal steps, creating modal systems that don't map onto Western major/minor but have their own internal logic of tension and resolution.

The taxonomy is useful but imperfect. Many traditions blend categories — the kora Sauta mode has near-equal steps in some segments, and the Chopi timbila system falls between equi-heptatonic and non-equidistant. The categories describe tendencies, not walls.

---

## Agawu's Critique

Kofi Agawu, the Ghanaian-born music theorist, has argued forcefully against treating African tuning systems as exotic alternatives to Western temperament. His critique cuts in two directions:

First, he challenges the "discovery" framing. When Western researchers "discover" that a balafon uses equi-pentatonic tuning, they position themselves as the knowing subject and the African musician as the unknowing object — someone who plays in 5-TET without knowing what 5-TET is. But the balafon maker who carves each key to the right pitch knows exactly what they're doing. They just don't need Helmholtz's vocabulary to do it.

Second, Agawu questions whether "tuning system" is even the right unit of analysis. In much African music, the rhythmic dimension carries as much structural weight as pitch — analyzing tuning without analyzing timeline patterns, rhythmic modes, and durational hierarchies is like analyzing Western harmony without rhythm. The fixation on tuning systems, he argues, reflects a Western bias that puts pitch organization at the top of the musical hierarchy.

This critique is important for instrument designers. When we implement these tuning systems in a synthesizer, we're extracting pitch relationships from a context where pitch, timbre, rhythm, and social function are inseparable. The tuning table is a reduction — useful, but partial. A Yoruba tuning system without the social dynamics of a dundun ensemble is a different thing from what it is when it's embedded in performance. We should use these scales with that awareness.

---

## Measurement Status

Not all of these tuning systems rest on the same evidentiary foundation:

**Well-measured** (multiple independent studies with acoustic analysis): BaAka/Pygmy, Bugandan amadinda, Chopi timbila, Shona mbira modes, Kora tunings, San musical bow

**Moderately documented** (some acoustic measurements, primarily one research team): Ethiopian qiñit, Balafon equi-pentatonic, Wagogo ilimba, Dundun three-tone

**Estimated/composite** (derived from ethnographic description, limited acoustic data): Igbo pentatonic, Yoruba flexible pentatonic

The "estimated" category doesn't mean these systems are wrong — it means the published acoustic measurement literature is thin, often because the instruments involved (drums, slit drums) have less definite pitch than xylophones or lamellophones. The tuning relationships exist in performance; they just haven't been measured with the same rigor.

---

## Why This Matters for Synthesizer Design

Every digital synthesizer ships with 12-TET as default and maybe a handful of historical European temperaments (Pythagorean, meantone, Werckmeister). Some add Hindustani or Arabic maqam scales. Almost none include African tuning systems, despite Africa's continent-wide tradition of building precision-tuned pitched percussion instruments — xylophones, lamellophones, and musical bows that are essentially analog synthesizers with fixed tuning.

This isn't just a diversity argument (though it is that too). These tuning systems encode solutions to musical problems that 12-TET can't solve:

- **How do you build a scale where any combination of notes interlocks?** Answer: equi-pentatonic (equal step sizes mean equal intervals everywhere).
- **How do you match a tuning to the natural resonances of a vibrating body?** Answer: harmonic-series derivation (the Wagogo approach).
- **How do you create a scale that is simultaneously "major" and "minor"?** Answer: Shona mbira tuning (the neutral third at 380 cents).
- **How do you build in expressive flexibility without losing structural identity?** Answer: Yoruba flex tuning (continuous interpolation between grid points).

These are design patterns, not museum pieces. Use them.

---

## Bibliography

Akinbo, Samuel. 2019. "Representation of Yoruba tones by a talking drum." *Proceedings of the Annual Meeting on Phonology* 7.

Anderson, Lois. 1968. "The Miko Modal System of Kiganda Xylophone Music." PhD diss., UCLA.

Arom, Simha. 1985. *Polyphonies et polyrhythmies instrumentales d'Afrique Centrale*. Paris: SELAF.

Arom, Simha. 1991. *African Polyphony and Polyrhythm: Musical Structure and Methodology*. Cambridge: Cambridge University Press.

Berliner, Paul. 1978. *The Soul of Mbira: Music and Traditions of the Shona People of Zimbabwe*. Berkeley: University of California Press.

Charry, Eric. 2000. *Mande Music: Traditional and Modern Music of the Maninka and Mandinka of Western Africa*. Chicago: University of Chicago Press.

Cooke, Peter. 1992. "Report on Pitch Perception Experiments Carried Out in Buganda and Busoga." *African Music* 7(2): 119–25.

Dargie, David. 1988. *Xhosa Music: Its Techniques and Instruments*. Cape Town: David Philip.

Durán, Lucy. 2005. "Women, Music, and the 'Mystique' of Hunters in Mali." In *The African Diaspora: A Musical Perspective*, ed. I. Monson. New York: Garland.

Echezona, W. W. C. 1963. "Ibo Musical Instruments in Ibo Culture." PhD diss., Michigan State University.

Euba, Akin. 1990. *Yoruba Drumming: The Dundun Tradition*. Bayreuth: Bayreuth African Studies.

Fürniss, Susanne. 2006. "Aka Polyphony: Music, Theory, Back and Forth." In *Bentzon Symposium on Analytical Approaches to World Music*, ed. M. Tenzer. Oxford: Oxford University Press.

Jessup, Lynne. 1983. *The Mandinka Balafon: An Introduction with Notation for Teaching*. La Crescenta, CA: Xylo Publications.

Jones, A. M. 1959. *Studies in African Music*. 2 vols. London: Oxford University Press.

Kauffman, Robert. 1970. "Multi-Part Relationships in the Shona Music of Rhodesia." PhD diss., UCLA.

Kebede, Ashenafi. 1971. "The Music of Ethiopia: Its Development and Cultural Setting." PhD diss., Wesleyan University.

Kimberlin, Cynthia Tse. 1978. "Masinko and the Nature of Qiñit in Ethiopian Music." PhD diss., UCLA.

Knight, Roderic. 1972. "Kora Manding: Mandinka Music of the Gambia." PhD diss., UCLA.

Kubik, Gerhard. 2010. *Theory of African Music*. 2 vols. Chicago: University of Chicago Press.

Nzewi, Meki. 1997. *African Music: Theoretical Content and Creative Continuum*. Oldershausen: Institut für Didaktik populärer Musik.

Rycroft, David. 1966. "Friction Chordophones in South-Eastern Africa." *The Galpin Society Journal* 19: 84–100.

Tracey, Andrew. 1970. "The Matepe Mbira Music of Rhodesia." *African Music* 4(4): 37–61.

Tracey, Hugh. 1948. *Chopi Musicians: Their Music, Poetry, and Instruments*. London: Oxford University Press.

Tracey, Hugh. 1969. "The Ilimba of the Wagogo." *African Music* 4(3): 49–54.

Villepastour, Amanda. 2010. *Ancient Text Messages of the Yoruba Bata Drum*. Farnham: Ashgate.

Weisser, Stéphanie. 2010. "Investigating tonal systems by means of experimental retuning." *Proceedings of the 3rd International Workshop on Folk Music Analysis*.

Agawu, Kofi. 2003. *Representing African Music: Postcolonial Notes, Queries, Positions*. New York: Routledge.

Agawu, Kofi. 2016. *The African Imagination in Music*. Oxford: Oxford University Press.
