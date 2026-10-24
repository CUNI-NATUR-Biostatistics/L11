# L11 generated images for the presentation

Record of every AI-generated illustration in `Presentation/presentation.qmd`. The plan (title image T and in-deck illustrations G1–G6) was approved by Ondřej Mottl on 2026-10-22 together with the Stage 4 story map (`Workflow/records/2026-10-22-stage-4-presentation.md`). Quantitative figures are drawn in R from the data and are never replaced by a generated image.

Every slot uses `include_optional_figure()`: until a file exists in this folder, its slot shows nothing and no AI disclosure. The visible disclosure „Ilustrace vytvořená pomocí AI.“ appears only when the file exists (`ai_disclosure()`).

## Series identity

- Cast and style as in `Learning_materials/images/GENERATED_IMAGES.md` (version 2): a plains leopard frog field ecologist (*Lithobates blairi*) with a small notebook and ruler, and a blue-green dragonfly assistant; warm storybook natural-history watercolour/gouache, gentle academic humour, natural anatomy and natural colours for organisms and habitat; course indigo, parchment, graphite and small orange accents only on equipment.
- Global constraints: no text, letters, numbers, axes, charts, labels, logos or watermarks; no image shows or implies which froglets are larger, how many tanks there are, or any numerical result.
- Transparent RGBA PNG with an irregular painterly vignette. In-deck images landscape (G1–G5, 3:2 or 4:3) or square (G6); the title image portrait 3:4.

## Plan

| ID | File | Slide (story map) | Teaching role | Source | Status |
|---|---|---|---|---|---|
| T | `zabky_titulni.png` | 1 | Introduce the drying pool, the tanks and the cast without implying a result. | New | generated locally; human review pending |
| G1 | `zabky_vysychajici_tun.png` | 2 | Make the biological question concrete: a pool that dried out and refilled, froglets leaving the water. | Reuse of skripta S1 (v2) | in place |
| G2 | `zabky_pokusne_nadrze.png` | 9 | Show a tank mesocosm as a physical object before the schematic. | Reuse of skripta S2 (v2) | in place |
| G5 | `vazky_tune_les_pole.png` | 13a | Introduce the dragonfly reference example of the study-design thread. | Reuse of skripta S4 (v2) | in place |
| G3 | `zabky_jedna_nadrz_mnoho_zabek.png` | 25 | Metaphor after the MCQ: more froglets from one tank refine that tank; the question needs more tanks. | New | generated locally; human review pending |
| G4 | `zabky_tune_v_krajine.png` | 37 | Metaphor for a random factor: a few tanks stand for many possible pools. | Reuse of skripta S3 (v2) | in place |
| G6 | `zabky_planovani_studie.png` | 27, 35a, 49a, 53a, 57 | Recurring icon of the study-design thread: the cast planning a study before fieldwork. | New | generated locally; human review pending |
| G7 | `zabky_jednotka_replikace.png` | 17 „Žabka je jednotka pozorování, nádrž jednotka nezávislé replikace“ | Two levels made visible: one froglet measured (unit of observation) versus the whole tank seen from above (unit of replication). | New (human review batch 1) | generated locally; human review pending |
| G8 | `zabky_sbor_jedne_nadrze.png` | 23 „Proč 16 nádrží nevydá za 485 žabek“ | Metaphor for non-independence: froglets of one tank sing in unison, many voices but one opinion. | New (human review batch 1) | generated locally; human review pending |
| G9 | `zabky_pevny_nahodny.png` | 51 „Zajímají nás konkrétní úrovně, nebo celý soubor možných úrovní?“ | Fixed versus random: picking three specific flowers versus drawing pebbles from a bag. | New (human review batch 1) | generated locally; human review pending |
| G10 | `povodi_vapnik.png` | 53 „Když nepomůže ani model: jedno ošetřené povodí“ | Makes the design limit concrete: one whole valley treated, one untreated. | New (human review batch 1) | generated locally; human review pending |
| G1 (callback) | `zabky_vysychajici_tun.png` | conclusion „Vylézají z vyschlých nádrží menší žabky?“ | The opening picture returns with the answer. | Reuse of G1 | in place |

## Reused images (G1, G2, G4, G5)

Copied unchanged from `Learning_materials/images/` on 2026-10-22 (skripta images S1–S4, version 2). On 2026-10-23 the author decided that the skripta should carry only practical visuals, so the illustrations were removed from the skripta; these deck files are now the only active copies. Their prompts, tools, references, reuse terms and full provenance were moved unchanged to `versions/skripta-origin/` (`GENERATED_IMAGES_skripta.md`, `GENERATED_IMAGE_PROMPTS_20261021.json`, `GENERATED_IMAGE_PROMPTS_20261022_v2.json`; OpenAI built-in `image_gen`, model not exposed). G2 was replaced in illustration revision 2 (below); G1, G4 and G5 remain byte-identical to the version 2 files.

| ID | File | Pixel size | SHA-256 |
|---|---|---|---|
| G1 | `zabky_vysychajici_tun.png` | 1536 × 1024 RGBA | `2023206f2e860b4572f27c52481a1134b25b606afdc165d5399d2c7ae2fc8d7b` |
| G2 | `zabky_pokusne_nadrze.png` | 1536 × 1024 RGBA | `51b44b695f1d91502bf150fc6417add6038361d02ca066ddb0d31fa030c5fa7b` |
| G4 | `zabky_tune_v_krajine.png` | 1536 × 1024 RGBA | `065a871ff501b6e25c65660742ce755487c0815f300cd28b35f41fc70a6660ba` |
| G5 | `vazky_tune_les_pole.png` | 1536 × 1024 RGBA | `a5728456bec376fc52a7c0f85eddfeb75d78e653cf8e13f731b13d55ea3f334b` |

Czech alt texts on the slides follow the skripta alt texts:

- G1: „Malá tůň na louce po opětovném napuštění, obklopená pruhem rozpraskaného vyschlého bahna. Z vody vylézají drobné žabky po metamorfóze; na kameni je pozoruje žába s polním zápisníkem a pravítkem a vedle ní poletuje vážka. Ilustrace vytvořená pomocí AI.“
- G2: „Louka terénní stanice s několika velkými kulatými nádržemi s vodou, částečně zakrytými stínicí sítí. Na okraji nejbližší nádrže sedí žába se zápisníkem a na síti odpočívá vážka. Ilustrace vytvořená pomocí AI.“
- G4: „Pohled z kopce na krajinu s mnoha tůněmi a rybníčky v loukách, u polí i u lesa. V popředí stojí několik pokusných nádrží a žába ukazuje směrem k tůním v krajině; vážka letí od nádrží k tůním. Ilustrace vytvořená pomocí AI.“
- G5: „Dvě tůně v jedné krajině: vlevo stinná tůň v lese, vpravo slunná tůň mezi poli. V obou jsou na stoncích larvy vážek; žába u lesní tůně je vylovuje síťkou do misky a mezi tůněmi poletuje vážka. Ilustrace vytvořená pomocí AI.“

## New images to generate

Supply the active skripta images (S1–S4, version 2) as cast, colour and style references for every new image. Supply L10 `Presentation/Materials/ostrovy_titulni.png` only to the title image, and only as a composition, painterly-style and transparency reference, never as a source of subjects.

### G3 — `zabky_jedna_nadrz_mnoho_zabek.png` (slide 25)

- Prompt: Warm storybook natural-history watercolour/gouache illustration, landscape 4:3, transparent RGBA background with an irregular painterly vignette that fills most of the canvas. On a mown field-station meadow, the plains leopard frog field ecologist (brown-green frog with dark rounded spots and pale ridges along the back, small indigo notebook, plain measuring ruler) sits beside one round grey cattle tank filled with water and patiently measures a long queue of tiny froglets climbing out over the rim of that single tank, its notebook pages filling with blank lines of work. Behind it, a row of other identical round grey tanks stretches into the distance, untouched and quiet; the blue-green dragonfly assistant hovers above that row and gestures towards the other tanks. Gentle academic humour, natural anatomy, soft daylight. All froglets are the same size; the number of tanks in the row cannot be counted (the row fades into the distance). No text, letters, numbers, labels, arrows, charts, logos or watermarks; course colours only on the notebook and ruler.
- Alt: „Žába ekoložka trpělivě měří dlouhou řadu žabek, které lezou z jediné nádrže, zatímco vážka nad ní ukazuje na řadu dalších nádrží, ke kterým se zatím nikdo nedostal. Ilustrace vytvořená pomocí AI.“
- Acceptance: one tank clearly busy, many other tanks clearly untouched; no size differences between froglets; no text.

### G6 — `zabky_planovani_studie.png` (slides 27, 35a, 49a, 53a, 57)

- Prompt: Warm storybook natural-history watercolour/gouache illustration, square 1:1, transparent RGBA background with an irregular painterly vignette, designed to stay readable at about 220 px wide. The plains leopard frog field ecologist sits at a small folding field table at the edge of a meadow with a few small pools in the background, sketching in its indigo notebook beside an unfolded blank map that shows only simple outlines of several pools, with small pebbles placed on some of them as markers; the blue-green dragonfly assistant hovers over the map and points at one pool with a leg. A dip net with an indigo rim and a plain ruler lean against the table, still unused. Gentle academic humour, natural anatomy. No text, letters, numbers, labels, arrows, charts, logos or watermarks; the map carries only outlines.
- Alt: „Žába ekoložka u polního stolku plánuje studii nad prázdnou mapou s obrysy tůní, na které rozmisťuje oblázky; vážka ukazuje na jednu tůň a síťka zatím stojí opřená o stůl. Ilustrace vytvořená pomocí AI.“
- Acceptance: legible as "planning" at small size; the map has no writing; consistent cast.

### G7 — `zabky_jednotka_replikace.png` (human review batch 1)

- Prompt: Warm storybook natural-history watercolour/gouache illustration, landscape 4:3, transparent RGBA background with an irregular painterly vignette. At the rim of one round grey cattle tank filled with water, the plains leopard frog field ecologist holds a single tiny froglet gently and measures it with its plain ruler, notebook open beside it. Directly above, the blue-green dragonfly assistant hovers high and looks down at the whole tank as one object, its wings framing the tank from above; the composition makes the two scales obvious (one small animal close up, one whole tank from above). A few other froglets sit on the rim. Gentle academic humour, natural anatomy, natural colours; course colours only on the notebook and ruler. No text, letters, numbers, labels, arrows, charts, logos or watermarks.
- Alt: „Žába ekoložka měří pravítkem jednu žabku na okraji nádrže, zatímco vážka nad ní přehlíží celou nádrž shora. Ilustrace vytvořená pomocí AI.“
- Acceptance: the two scales (one froglet, one whole tank) read at a glance; no text.

### G8 — `zabky_sbor_jedne_nadrze.png` (human review batch 1)

- Prompt: Warm storybook natural-history watercolour/gouache illustration, landscape 4:3, transparent RGBA background with an irregular painterly vignette. On the rim of one round grey cattle tank, a row of tiny froglets sings in unison like a small choir, mouths open in the same shape, all facing the same way. The plains leopard frog field ecologist stands in front of them like a reporter, writing in its indigo notebook, its pages showing the same short scribble repeated (no letters, just identical wavy marks). The blue-green dragonfly assistant hovers beside the frog, holding one wing to its ear with an amused expression, as if to say it hears just one voice. Gentle academic humour, natural anatomy, natural colours. All froglets are the same size. No text, letters, numbers, labels, musical notes with letters, charts, logos or watermarks.
- Alt: „Žabky z jedné nádrže zpívají na jejím okraji jednohlasně jako sbor, zatímco vážka si přikládá křídlo k uchu a žába ekoložka si do zápisníku píše stále tutéž poznámku. Ilustrace vytvořená pomocí AI.“
- Acceptance: unison reads clearly (one tank, many identical voices); no letters; no size differences.

### G9 — `zabky_pevny_nahodny.png` (human review batch 1)

- Prompt: Warm storybook natural-history watercolour/gouache illustration, landscape 4:3, transparent RGBA background with an irregular painterly vignette. On a meadow, the plains leopard frog field ecologist carefully picks three distinct, clearly different wildflowers (for example a poppy, a cornflower and a daisy) out of a colourful bouquet, deliberately choosing these exact ones. Next to it, the blue-green dragonfly assistant draws small grey pebbles at random from a plain cloth bag with its eyes closed, a few pebbles already on the grass. The contrast is deliberate choice of specific items versus a random draw from many. Gentle academic humour, natural anatomy, natural colours; course colours only on the bag tie and notebook. No text, letters, numbers, labels, charts, logos or watermarks.
- Alt: „Žába ekoložka vybírá z kytice tři konkrétní květiny, zatímco vážka losuje oblázky z plátěného pytlíku. Ilustrace vytvořená pomocí AI.“
- Acceptance: "choosing specific ones" versus "drawing at random" is obvious; no text.

### G10 — `povodi_vapnik.png` (human review batch 1)

- Prompt: Warm storybook natural-history watercolour/gouache illustration, landscape 4:3, transparent RGBA background with an irregular painterly vignette. From a hilltop, the plains leopard frog field ecologist scatters a cloud of white powder (calcium) from a large scoop over one entire forested valley with a small stream, which is dusted white; directly next to it lies a second, similar forested valley that stays untouched and green. The blue-green dragonfly assistant flies between the two valleys, looking back and forth with a puzzled expression. Tiny maple seedlings are visible on the valley floors. Gentle academic humour, natural colours; course colours only on the scoop handle. No text, letters, numbers, labels, arrows, charts, logos or watermarks.
- Alt: „Žába ekoložka z vrcholku kopce sype bílý vápník na celé jedno lesní údolí; vedle leží druhé, neošetřené údolí a vážka mezi nimi přelétá. Ilustrace vytvořená pomocí AI.“
- Acceptance: exactly one treated and one untreated valley, both whole; no text.

### T — `zabky_titulni.png` (slide 1, title image)

- Format: portrait 3:4 (for example 1086 × 1448 px), PNG RGBA with genuine transparency and an irregular painterly vignette that fills almost the whole canvas, no large empty margins, no rectangular backdrop or sky fill; readable at about 380 px wide on the indigo title slide.
- Prompt: Warm storybook natural-history watercolour/gouache illustration, portrait 3:4, compact and tall. In the lower foreground, the plains leopard frog field ecologist sits on the rim of a round grey cattle tank with its indigo notebook and ruler while a few tiny froglets climb out over the rim; the blue-green dragonfly assistant hovers beside it. Rising behind them in the upper half: a small meadow pool with a band of cracked, pale dried mud that is refilling with water, and above it a gentle landscape dotted with many small pools and a few more cattle tanks fading into the distance. All froglets are the same size. Gentle academic humour, natural anatomy, natural colours; course colours only on equipment. No text, letters, numbers, labels, arrows, charts, logos or watermarks.
- Alt: „Žába ekoložka sedí na okraji pokusné nádrže, ze které lezou drobné žabky, a vedle ní poletuje vážka; za nimi se znovu plní vyschlá tůň s rozpraskaným bahnem a v dálce je krajina s mnoha tůněmi. Ilustrace vytvořená pomocí AI.“
- Reference assets: G1 (drying pool), G2 (tanks) and G4 (landscape of pools) for cast and setting; L10 `ostrovy_titulni.png` for composition and transparency only.
- Acceptance: portrait fills the title column; cast recognisable; no implied result; no text. A missing title image blocks public release.

## Illustration revision 2 (proposed 2026-10-23)

Requested by Ondřej Mottl on 2026-10-23: the first series looks too similar from image to image (the frog with notebook on a grey tank rim, the dragonfly hovering beside it, a green meadow behind, an eye-level medium shot and the same oval cut-out), and the treatment colours of the figures should appear in the pictures for consistency. The author approved writing the new prompts; generation and installation still need the author's review of the outputs. Slide numbers refer to the current 71-slide deck.

Scope: T, G2, G3, G6, G7, G8 and G9 are regenerated under the same file names, so the slides need no source change apart from updated alt texts. G1, G4 and G5 stay. G10 stays, because the calcium valley is already a distinct wide landscape and must not borrow the drying colours. If the skripta illustrations are removed, G1, G2, G4 and G5 become deck-only files and their provenance moves into this record.

### Shared rules for revision 2

- **Style anchor (unchanged):** warm storybook natural-history watercolour/gouache, gentle academic humour, natural anatomy, no text, letters, numbers, labels, arrows, charts, logos or watermarks. Transparent RGBA PNG with a painterly edge, but the silhouette differs per image (tall panel, wide panorama, round medallion, rectangular still life), not always the same oval vignette.
- **One viewpoint per image:** bird's-eye, cutaway, extreme close-up, wide landscape, top-down still life, stage-like dusk scene. No two images share both the viewpoint and the setting.
- **Light and palette per image:** drought heat, rain, morning mist, dusk lantern light, studio-like table light. Each image has its own dominant palette within the series style.
- **Cast used sparingly:** the plains leopard frog field ecologist appears in four of the seven new images (G2, G3, and only as a hand in G7 and G9), and the blue-green dragonfly in four (T, G7, G8, G9); they appear together only in G7 and G9, where frog appears only as a hand. Other images are carried by froglets, tadpoles, hands or objects only. When the frog appears, its notebook is indigo/purple (the model colour) and it may hold the plain ruler.
- **Treatment colour code, on equipment only:** each cattle tank wears a painted rim band, **steel blue (#2E6CA4)** for a tank that never dried and **terracotta (#C2613A)** for a tank that dried out and was refilled. The same two colours may appear on small field flags, bucket tags or map pins. Water, animals, plants and mud keep natural colours. Froglets near blue-band and terracotta-band tanks are always drawn the same size, and nothing hints at a result.
- **Other semantic colours:** grey for raw objects that stand for data (pebbles, plain tags), orange (#F2A516) only as one small focus accent per image, dark graphite for outlines of equipment.

### T — `zabky_titulni.png` (slide 1), revision 2

- Change: from a frog-on-tank scene to a tall two-zone composition with strong colour contrast and no frog.
- Prompt: Warm storybook natural-history watercolour/gouache illustration, tall portrait 3:4, transparent RGBA background with a painterly edge shaped like a tall arched panel. Upper half: a small prairie pool under harsh summer sun, its bed cracked into pale ochre plates with a terracotta (#C2613A) tint in the dry mud, a thin trickle of new rain water just beginning to refill it, heat shimmer in the air. Lower half: the same scene after refilling, seen through the rim of a round cattle tank wearing a painted terracotta band, cool clear water with a few tadpoles and three tiny froglets of identical size climbing out over the rim. The blue-green dragonfly assistant hovers between the two halves, linking them; no frog ecologist in this image. Natural colours for water, mud, plants and animals; the terracotta only as tint in the dried mud and on the painted rim band. Gentle, slightly dramatic light. No text, letters, numbers, labels, arrows, charts, logos or watermarks; nothing suggests which froglets are larger.
- Alt text: „Nahoře vyschlá tůň s rozpraskaným dnem, do které začíná přitékat voda, dole nádrž s cihlově červeným pruhem na okraji, plná vody, ze které vylézají tři stejně malé žabky. Mezi oběma částmi poletuje vážka. Ilustrace vytvořená pomocí AI.“

### G2 — `zabky_pokusne_nadrze.png` (slide 9), revision 2

- Change: introduces the treatment colour code on the physical tanks; morning mist instead of a sunny meadow; low eye-level view along a row of tanks.
- Prompt: Warm storybook natural-history watercolour/gouache illustration, wide landscape 3:2, transparent RGBA background with a soft rectangular painterly edge. Early morning mist at a prairie field station: a row of large round grey cattle tanks recedes diagonally into the mist, each tank with a painted rim band, alternating in no regular pattern between steel blue (#2E6CA4) and terracotta (#C2613A); some tanks are partly covered by shade cloth. In the foreground, one tank rim shows tadpoles and floating algae in clear water. The plains leopard frog field ecologist, small in the middle distance, walks along the row carrying a plain bucket with a small grey tag and its indigo notebook under its arm. No dragonfly in this image. Natural colours for water, grass and animals; course colours only on the rim bands, notebook and tag. The number of tanks cannot be counted (the row fades into the mist). No text, letters, numbers, labels, arrows, charts, logos or watermarks.
- Alt text: „Ranní mlha nad terénní stanicí: řada velkých kulatých nádrží s modrými a cihlově červenými pruhy na okrajích mizí v mlze. V popředí je v jedné nádrži vidět pulce a řasy, v dálce jde žába s kbelíkem a zápisníkem. Ilustrace vytvořená pomocí AI.“

### G3 — `zabky_jedna_nadrz_mnoho_zabek.png` (slide 26), revision 2

- Change: bird's-eye view instead of an eye-level queue; the metaphor is read from the pattern of tanks.
- Prompt: Warm storybook natural-history watercolour/gouache illustration, wide panorama 2:1, transparent RGBA background with a painterly edge. Bird's-eye view straight down on a mown meadow with a loose grid of many round cattle tanks seen from above as circles of water, each with a painted rim band in steel blue (#2E6CA4) or terracotta (#C2613A). At exactly one tank, the plains leopard frog field ecologist sits on the rim surrounded by a huge, untidy heap of filled notebook pages and many tiny froglets lined up for measurement, with one small orange (#F2A516) marker flag beside it as the focus accent. Every other tank is calm and untouched, with no notes and no visitors. Long late-afternoon shadows. Natural colours; course colours only on rim bands, notebook pages and the flag. All froglets are the same size. No text, letters, numbers, labels, arrows, charts, logos or watermarks.
- Alt text: „Pohled shora na louku s mnoha kulatými nádržemi s modrými a cihlově červenými okraji. U jediné nádrže sedí žába obklopená hromadou popsaných listů a řadou žabek čekajících na měření, všechny ostatní nádrže zůstávají nedotčené. Ilustrace vytvořená pomocí AI.“

### G6 — `zabky_planovani_studie.png` (slides 64–68), revision 2

- Change: a flat-lay icon without characters, so that the recurring mark of the parallel study reads at about 200 px and differs from every scene.
- Prompt: Warm storybook natural-history watercolour/gouache illustration, square 1:1, transparent RGBA background with a round medallion-shaped painterly edge, designed to stay readable at about 200 px wide. Top-down still life on a weathered wooden field table: an unfolded hand-drawn map with simple outlines of several pools, some surrounded by tiny painted trees and some by tiny painted field stripes; small round map pins in steel blue (#2E6CA4) and terracotta (#C2613A) stuck into some pools; a small dip net, a plain ruler, an indigo notebook lying closed, a pencil and one dragonfly larva in a small glass dish of water. No characters, no hands. Studio-like soft light from the upper left. No text, letters, numbers, labels, arrows, charts, logos or watermarks; the map carries only outlines and pins.
- Alt text: „Pohled shora na terénní stolek s ručně kreslenou mapou tůní u lesa a u polí, do které jsou zapíchnuté modré a cihlově červené špendlíky. Vedle leží síťka, pravítko, zavřený zápisník, tužka a miska s larvou vážky. Ilustrace vytvořená pomocí AI.“

### G7 — `zabky_jednotka_replikace.png` (slide 17), revision 2

- Change: two explicit scales in one picture (macro close-up versus whole tank from above) instead of one medium shot.
- Prompt: Warm storybook natural-history watercolour/gouache illustration, landscape 4:3, transparent RGBA background with a painterly edge. Left two thirds: an extreme close-up through a large round magnifying glass held by the frog's hand (only the hand and sleeve visible), showing one tiny froglet sitting on a plain wooden ruler, every skin detail and toe visible. Right third: the same scene from far above, as if seen by the blue-green dragonfly assistant flying high: one whole round cattle tank as a small circle of water with a painted steel blue (#2E6CA4) rim band, the tiny frog figure at its edge. The two parts are connected only by the dragonfly's flight path suggested by a faint trail of wing shimmer, not by an arrow. Bright midday light. Natural colours; course colours only on the rim band and the magnifier handle. No text, letters, numbers, labels, arrows, charts, logos or watermarks.
- Alt text: „Vlevo zblízka přes lupu jedna malá žabka na pravítku, vpravo z výšky celá nádrž s modrým pruhem na okraji jako malý kruh vody, nad kterou letí vážka. Ilustrace vytvořená pomocí AI.“

### G8 — `zabky_sbor_jedne_nadrze.png` (slide 24), revision 2

- Change: a dusk stage scene with its own indigo and amber palette instead of daylight; the dragonfly conducts, the frog is absent.
- Prompt: Warm storybook natural-history watercolour/gouache illustration, landscape 4:3, transparent RGBA background with a painterly edge. Dusk at the field station, deep indigo sky with the first stars, one small amber lantern on the rim of a round cattle tank wearing a painted terracotta (#C2613A) rim band. Along the lit rim, a row of tiny froglets of identical size sings in perfect unison, mouths open in exactly the same shape, all facing the same way like a small choir. The blue-green dragonfly assistant hovers in front of them as the conductor, holding a thin twig as a baton. In the dark background, other tanks are silent silhouettes. No frog ecologist. Natural anatomy; course colours only on the rim band; the lantern glow is the single orange accent. No text, letters, numbers, labels, musical notes, charts, logos or watermarks.
- Alt text: „Soumrak u nádrže s cihlově červeným pruhem na okraji: řada stejně velkých žabek na okraji osvětleném lucernou zpívá jednohlasně a vážka je diriguje větvičkou. Ostatní nádrže v pozadí mlčí. Ilustrace vytvořená pomocí AI.“

### G9 — `zabky_pevny_nahodny.png` (slide 56), revision 2

- Change: a close-up still life of two contrasting gestures instead of a meadow scene with the cast.
- Prompt: Warm storybook natural-history watercolour/gouache illustration, landscape 4:3, transparent RGBA background with a soft rectangular painterly edge. Close-up still life on a pale table, split into two halves by composition, not by a line. Left half: an open herbarium folder with exactly three carefully pressed, clearly different plant specimens (a grass, a clover and a buttercup), each fixed with a small paper strip; a frog's hand places the third specimen deliberately with tweezers. Right half: a plain grey cloth bag spilling many similar grey pebbles, with the blue-green dragonfly's leg drawing one pebble at random, the dragonfly's eyes playfully covered by one wing. One small orange (#F2A516) pin on the herbarium is the only focus accent. Soft north-window light. Natural colours; no treatment colours in this image. No text, letters, numbers, labels, arrows, charts, logos or watermarks; the paper strips are blank.
- Alt text: „Vlevo herbářová složka se třemi pečlivě vybranými a vylisovanými rostlinami, které žába přikládá pinzetou, vpravo šedý plátěný pytlík s oblázky, ze kterého vážka se zakrytýma očima náhodně vytahuje jeden oblázek. Ilustrace vytvořená pomocí AI.“

### Acceptance checks for revision 2

- Laid side by side, the seven new images and G1, G4, G5, G10 differ in viewpoint, light and silhouette; no two read as the same scene.
- Every tank that appears carries exactly one rim band in steel blue or terracotta, with no other tank colours; froglets near the two band colours are the same size.
- Purple appears only on the frog's notebook (and the G6 notebook), orange only once per image, and none of the images contains text or numbers.
- Each image still serves its teaching role on its slide, and the alt texts above replace the current ones in `Presentation/presentation.qmd` when the files are installed.

## Provenance of new images

All seven new images (T, G3, G6-G10) were generated on 2026-10-22 through OpenAI built-in `image_gen`; the underlying model identifier is not exposed. Exact submitted prompts, all reference paths and hashes, selected and rejected output identifiers, targeted edit prompts and PNG metadata are recorded in `GENERATED_IMAGE_PROMPTS_20261022_presentation.json`. The four reused V2 files were preserved.


| ID | File | Pixel size | SHA-256 |
|---|---|---|---|
| G3 | `zabky_jedna_nadrz_mnoho_zabek.png` | 1448 x 1086 RGBA | `1890591d796d6f062d8fe0bc66cdad65672584b61850273c67deb5ac12a81e6f` |
| G6 | `zabky_planovani_studie.png` | 1254 x 1254 RGBA | `48b328962246a5da0b829d3418231f3e73452b2d27d2cfdbacb1598d444e4ed3` |
| G7 | `zabky_jednotka_replikace.png` | 1448 x 1086 RGBA | `e4889799be836d31f1ff7fb9ff678a42bb393199ba7b208f482826b88586e7d4` |
| G8 | `zabky_sbor_jedne_nadrze.png` | 1448 x 1086 RGBA | `b022106895e17d82c26941c51fda6fe239210ef6227a7efb1cb3385c1d0bec29` |
| G9 | `zabky_pevny_nahodny.png` | 1448 x 1086 RGBA | `56041c2a76712be1031c5351e81eacdffeaea701662687db470d7adae4e53bb6` |
| G10 | `povodi_vapnik.png` | 1448 x 1086 RGBA | `32f266ef560681bf30c76c1a8e93bea16b42d871dd046775d8f15b20db49f1ee` |
| T | `zabky_titulni.png` | 1086 x 1448 RGBA | `d1953c2b09eb7f070ec1f5f410b7ccb291c7ce7840a733accabbb8db474d3b88` |

Author asset QA: all seven selected outputs were visually inspected against their scene and acceptance criteria. G7 received a targeted edit removing a duplicated dragonfly abdomen; G9 received a targeted edit removing an extra frog forelimb while retaining the three flower types. G10 received two cleanups: the first left residual floating marks, so the selected second edit repainted the dragonfly without the marks. These rejected/intermediate outputs are recorded but not installed. The G8 notebook contains only the repeated nonletter wavy marks explicitly requested by its metaphor. All organisms and habitats retain natural colours; indigo, parchment, graphite and small orange accents are used on equipment.

All selected files are genuine RGBA PNGs at their planned aspect ratios, have fully transparent exterior pixels, and are byte-identical to the selected generated outputs. Source hashes, reference hashes and UTF-8 encoding were verified. Reuse follows the CC BY 4.0 educational-content terms and course attribution in `../../LICENSE.md`, retaining Czech alternative text and the visible AI disclosure already present in the presentation source. Rendered placement QA is recorded below when completed. This image-generation QA does not replace complete-presentation independent review or human approval.


## Rendered placement QA - 2026-10-22

The presentation was rebuilt through `R/render_presentation.R` using the existing theme (`biostat.theme_sync_complete = TRUE`) and `POLLSLIVE_RENDER_MODE=offline`. Both HTML variants and the 67-page PDF exported successfully. `Presentation/presentation.html` and `docs/index.html` are byte-identical. The source remained unchanged during the final render; its hashes and output hashes are recorded in the JSON.

All 11 occurrences of the seven new images were verified in the generated HTML. Both `src` and Reveal lazy-loaded `data-src` were checked; these figures are embedded in `data-src`, and every embedded PNG matches the saved asset SHA-256. Every occurrence has meaningful alternative text and a visible AI disclosure. The four reused V2 PNGs remain byte-identical to their learning-materials sources.

Rendered image placement was inspected on PDF pages 1, 18, 24, 26, 28, 37, 56, 58, 60, 61 and 65. The initial slide-28 planning icon pushed its AI disclosure below the page; only that chunk (`zobrazit-planovani-2`) was reduced from 100% to 75% out-width, then the complete deck was rebuilt and audited again. Full-size inspection confirmed the complete caption and footer clearance on slide 28. No student-facing prose, analytical code or shared theme source was changed. This is an asset and placement check; complete-presentation independent review and human approval remain separate workflow steps.


## Revision 2 generation receipt - 2026-10-23

At the author's request to generate the updated plan, all seven replacement candidates (T, G2, G3, G6, G7, G8 and G9) were generated and saved under `versions/revision-2-20261023/`. Open `versions/revision-2-20261023/review.html` for the review gallery or `REVIEW_OVERVIEW.png` in that folder for the set beside retained images. The complete execution record is `versions/revision-2-20261023/GENERATED_IMAGE_PROMPTS_20261023_revision2.json`; its README lists filenames, pixel sizes, SHA-256 and asset QA.

Status: **candidates generated; author output review pending; not installed**. The plan explicitly retains author review of the outputs before installation, so active images, slide alt texts and rendered outputs were preserved. All seven PNGs passed aspect-ratio, RGBA transparency, output-hash and reference-hash checks. Targeted corrections were applied to G2 band ordering, G8 single-colour rim bands and G9 wing anatomy; intermediate drafts were retained. No R render was run because the candidates are not yet installed. This is asset QA and does not replace human approval or complete-presentation review.

## Revision 2 installation - 2026-10-23

Ondřej Mottl reviewed the seven revision 2 candidates (overview `versions/revision-2-20261023/REVIEW_OVERVIEW.png`) and approved installing all of them on 2026-10-23. The candidates were copied unchanged over the active files, and the replaced first-series files were archived unchanged in `versions/revision-1-20261022/`. The active files now match the candidate SHA-256 values listed in `versions/revision-2-20261023/README.md`:

| ID | File | Pixel size | SHA-256 (first 16) |
|---|---|---|---|
| T | `zabky_titulni.png` | 1086 x 1448 RGBA | `947a5c84f020f3db` |
| G2 | `zabky_pokusne_nadrze.png` | 1536 x 1024 RGBA | `8c60b250bf00e25d` |
| G3 | `zabky_jedna_nadrz_mnoho_zabek.png` | 1774 x 887 RGBA | `56bcf1c6c7ba31c5` |
| G6 | `zabky_planovani_studie.png` | 1254 x 1254 RGBA | `83e1d5d4fdda706c` |
| G7 | `zabky_jednotka_replikace.png` | 1448 x 1086 RGBA | `bd9e5be3e964d735` |
| G8 | `zabky_sbor_jedne_nadrze.png` | 1448 x 1086 RGBA | `ff7ef8d125f9ee0f` |
| G9 | `zabky_pevny_nahodny.png` | 1448 x 1086 RGBA | `7c06df0e1962e894` |

The Czech alt texts of revision 2 replaced the old ones in `Presentation/presentation.qmd` (11 occurrences, including the five uses of G6). G2 is no longer byte-identical to the skripta image S2; the deck file is the revision 2 version. G1, G4, G5 and G10 are unchanged.
