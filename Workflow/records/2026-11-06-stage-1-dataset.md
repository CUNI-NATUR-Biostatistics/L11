# Stage 1 - Dataset research and decision

## Metadata

- Week: L11 (GLM: binární a početní odezva)
- Date: 2026-11-06
- Author: Claude (Claude Code), working with Ondřej Mottl
- Reviewer: Ondřej Mottl
- Status: **approved and locked** (finalist A, mistletoe on oak stems in Podyjí)
- Human approval: Ondřej Mottl, 2026-11-06 ("I approve the dataset")

## Git checkpoint

- Stage group: Stages 0-1 planning
- Branch: `lesson/l11-scope-data`
- Base branch and commit: `main` at `49d93ed`; Stage 0 committed as `4ff0510`
- `git status --short` reviewed: [x]
- Stage 0 record is on this branch: [x]
- Planning PR: not created

## Inspiration consulted

- Relevant sources from `_internal/obecne/nove/biostatistics_course_inspiration_hub.md`:
  - [Modern Statistics with R](https://www.modernstatisticswithr.com/regression.html): GLM chapters with shark-attack counts, `MASS::ships` and wine colour;
  - [CUNY Biostatistics book, linear model extensions](https://jsgosnell.github.io/cuny_biostats_book/content/chapters/Linear_model_extensions.html): garter snakes and amphipod colonisation, where one file is used for a binomial and then a Poisson model.
- Dataset-selection pattern worth borrowing: one study that yields both a binary and a count response from the same observational unit, so the lesson moves from "is it there?" to "how many?" without changing the setting (CUNY).
- What to avoid from those sources: examples without a biological question (ships, wine, quakes); categorical-only predictors that hide the S-curve; data with an unclear reuse licence.

## Broad discovery gate

- **Dataset needs derived from the weekly outcomes:**
  - a binary response with both outcomes represented across a numeric predictor, where `lm()` on 0/1 visibly predicts outside 0–1;
  - a count response with zeros, where `lm()` predicts negative values and overdispersion is present but moderate;
  - one clear numeric predictor plus a second one for an AIC comparison;
  - independent units without hidden grouping that would force random effects;
  - open licence, preferably Czech or Central European;
  - per Stage 0 decision D2, one data story that supplies both responses.
- **Independent sources consulted: 12 origins.**
  - Textbooks and tutorials: Modern Statistics with R; CUNY Biostatistics book; Agresti / Brockmann (horseshoe crabs); Sleuth3; Faraway; DAAG.
  - Primary repositories: Dryad via its Zenodo mirror (six datasets).
  - Package documentation: `vegan`, `mvabund` and `ade4`.
- **Credible examples reviewed: 16**, plus two Czech Dryad records checked by metadata.
- Established course/tutorial examples included: [x]
- Primary dataset documentation or domain repositories included: [x]
- **Method:** the scan was run by a read-only research subagent (Sonnet) on 2026-11-06. The author verified the finalists' numbers again in a scratch R library with `glmmTMB` 1.1.15.2.
- **Not searched:** Czech national sources (AOPK/NDOP, ČSÚ, the bird atlas), because their reuse terms or structure (presence-only records) rarely fit; and GBIF. Finalist A is Czech data from a public repository.

| Source/tutorial | Dataset or example | Exact variables/model | Observational unit and population/sampling story | Useful pattern | Main complication | Keep/Reject |
|---|---|---|---|---|---|---|
| Dryad `10.5061/dryad.vk283` (CC0); Matula et al. 2015, PLoS ONE 10: e0127055 | *Loranthus europaeus* on sessile oak, Nad Šobesem, Podyjí NP | `Infected` (0/1), `No of mistletoes` (0–7); `DBH (cm)`, distance to nearest infected stem, competition index | One oak stem; all 1,015 stems ≥ 7 cm DBH on a 2.37 ha plot | Both responses from one unit; Czech national park; bird-dispersal story (mistle thrush) | Stems nested in 710 coppice trees, no tree ID; spatial contagion; low prevalence (9.5%) | **Keep – finalist A** |
| Same record, whole-tree file (CC0) | Mistletoe per tree | `infected` (0/1); basal area, number of stems, competition | One tree (710) | No stem nesting | Binary only; no count | Keep – finalist C (variant) |
| Agresti, *Categorical Data Analysis*, from Brockmann 1996 (*Ethology* 102: 1–21); `GLMsData::hcrabs`, `glmbb::crabs` | Horseshoe crab satellites | `Sat` (count), `Sat > 0` (0/1); `Width`, `Wt`, `Col`, `Spine` | One nesting female (173) | Classic GLM teaching data, both responses, full S-curve | Data licence unstated (package licences cover code only); crabs already used in L05 | Keep – finalist B (licence blocker) |
| `vegan::mite` (Borcard et al. 1992) | Oribatid mite *Galumna* sp. 1 | presence and count; water content, substrate density | One soil core (70) | Both responses | n = 70; spatial autocorrelation; data licence unstated | Reject (small, licence) |
| Dryad `10.5061/dryad.rbnzs7hc0` (CC0) | Kodiak cod and rockfish nematodes | infection, parasite counts; total length | One fish (232) | Infection plus parasite load | 10 host species pooled (hidden grouping); dispersion 12; length not predictive | Reject |
| Dryad `08kprr58f` (CC0) | Moose ticks and endoparasites | tick presence, tick count; age, sex | One hunted moose (174) | Both responses | 8 regions (hidden grouping) | Reject |
| `DAAG::frogs` (Hunter 2000) | Southern corroboree frog | `pres.abs`; altitude, distance, number of pools | One site (212) | Clean binary example | No count; `lm()` stays inside 0–1; data licence unstated | Reject (fallback binary) |
| `faraway::gala` / L10 `druhy_galapagy.csv` (Johnson & Raven 1973) | Galápagos plant species | `Species`; `log(Area)` | One island (30) | Direct L10 callback | Poisson dispersion 23 (checked); no natural binary | Reject as main data; possible warning example |
| `Sleuth3::case2201` (Poole 1989) | Elephant matings | `Matings`; `Age` | One male (41) | Textbook Poisson with dispersion 1.16 | n = 41; binary version weak; licence unclear | Reject (fallback count) |
| `mvabund::spider` (van der Aart & Smeenk-Enserink 1975) | Hunting spiders | species counts; soil and vegetation | One pitfall site (28) | Multi-species abundance | n = 28 | Reject |
| `ade4::doubs` (Verneaux 1973) | Doubs river fish | abundance classes 0–5; environment | One river site (30) | Along-river gradient | Abundance classes, not counts; n = 30 | Reject |
| Dryad `r2280gbg0` (CC0) | Danish island plants | richness, species presence; area, isolation | One island (54) | L10 callback with presence data | Heavy wrangling of a species-by-island table | Reject (backup) |
| Zenodo `6801204` (CC BY 4.0) | Wood warbler nests | fledglings, clutch size | One nest (1,896) | 53% zeros | Region and year grouping; clutch is the only predictor | Reject |
| Dryad `s6tj198` (CC0) | Bumblebee flower visits | visit counts | One plant visit (458) | Pollination counts | Repeated visits by bees within colonies | Reject |
| CUNY Biostatistics book | Garter snakes; amphipod colonisation | 0/1 by age class; colonised out of 16 | Snake; patch | Same file for binomial then Poisson | Categorical predictors only | Teaching reference |
| Modern Statistics with R | Shark attacks, `MASS::ships`, wine | yearly counts; wine colour | Year; ship type | Rates and offsets | No biology, no shared story | Teaching reference |
| Dryad `10.5061/dryad.8733` (CC0), Reif & Vermouzek | Czech bird habitat specialisation | species-level indices | One bird species | Czech | Species are units; no site responses (metadata only) | Reject |
| Dryad `10.5061/dryad.39k32` (CC0) | Saproxylic beetles, Czech forests | trap counts by height | One flight-interception trap | Czech counts | Traps nested in trees and sites (metadata only) | Reject (an L12-type design) |

## Finalist comparison

| Finalist | Learning-outcome fit | Student relevance | Interpretability | Stepwise buildability | Practical feasibility | Main risks | Rank |
|---|---|---|---|---|---|---|---|
| A – Mistletoe stems, Podyjí | Both responses from one unit. `lm()` predicts −0.16 for 0/1 and −0.35 for counts. Poisson dispersion 1.67 (moderate). AIC improves with a second predictor. | High: Czech national park, a parasitic plant, bird dispersal | High: "Je kmen napaden? Kolik jmelí na něm roste?" | Prevalence by DBH class → `lm()` fails → logistic curve → counts → `exp(b)` → distance as a second predictor | CC0, one CSV, no missing values, n = 1,015 | Upper part of the S-curve only extrapolated (fitted maximum 0.78); stems nested in trees; spatial contagion | 1 |
| B – Horseshoe crabs | Full S-curve with width; both responses; dispersion 3.2 | Medium: mating biology, but North American, and crabs again after L05 | High | Same route | `GLMsData` package or a copied file | Data licence unstated, so it cannot be redistributed on the public HUB without permission; 36% zeros with overdispersion 3.2 | 2 (blocked) |
| C – Mistletoe whole trees | Binary only (14.8%); basal area and competition | High (same story) | Medium: basal area of multi-stem trees | Binary route only | CC0 | No count response; needs a second dataset for counts | 3 |

## Numerical and practical feasibility probes

Scripts in the session scratchpad with a separate `glmmTMB` 1.1.15.2 library; nothing is committed.

### Probe of `glmmTMB` features (decisions D1 and D4), on the L10 Galápagos data

- `glmmTMB()` and `glm()` give identical estimates, standard errors and AIC for `family = poisson` and `family = binomial`.
- `summary()` prints "Conditional model" with `Estimate`, `Std. Error`, `z value`, `Pr(>|z|)`, plus a line with AIC, BIC, logLik, −2·log(L) and df.resid.
- `confint()` works and returns `2.5 %`, `97.5 %` and `Estimate`. `exp(confint())` gives the interval for the multiplier.
- `predict(type = "link", se.fit = TRUE)` works and matches `glm()`, so the confidence band can be built on the link scale and back-transformed.
- Pearson dispersion `sum(residuals(m, type = "pearson")^2) / df.residual(m)` works. `deviance()` equals the `glm()` residual deviance in this version.
- `cooks.distance()` has **no method** for `glmmTMB`. Cook's distance is therefore computed on a `glm()` refit. This finding led to the D1 revision of 2026-11-07: the core now uses `glm()` directly (see Notes).
- The Galápagos Poisson model has dispersion 23, so the L10 data are unsuitable as the main count example.

### A – Mistletoe on oak stems (Nad Šobesem, Podyjí National Park)

- **Provenance, reuse conditions, and stable access:**
  - Matula R, Svátek M, Pálková M, Volařík D, Vrška T (2015). Mistletoe infection in an oak forest is influenced by competition and host size. *PLoS ONE* 10(5): e0127055, <https://doi.org/10.1371/journal.pone.0127055> (article CC BY 4.0).
  - Data: Dryad <https://doi.org/10.5061/dryad.vk283>, **CC0**, mirrored on Zenodo record 4945816. Two semicolon-separated Latin-1 CSV files: stems (1,015 × 13) and whole trees (710 × 9).
- **Observational unit, intended population, and sampling story:**
  - *Loranthus europaeus* (ochmet evropský) on sessile oak (*Quercus petraea*) in an acidophilous oak wood. It is a former coppice that has not been cut since the late 19th century.
  - All living stems ≥ 7 cm DBH on a 2.37 ha plot were mapped. The authors excluded stems within 12 m of the plot edge and broken trees, leaving 1,015 target stems. The whole-tree analysis uses 710 trees (polycormons).
  - Correction after approval: the trees file sums to 1,599 stems, while the paper reports 1,503 living stems and 1,015 target stems, so the number of trees that carry the 1,015 stems is not known. Do not write "1,015 stems on 710 trees" in student-facing text.
  - In winter 2011/12, the mistletoe plants on each stem were counted with binoculars.
  - The seeds are spread by birds, mainly the mistle thrush (*Turdus viscivorus*).
  - The population is the oak stems of this stand. Generalising beyond one stand is a limitation to state.
- **Numerical probe (stems, n = 1,015, no missing values):**
  - **Binary:** 96 infected stems (9.5%). Infection rises with DBH class: 0.5% (DBH 6–19 cm), 2.7%, 5.9%, 9.2%, 15.7%, 25.3% (DBH 30–48 cm).
    - `lm(infected ~ dbh)` predicts from −0.155 to 0.407.
    - Logistic `infected ~ dbh`: slope 0.168 per cm, AIC 551.2, fitted probabilities 0.003–0.775. Only the lower part of the S-curve is observed.
    - `infected ~ log(distance)`: AIC 583.0. `infected ~ ci`: AIC 576.7. `infected ~ dbh + log(distance)`: AIC 509.4.
  - **Count:** `pocet` is 0 (919 stems), 1 (58), 2 (17), 3 (12), 4 (5), 5 (1), 6 (1), 7 (2).
    - `lm(pocet ~ dbh)` predicts from −0.351 to 0.822.
    - Poisson `pocet ~ dbh`: `exp(b)` = 1.163 (+16% expected mistletoes per cm DBH), dispersion 1.67, AIC 938.1.
    - `pocet ~ dbh + log(distance)`: `exp(b)` = 1.151 and 0.556, dispersion 1.52, AIC 878.9.
- **Teaching opportunities and complications:**
  - The same stems answer "napaden ano/ne" and "kolik ochmetu". Both `lm()` failures are visible.
  - Moderate overdispersion (1.5–1.7) allows the overdispersion check to be taught without derailing the lesson. It is named as a reason the Poisson intervals are somewhat too narrow, and the negative binomial is named as the next step.
  - Distance to the nearest infected stem gives a biologically meaningful second predictor (bird-dispersed seeds land near existing mistletoes) for an AIC comparison (D5).
  - **Data discrepancy to resolve in Stage 2:** the paper reports 131 of 1,015 stems (12.9%) infected, while the Dryad stem file has 96 (9.5%). The share with exactly one mistletoe (60%) matches the file (58/96), and the whole-tree rate (105 of 710, 14.8%) matches the trees file. The file is used as published, and the discrepancy is noted in `data/README.md`. Optionally ask the authors.
  - **Dependence (a bridge to L12, not a blocker):**
    - Many trees in the former coppice are multi-stemmed, but the stem file has no tree ID (the number of trees behind the 1,015 stems is not known; see the correction above).
    - Infection is also spatially contagious, which is the point of the distance predictor.
    - L11 states the stem as the observational unit and names this limitation. L12 can open with "Jsou kmeny jednoho stromu nezávislé?". This reverses the old L10 → L11 bridge in a way the swap makes natural.
  - **Extrapolation:** the fitted curve reaches 0.78 only at the thickest stems. The plateau near 1 is explained in words and never shown as observed.

### B – Horseshoe crab satellites (`GLMsData::hcrabs`)

- **Provenance, reuse conditions, and stable access:**
  - Brockmann (1996), *Ethology* 102: 1–21; distributed with Agresti's textbooks and several CRAN packages.
  - No data licence is stated; the package licences (GPL ≥ 2, MIT) cover the code.
  - The `GLMsData` help page says the data come from Delaware 1991–93, which is inconsistent with Brockmann's Florida work.
- **Observational unit, intended population, and sampling story:** one nesting female (173). The response is the number of satellite males and whether she has any.
- **Numerical probe:**
  - Presence of satellites rises from 30% to 93% across width classes. Logistic `y ~ Width`: slope 0.497 per cm, AIC 198.5, fitted range 0.13–0.99, so the full S-curve is visible.
  - Poisson `Sat ~ Width`: `exp(b)` = 1.178, dispersion 3.18, AIC 927.2. `Sat ~ Wt`: AIC 920.2.
  - 36% zeros; mean 2.92, variance 9.91.
- **Teaching opportunities and complications:**
  - The pedagogically cleanest S-curve.
  - Overdispersion of 3.2 with many zeros would shift the lesson towards negative binomial and zero inflation.
  - Crabs already appear in L05 (fiddler crabs).
  - The unclear data licence blocks redistribution on the public HUB.

### C – Mistletoe on whole trees (same Dryad record)

- **Provenance, reuse conditions, and stable access:** as A (CC0).
- **Observational unit, intended population, and sampling story:** one tree (710), 14.8% infected; no count response.
- **Numerical probe:**
  - Infection rises with basal area class from 1.6% to 31%.
  - `infected ~ log(basal area)`: AIC 524.3, fitted range 0.002–0.65. `infected ~ log(ci)`: AIC 531.5.
- **Teaching opportunities and complications:**
  - Removes stem nesting, but loses the count response and with it the one-story design (D2).
  - Possible Extra or exercise variant.

## Selected dataset (approved 2026-11-06)

- **Name/source:** stems of sessile oak and the mistletoe *Loranthus europaeus* in Nad Šobesem, Podyjí National Park (Matula et al. 2015; Dryad `10.5061/dryad.vk283`, CC0).
- **Response variables:**
  - binary: stem infected (`napaden`, 0/1);
  - count: number of mistletoe plants on the stem (`pocet_ochmetu`).
- **Key predictor:** stem diameter at breast height (`dbh_cm`). Second predictor for the AIC comparison: distance to the nearest infected stem (`vzdalenost_napadeny_m`, on the log scale).
- **Why this one is best for this week:**
  - It is the only candidate that is open-licensed, Czech, and provides both responses on the same unit.
  - Both `lm()` failures are visible.
  - Its overdispersion is moderate.
  - It has a natural second predictor with a biological mechanism (bird dispersal).
  - Its weaknesses (partial S-curve, stems within trees) are teachable and lead into L12.

## Minimal data story

- **Biological question in one sentence:** Které duby v podyjské doubravě napadá ochmet evropský a na kterých ho roste nejvíc – a záleží na tloušťce kmene a na tom, jak daleko je nejbližší napadený kmen?
- **First figure idea:** stem DBH on the x-axis and infected 0/1 as jittered points at 0 and 1, with the share of infected stems in DBH classes overlaid. Then the same axes with the `lm()` line crossing below zero.
- **Bridge to next lesson:** "Mnohé duby v bývalé pařezině mají více kmenů a napadení se šíří od souseda k sousedovi. Jsou kmeny jednoho stromu opravdu nezávislá pozorování?" This leads into L12, hierarchical data.

## Why this dataset matches the project filter

- **Supports model-first teaching:** one unit and one predictor, with the same linear predictor carried by three models (`lm()`, logistic, Poisson).
- **Understandable for biology beginners:** a visible parasitic plant, a familiar tree and a dispersal mechanism students know from botany and zoology.
- **Uses real data appropriately:** the published CC0 data are used as they are, and the discrepancy with the paper and the dependence are stated openly.
- **Avoids unnecessary tooling or syntax burden:**
  - one CSV, read with `read.csv()` after a reproducible acquisition script converts the semicolon/Latin-1 file into a course-style CSV with Czech column names;
  - no wrangling visible to students.

## Data implementation (on this branch)

- `R/prepare_mistletoe_data.R` (ASCII): downloads the stem file from Zenodo record 4945816, verifies the source SHA-256 `32439687be0a2b2410a05629e60ce0f40486b416adb186184a4ea03ae7aef5f6`, reads the semicolon/Latin-1 file, keeps six variables with Czech names, sorts by stem ID, checks rows, IDs, missing values, the 0/1-versus-count agreement, the 96 infected stems and positive distances, and writes `data/ochmet_duby.csv`. Run with R 4.5.1 in the restored L11 `renv` library on 2026-11-06.
- `data/ochmet_duby.csv`: 1,015 rows; `kmen`, `dbh_cm`, `napaden`, `pocet_ochmetu`, `vzdalenost_napadeny_m`, `index_konkurence`; SHA-256 `a930455340957c4d91644df3cf0945a2536374518dc958a22e6e69af997dc7f1`. A fresh read reproduces the probe values (96 infected; logistic AIC 551.2 and 509.4; Poisson `exp(b)` 1.163, dispersion 1.67, AIC 938.1).
- Names: the plant is *ochmet* (*Loranthus*), not *jmelí* (*Viscum*), so the planned `jmeli_duby.csv` and `pocet_jmeli` became `ochmet_duby.csv` and `pocet_ochmetu`.
- `Distance from infected stem (m)` and `Min distance to mistletoe (m)` are identical in the source; only the first is kept as `vzdalenost_napadeny_m`. `index_konkurence` is the Hegyi index within 12 m (`CI_stem`).
- `data/README.md`: plot and sampling, variable table, citation, CC0 licence, preparation, both SHA-256 values, and the 96-versus-131 note.
- `website-release.yml`: lesson `L11`, title "GLM: binární a početní odezva", subtitle "Výskyt a počet ochmetu na kmenech dubů v Podyjí", data entry and data README extra.
- `README.md`: heading, subtitle, ordinal and `LXX` links set to L11; the overview and outcomes stay as template placeholders until the approved skripta exists. `_L-template.Rproj` renamed to `L11.Rproj`.
- `renv`: not changed; after the D1 revision no new package is needed (`glm()` is in base `stats`). `renv::status()` already reports `glossary`, `showtext` and `sysfonts` as used but not locked; this is inherited from the template and not changed here.

## Decision

- [x] At least 4 independent sources were consulted (12)
- [x] At least 8 credible examples were reviewed without padding trivial variants (16, plus 2 by metadata)
- [x] Exact variables, observational units, sampling stories, provenance, and reuse conditions were checked
- [x] Two or three finalists were compared and numerically probed
- [x] Rejection reasons and transferable teaching patterns were recorded
- [x] Human reviewer approved the selected dataset (Ondřej Mottl, 2026-11-06)
- [x] Dataset locked for implementation
- [ ] Diff contains only Stages 0-1 records and intended planning changes
- [ ] Planning PR ready for human review
- Notes: On approval, Ondřej Mottl raised switching the core function from `glmmTMB()` to `glm()` (and possibly `lme4` in L12) because `cooks.distance()` has no `glmmTMB` method. On 2026-11-07 he decided: base `glm()` in L11 and `glmmTMB()` kept in L12 (not `lme4`). The revised D1 and its consequences are in the Stage 0 record. The `glmmTMB` probes above remain valid for L12.
