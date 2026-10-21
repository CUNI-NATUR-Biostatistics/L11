# Stage 1 - Dataset research and decision

## Metadata and Git checkpoint

- Week: L11
- Date: 2026-10-21
- Author: Claude (Claude Code), working with Ondřej Mottl
- Reviewer: Ondřej Mottl
- Branch: `lesson/l11-scope-data`, based on `main` at `2cf481f`; Stage 0 record present on the branch (uncommitted)
- `git status --short` reviewed before research: [x] (only the Stage 0 record and stage log changed)
- Stage 0 record is on this branch: [x]
- Decision status: **approved and locked**
- Human approval: Ondřej Mottl, 2026-10-21 — Ward et al. (2023) froglets selected as recommended
- Planning PR: not created

## Inspiration consulted

- Relevant sources: [CUNY Biostatistics, linear model extensions](https://jsgosnell.github.io/cuny_biostats_book/content/chapters/Linear_model_extensions.html) (oysters in tanks under predator cues; feathers of 16 birds) and [Modern Statistics with R, regression](https://www.modernstatisticswithr.com/regression.html) (section 8.8, mixed models); the 2025/26 course deck `_internal/prezentace/stare/10_design_pokusu_nahodne_efekty.pdf` (grazed versus ungrazed enclosures; split-plot df rule).
- Dataset-selection pattern worth borrowing: CUNY's "is n 75 oysters or 3 tanks?" — a treatment applied to a whole container, with many organisms measured inside it, makes the unit of replication physically visible.
- What to avoid from those sources: simulated data presented as the main story (CUNY oysters); designs with too few units at the treatment level to fit anything honest (CUNY 3 tanks; old deck examples without data).

## Dataset requirements

Derived from the five approved outcomes and the locked scope:

- real biological data with a clear two-level hierarchy: several organisms or measurements per group;
- about 10-30 groups (15 or more preferred for `glmmTMB` Wald intervals), unequal but not extreme group sizes;
- a numeric continuous response suitable for a normal linear model (no counts or proportions; L12);
- a predictor that varies **between** groups, with visible between-group variability (ICC roughly 0.15-0.7), so that the all-rows `lm()` clearly understates the SE while the estimate stays comparable;
- ideally a predictor that varies **within** groups, so the gain from modelling the grouping is also visible;
- groups that are plausibly a sample of possible groups (random-factor argument natural);
- documented provenance, explicit reuse terms, stable scripted access, little missingness.

## Broad discovery gate

- Independent source families consulted: LTER network data via CRAN `lterdatasampler` (Plum Island, Hubbard Brook, Konza Prairie, Niwot Ridge, Andrews Forest); Dryad (CC0 datasets, retrieved through their Zenodo mirrors); base R `datasets`; CRAN `lme4`; CRAN `nlme`; CRAN `MASS`; the CUNY Biostatistics book; the 2025/26 course materials; the L07 archive (raw Cao et al. 2025 table).
- Credible examples reviewed: 15 (13 numerically probed).
- Established course/tutorial examples included: [x] (CUNY oysters and feathers, `sleepstudy`, `ChickWeight`, `Orthodont`, `MASS::oats`)
- Primary dataset documentation or domain repositories included: [x] (Dryad/Zenodo records with README files, LTER package documentation)
- Minimum of 8 examples from at least 4 independent source families reached without padding: [x]
- Access note: the Dryad API and website download links now refuse scripted downloads (HTTP 401 "must have current bearer token", 403 for `file_stream`), and the EDI PASTA search service refuses public scripted queries. Zenodo mirrors of Dryad records download without authentication and keep the CC0 licence; all Dryad files below were read from those mirrors.
- Search path note (preferred order): Czech public-life sources (ČSÚ, volby.cz) were considered first. Their natural hierarchies (municipalities in districts, districts in regions) come either with bounded proportions as responses (turnout, shares; L12 territory) or as already aggregated statistics without the lower-level units, so the "many rows, few independent units" story cannot be shown with an individual-level continuous response. They were not probed numerically.

"SE ratio" is the SE of the predictor's effect in the honest analysis (group-mean `lm()` or random intercept) divided by the naïve all-rows `lm()` SE. ICC is the share of residual variability between groups in a `glmmTMB` random-intercept model fitted with `REML = TRUE`.

| Source | Dataset / example | Variables and model | Unit and sampling story | Probe | Useful pattern | Main complication | Decision |
|---|---|---|---|---|---|---|---|
| Dryad `10.5061/dryad.hx3ffbgkn` (Zenodo 8083635), Ward et al. 2023, *Freshwater Biology*, CC0 | Prior drying of mesocosms, metamorph data | metamorph dry mass (g), snout-vent length (mm) ~ drying treatment (dried-refilled vs not); day of emergence | 485 froglets of *Lithobates blairi* from 16 tanks (8 dried, 8 non-dried) with 50 tadpoles each; Wichita State University field station, Kansas, 2021 | ICC 0.25-0.29; SE ratio 2.98 (mass), 3.04 (length), 3.16 (log mass); estimate stable (−3.5 vs −3.7 mm); tank means of the two treatments do not overlap | treatment applied to a whole tank, tangible unit of replication; topical (ponds drying in droughts); emergence day varies within tanks | 16 tanks only; residuals right-skewed (length 1.8, log mass 2.4); dried tanks produced more froglets (295 vs 190), so density is confounded with treatment | **finalist 1** |
| CRAN `lterdatasampler` / Plum Island LTER (EDI DOI 10.6073/pasta/4c27d2e778d3325d3830a5142e3839bb; study DOI 10.1002/ece3.5883) | `pie_crab` (L05 individual data) | carapace width (mm) ~ latitude, ~ water temperature | 392 male *Minuca pugnax* from 13 salt marshes, 25-37 per marsh, summer 2016 | ICC 0.16; SE ratio 2.37 (latitude), 2.88 (water temperature); estimate 0.485 → 0.490 mm per degree; residuals symmetric (Shapiro p 0.67) | fulfils the explicit L05 promise; numeric site-level predictor; group-mean `lm()` and random intercept give the same SE | students already know the data and the result; 13 sites only; no predictor that varies within marshes | **finalist 2** |
| Dryad `10.5061/dryad.qbzkh18r4`, Cao et al. 2025, *Ecography*, CC0 (raw table in `L07-archive/Temp/dataset-probes/herb-trait.csv`) | knotweed traits, both common gardens | leaf thickness (mm), toughness ~ mean annual temperature of origin (population level); ~ garden (within population); blocks within gardens | 981 plants of 128 source populations of *Reynoutria japonica* grown in Shanghai and Yunnan gardens in 5 blocks each; 1-8 plants per population and garden | Shanghai only: ICC 0.68, SE ratio 1.80 (thickness); toughness p 0.0006 → 0.02; garden within population: SE ratio 0.47 | both directions in one design (between-population climate, within-population garden), plus blocks; explains the unexplained L07 averaging | repeats the L07 primary dataset; crossed garden × population and blocks invite out-of-scope structures; small numbers in mm | **finalist 3** |
| CRAN `lterdatasampler` / Andrews Forest LTER (`and_vertebrates`) | Mack Creek cutthroat trout, 2017 | length (mm) ~ clear-cut vs old-growth section | 622 trout in 29 channel units of two forest sections | ICC 0.24; SE ratio 2.6; **p 0.0006 → 0.26** | pseudoreplication can reverse a conclusion | logging history applies to the two sections, so even channel units do not replicate the treatment (true n = 2); mixed age classes | reject as main (teaching pattern) |
| CRAN `lterdatasampler` / Hubbard Brook (`hbr_maples`) | sugar maple seedlings | stem length ~ calcium-treated vs reference watershed | 240 seedlings, 12 transects, 2 watersheds, 2003 | transect ICC ≈ 0; SE unchanged | classic Hurlbert case: one treated and one reference watershed | treatment replicated only once; no model rescues it | reject as main (teaching pattern for "the design decides") |
| CRAN `lterdatasampler` / Konza Prairie (`knz_bison`) | bison weights | weight ~ age, females 1-6 years | 2,602 weighings of 1,028 animals | model fit failed (non-positive-definite Hessian); median 2 records per animal | repeated measures in a wild population | convergence failure, mostly 1-2 records per animal, nonlinear growth | reject |
| CRAN `lterdatasampler` / Niwot Ridge (`nwt_pikas`) | pika stress hormones | glucocorticoid concentration ~ elevation | 109 samples at 20 stations, 3 sites | station variance ≈ 0; no effect | none | nothing to show | reject |
| Dryad `10.5061/dryad.76hdr7sw1` (Zenodo 4589269), Rudolf & Eveland 2021, CC0 | predator diversity mesocosms | tadpole SVL ~ predator (*Anax*) presence | 6,217 *Bufo* and 466 *Rana clamitans* tadpoles in 48-60 tanks, randomized blocks | *Bufo* ICC 0.004; *Rana* ICC 0.33, SE ratio 2.1; no treatment effect | blocked tank experiment | nine-level factorial design, no visible effect, uneven survival | reject |
| Dryad `10.5061/dryad.97vq77g` (Zenodo 5003663), CC0 | piping plover Bergmann's rule | mass, wing ~ latitude, temperature | 4,383 captures of individuals across flyways and seasons | not probed | Bergmann's rule with individuals | no site identifier; latitude and temperature only standardized; four flyway × season groups | reject |
| Dryad `10.5061/dryad.3fh816m` (Zenodo 5005106), CC0 | false blister beetle *Oedemera sexualis* | elytron length ~ latitude | 22 Japanese populations | only 11 (males) and 15 (females) populations match between sheets; ICC 0.04-0.08 | latitudinal cline with individuals | data cleaning needed; weak grouping; obscure organism | reject |
| base R `datasets` (Crowder & Hand 1990) | `ChickWeight` | weight ~ time (within chick); ~ diet (between chicks) | 578 weighings of 50 chicks on 4 diets | time: SE ratio 0.73; diet 3 vs others (days ≥ 10): SE ratio 1.95, p 1e-6 → 0.01 | both directions in one familiar base-R dataset | curved growth and widening spread (L10 problems resurface); poultry husbandry story | reject (backup for the within direction) |
| CRAN `lme4` (Belenky et al. 2003) | `sleepstudy` | reaction time ~ days of sleep deprivation | 180 measurements of 18 people | SE ratio 0.65 (within) | relatable repeated measures | human study; strong random slopes are the real story; within direction only | reject |
| CRAN `nlme` (Potthoff & Roy 1964) | `Orthodont` | jaw distance ~ age (within), ~ sex (between) | 108 measurements of 27 children | sex: SE ratio 1.44; age: 0.57 | both directions in a small table | dental measurement of children; four ages only | reject |
| CRAN `MASS` (Yates 1935) | `oats` | yield ~ nitrogen, varieties on whole plots in 6 blocks | 72 subplots in 18 whole plots | nitrogen within whole plot: SE ratio 0.60 | classic split-plot | agricultural; only 6 blocks; split-plot error strata are out of scope | reject |
| CUNY book; 2025/26 course deck | oysters in tanks; grazing enclosures | design illustrations | simulated or schematic | not applicable | the physical picture of the replication unit | not real data | teaching pattern only |

## Finalist comparison

| Finalist | Learning-outcome fit | Student relevance | Interpretability | Stepwise buildability | Practical feasibility | Main risks | Rank |
|---|---|---|---|---|---|---|---|
| Ward et al. froglets in tanks | Outcomes 1-5: tank as the unit of replication is physical and obvious; drying varies only between tanks; emergence day varies within tanks; tanks are naturally "a sample of possible ponds" (random factor) | Ponds and pools drying out in droughts, amphibian decline — topical in Czech landscapes | Body length in mm and dry mass in g; one binary treatment (L06 skill) | photo/diagram of tanks → all froglets → tank means → naïve lm vs tank means → random intercept → fixed or random → conclusion | 485 rows, no missing values, CC0, Zenodo download without login; Excel source needs one conversion step | 16 tanks; right-skewed residuals; density confounded with drying; within-tank emergence effect changes strongly once tanks are modelled (between versus within confusion) | **1** |
| L05 salt-marsh crabs | Outcomes 1-5 for the between direction; fixed versus random arguable (marshes as a sample of marshes) | Students know the Bergmann story; explicit promise from L05 | Very clear; numeric predictor | callback to L05 means → individual crabs → naïve lm → marsh means → random intercept | data already distributed with L05; CRAN package with documentation | no new data story; 13 groups; no within-marsh predictor, so the "grouping helps" block needs a second example | **2** |
| Raw knotweed traits | Outcomes 1-5 including both directions and blocks in one design | Known invasive plant; L07 callback | Climate of origin is understandable; garden effect intuitive | L07 means → raw plants → naïve lm → population means → random intercept → garden within population | 981 rows, CC0, raw table already in the L07 archive | repeats the L07 primary dataset; crossed and blocked structure invites scope creep; tiny numbers (hundredths of mm) | **3** |

## Numerical and practical feasibility probes

All probes ran in an untracked scratch library (`glmmTMB` 1.1.15.2, R 4.5.1) outside the lesson repository. The null-world false-alarm rates below are internal checks of the planned `glmmTMB` route only; the simulation is not part of the lesson (Stage 0 decision 6).

### Finalist 1: Ward et al. froglets (`Frog_Metamorph_Data_Dryad.xlsx`)

- Provenance, reuse, access: Ward, Burkhead, Stybr-Burrus & Luhring (2023) "No free refills: prior drying and vertebrate colonization alter ecological functioning and vertebrate fitness within experimental aquatic systems", *Freshwater Biology*; data Dryad `10.5061/dryad.hx3ffbgkn`, CC0, mirrored at Zenodo record 8083635 (direct file URL works without authentication). README documents all ten columns.
- Observational unit and sampling story: one froglet (*Lithobates blairi*, plains leopard frog) at metamorphosis. 64 cattle tanks of 1,000 l were crossed 4 trophic treatments × 2 drying treatments; froglets emerged only from the 16 amphibian-only tanks (8 dried-refilled, 8 never dried), 11-47 per tank.
- Variables: tank, treatment, individual, date and day of emergence, wet mass (g), snout-vent length (mm, integers), dry mass (g, derived from cup weights).
- Missingness and data check: no missing values; dry mass 0.088-0.851 g with a long right tail (99th percentile 0.55 g); SVL 19-35 mm.
- Main model (SVL ~ drying): naïve `lm()` −3.51 mm, SE 0.199, df 483, p 5e-54; tank means −3.76 mm, SE 0.617, df 14, p 3e-5; random intercept −3.73 mm, SE 0.604. SE ratio 3.0. All 8 dried tanks have smaller mean length (23.0-26.7 mm) than all 8 non-dried tanks (26.3-30.6 mm) — the effect survives the honest analysis, but its precision is three times lower.
- Dry mass behaves the same way (SE ratio 3.0; log mass 3.2). REML versus ML SE 0.023 versus 0.021.
- Internal null-world check (300 simulations from the fitted random-intercept model with no effect): `glmmTMB` Wald test rejects in 6.3 %, naïve `lm()` in 51.7 %.
- Residual diagnostics: individual residuals right-skewed (SVL 1.8, log mass 2.4, wet mass 3.8) because a few froglets are much larger; tank baselines roughly symmetric (0.36). This is an honest L10 callback but needs a careful diagnostic message.
- Within-tank predictor: day of emergence; slope 0.0022 g per day ignoring tanks, 0.0095 with tanks (SE ratio 0.78). Dried tanks produced froglets later and smaller, so the between-tank and within-tank relationships differ — powerful but possibly too much for the main route.
- Confounding: dried tanks produced more froglets (295 vs 190; correlation of tank count with tank mean mass −0.64). Drying and density cannot be separated with these data — a natural L07 callback for the conclusion.

### Finalist 2: L05 salt-marsh crabs (`lterdatasampler::pie_crab`)

- Provenance, reuse, access: Plum Island Ecosystems LTER, EDI DOI 10.6073/pasta/4c27d2e778d3325d3830a5142e3839bb, associated study DOI 10.1002/ece3.5883; packaged in CRAN `lterdatasampler`, whose licence record declares the teaching samples CC0 (as verified in `L05/data/README.md`); already distributed in `L05/data/pie_crab.csv`.
- Observational unit and sampling story: one adult male crab; 13 salt marshes from Florida to Massachusetts, 25-37 crabs each.
- Main model (size ~ latitude): naïve 0.485 mm per degree, SE 0.034, df 390, p 4e-38; marsh means 0.490, SE 0.080, df 11, p 7e-5; random intercept 0.489, SE 0.080, Wald p 8e-10. Water temperature gives SE ratio 2.9.
- Internal null-world check: Wald 5.0 %, naïve 41 %. REML versus ML SE 0.080 versus 0.073.
- Residuals symmetric (skewness −0.15, Shapiro p 0.67); marsh baselines symmetric.
- Teaching opportunities and complications: the cleanest numbers and the direct answer to the L05 promise; but students know the outcome, only 13 groups, and no within-marsh predictor.

### Finalist 3: raw knotweed traits (`herb-trait.csv`, Cao et al. 2025)

- Provenance, reuse, access: Dryad `10.5061/dryad.qbzkh18r4`, CC0; raw table kept in the L07 archive; climate of origin from the approved L07 table (CHELSA-BIOCLIM 2.1, CC0).
- Observational unit and sampling story: one ramet grown from a rhizome of one source population; 128 populations from China, Japan, Europe and North America grown in two common gardens (Shanghai 518 plants, Yunnan 463 plants), 5 blocks per garden.
- Main model (Shanghai, thickness ~ temperature): naïve −0.0091 mm per °C, SE 0.00046; population means −0.0091, SE 0.00085; random intercept −0.0092, SE 0.00083; ICC 0.68. Leaf toughness: p 0.0006 → 0.02.
- Within direction: thickness ~ garden with population random intercept, SE ratio 0.47.
- Internal null-world check: Wald 3.7 %, naïve 29 %. Residuals symmetric (Shapiro p 0.10).
- Teaching opportunities and complications: the most complete design, but it reuses L07 and the garden × population × block structure is more than the scope needs.

## Approved decision

Ondřej Mottl approved the recommendation below on 2026-10-21 without changes.

- **Approved dataset:** Ward et al. (2023) froglets, Dryad `10.5061/dryad.hx3ffbgkn` (CC0), article [doi:10.1111/fwb.14157](https://doi.org/10.1111/fwb.14157), prepared as `data/zabky_nadrze.csv` by `R/prepare_frog_data.R`.
- **Approved response:** `delka_tela_mm` (snout-vent length); `hmotnost_sucha_g` available as a secondary response.
- **Key predictor:** `vyschnuti` (`vyschla` / `nevyschla`), varying only between the 16 tanks (`nadrz`); `den_pokusu` as the candidate within-tank variable, to be judged in Stage 2.
- **Main biological question:** Vylézají z tůní, které vyschly a znovu se naplnily, menší žabky — a kolik nezávislých odpovědí nám dává 485 žabek z 16 nádrží?

### Acquisition and provenance

- `R/prepare_frog_data.R` downloads `Frog_Metamorph_Data_Dryad.xlsx` from the Zenodo mirror of the Dryad record (Zenodo record 8083635), verifies SHA-256 `cc879383de5a35a7ee57c9e6b446bb9c364bc9fd7007452e55ba39ea06f2fef4`, and reads it with `readxl` (already in the template `renv.lock`; no new packages).
- The script recodes the treatment (`A:DR` → `vyschla`, `A:ND` → `nevyschla`), translates column names into Czech, drops the two cup-weighing intermediates, and rounds dry mass to 0.001 g to remove floating-point noise from the subtraction (`0.20099999999999996` → `0.201`). All 485 rows and every recorded value are kept. Integrity checks: dry mass equals final minus cup weight exactly; experiment day equals the date minus 8 May 2021; no duplicate tank-individual pairs; 8 tanks per treatment; no missing values.
- Output SHA-256 of `data/zabky_nadrze.csv`: `bcb29dd70ec68357fee309a82eced115e217caf8c582730a2da290ab0df88011`, identical on a second run. The prepared table reproduces the probe numbers exactly (naïve −3.51 mm, SE 0.199; tank means −3.76 mm, SE 0.617; random intercept −3.73 mm, SE 0.604).
- `data/README.md` documents the source, the experimental design, the column meanings, the preparation and the CC0 terms in Czech; `website-release.yml` publishes the table and its README; the public `README.md` describes the L11 data story and the five approved outcomes.

### Environment note

- A fresh clone of the template has no `renv/library/` directory (it is git-ignored), and the renv 1.1.8 bootstrap then fails ("Failed to find an renv installation: the project will not be loaded"). A `renv::restore()` run in that state silently used the user library and downgraded `cpp11` (0.5.5 → 0.5.3) and `ps` (1.9.3 → 1.9.1) there; both were reinstalled at their previous versions. Creating `renv/library/windows/R-4.5/x86_64-w64-mingw32` fixed the bootstrap; the project library was then restored from the lockfile. Recommendation for `_L-template`: document this step or make the bootstrap create the directory.
- `renv::status()` reports that `glossary`, `showtext` and `sysfonts` are used but not recorded in the inherited lockfile. This is inherited from the template and left for the Stage 2 environment setup.

## Recommendation (approved)

- **Recommended main dataset:** Ward et al. (2023) froglets from drying experiment tanks, prepared as a Czech teaching table under `data/` with a reproducible Zenodo acquisition script.
- **Response:** snout-vent length of a froglet at metamorphosis (mm); dry mass (g) as a secondary response for the diagnostics and L10 callback.
- **Key predictor:** prior drying of the tank (dried-refilled vs never dried), varying only between tanks; day of emergence as the within-tank variable for the "grouping helps" block if the between/within difference proves teachable in Stage 2.
- **Main biological question:** Do froglets from ponds that dried out and refilled leave the water smaller — and how many independent answers do 485 froglets from 16 tanks really give us?
- **Why it is best for this week:** the unit of replication is a physical object students can picture (a tank), the honest analysis keeps the effect but triples its SE, the tanks are naturally a sample of possible ponds (random-factor argument), the topic is new and topical, and the data are CC0 with scripted access.
- **Role of the L05 crabs:** a short callback that fulfils the L05 promise (the marsh means students already used were the honest analysis), in the written materials and possibly in the PollsLive retrieval or exercise.
- **Alternatives kept:** L05 crabs as the main dataset if a numeric predictor and perfectly clean residuals matter more than novelty; raw knotweed if one design should carry both directions and blocks.

## Decision checklist

- [x] At least 4 independent source families were consulted
- [x] At least 8 credible examples were reviewed without padding trivial variants
- [x] Exact variables, observational units, sampling stories, provenance and reuse conditions were checked
- [x] Three finalists were compared and numerically probed
- [x] Rejection reasons and transferable teaching patterns were recorded
- [x] Human reviewer approved the selected dataset (Ondřej Mottl, 2026-10-21)
- [x] Dataset locked for implementation
- [x] Acquisition script, `data/README.md` provenance and release metadata prepared
- [ ] `_L-template.Rproj` renamed to `L11.Rproj` with `git mv` (waits for staging authorization; README already refers to `L11.Rproj`)
- [ ] Diff contains only Stages 0-1 records and intended planning changes
- [ ] Planning PR ready for human review
- Notes: Exploratory probes and downloads are untracked and live outside the lesson repository.
