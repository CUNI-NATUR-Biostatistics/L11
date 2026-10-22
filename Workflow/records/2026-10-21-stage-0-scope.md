# Stage 0 - Scope lock

## Metadata

- Week: L11
- Date: 2026-10-21
- Author: Claude (Claude Code), working with Ondřej Mottl
- Reviewer: Ondřej Mottl
- Status: **approved and locked (revision 2 with decisions applied)**
- Human approval: Ondřej Mottl, 2026-10-21

## Git checkpoint

- Stage group: Stages 0-1 planning
- Repository: `CUNI-NATUR-Biostatistics/L11`, created from `_L-template` (template `main` at `33b766a`) as a public repository on 2026-10-21 with explicit authorization from Ondřej Mottl, consistent with the other public lesson repositories
- Branch: `lesson/l11-scope-data`
- Base branch and commit: `main` at `2cf481f` (template initial commit)
- `git status --short` reviewed: [x] (clean before branch creation)
- Previous-stage PR merged: N/A
- Planning PR: not created
- Note: this record was drafted before the repository existed and moved into `Workflow/records/` on the planning branch after creation.

## New repository setup (`lesson-workflow.md`)

1. Workflows from the current template: [x] created from `_L-template`; `release.yml` and `pollslive.yml` byte-identical to the template, `preview.yml` identical apart from line endings of the local template checkout; the release caller grants `actions: write`, `contents: write`, `pages: write`, `id-token: write`.
2. GitHub Pages built by GitHub Actions: [ ] pending separate authorization
3. `github-pages` environment rules (branch `main`, tag pattern `L11-v*`): [ ] pending separate authorization
4. Access to `HUB_APP_ID` and `HUB_APP_PRIVATE_KEY`: [ ] pending; requires an organisation owner or the `admin:org` scope
5. Verification (`Publish preview` run on `main`, `/L11/preview/` returns 200, `build_type: workflow`): [ ] pending
6. PollsLive lesson-reader GitHub App access (`pollslive.md`, Path B step 4): [ ] pending; PollsLive stays dormant until Stage 4

## Scope revision history

- Revision 1 (2026-10-21): hierarchy, unit of replication and pseudoreplication as the core; a mixed model only as a short preview (recommended option b).
- Revision 2 (2026-10-21): Ondřej Mottl stated that L11 should **teach random effects**, pointing to the 2025/26 lecture `_internal/prezentace/stare/10_design_pokusu_nahodne_efekty.pdf` as evidence that the topic belonged to the course, not as a model to replicate. The random-intercept mixed model therefore moves into the core route, and a revised `osnova_lekci.md` entry is proposed below.

## Topic sentence

A table with many rows can contain far fewer independent answers to the biological question than it seems. Students learn to read the hierarchy of a dataset from how the data were collected (repeated measurements of individuals, organisms within sites, plots within blocks), to find the level at which the predictor of interest varies, and from that the unit of independent replication. They see what a simple `lm()` does when it treats every row as an independent replicate — the estimate may barely move, but the standard error, the interval, the degrees of freedom and the p-value become too optimistic, so a false alarm (the L05 type I error) becomes more likely than the chosen significance level suggests. Group means are an honest but wasteful remedy; a categorical predictor for the groups works only when the predictor varies within groups. The linear mixed model with a **random intercept** resolves both situations: each group gets its own baseline drawn from a common distribution, the variability splits into a between-group and a within-group part, and the predictor's effect is judged against the right amount of independent information. Students decide whether a factor should be fixed or random from the biological question, fit the model in R, and interpret its fixed effect and both variance components.

## Weekly outcomes

### Current canonical entry

`_internal/osnova_lekci.md`, section **L11 – Hierarchická data: proč jednoduchý `lm` někdy nestačí**:

1. Pojmenovat hierarchii v datech, například opakovaná měření, lokality nebo bloky.
2. Určit, které jednotky představují nezávislou replikaci, a vysvětlit riziko pseudoreplikace.
3. Popsat, kdy je potřeba modelové rozšíření nad jednoduchý `lm`.

### Proposed revised entry (for approval; an `_internal` change with its own commit authorization)

Title: **L11 – Hierarchická data a náhodné efekty: proč jednoduchý `lm` někdy nestačí**

Úvodní odstavec: Opakovaná měření, lokality a bloky porušují předpoklad nezávislosti pozorování. Studenti nejprve určí jednotku nezávislé replikace a uvidí, jak pseudoreplikace zkresluje nejistotu jednoduchého lineárního modelu. Potom rozšíří lineární model o náhodný intercept, který dává každé skupině vlastní výchozí úroveň, a rozliší pevné a náhodné faktory podle otázky, kterou si klademe.

Modelové jádro lekce:

- Hierarchie dat vzniká způsobem sběru: měření v jedincích, jedinci na lokalitách, plochy v blocích.
- Jednotka nezávislé replikace je úroveň, na níž se mění zkoumaný prediktor; počet řádků může být mnohem větší než počet nezávislých informačních jednotek.
- Pseudoreplikace obvykle nemění odhad efektu, ale podhodnocuje jeho standardní chybu a nadhodnocuje stupně volnosti; v nulovém světě vede k častějším falešným poplachům.
- Průměry skupin a skupina jako kategoriální prediktor jsou známá řešení s omezeními: průměry ztrácejí informaci uvnitř skupin, pevný faktor nelze použít pro prediktor, který se mění jen mezi skupinami.
- Lineární smíšený model: pevné efekty pro zkoumané prediktory, náhodný intercept pro skupiny; variabilita se dělí na část mezi skupinami a část uvnitř skupin.
- Pevný versus náhodný faktor podle otázky: zajímají nás konkrétní úrovně, nebo úrovně chápeme jako výběr z většího souboru, na který chceme zobecnit? Náhodný faktor potřebuje dostatek úrovní.
- Náhodný sklon, prostorová a časová závislost jsou pojmenované další kroky, nikoli obsah lekce.

Výstupy z učení:

1. Pojmenovat hierarchii v datech (opakovaná měření, lokality, bloky) a určit, na které úrovni se mění zkoumaný prediktor.
2. Určit jednotku nezávislé replikace a vysvětlit, jak pseudoreplikace zkresluje standardní chybu, intervaly spolehlivosti a p-hodnoty.
3. Rozhodnout, zda má být skupinová proměnná pevným, nebo náhodným faktorem, a zdůvodnit volbu biologickou otázkou.
4. Fitovat lineární model s náhodným interceptem, interpretovat jeho pevný efekt a porovnat variabilitu mezi skupinami a uvnitř skupin.
5. Popsat, kdy je potřeba model s náhodnými efekty místo jednoduchého `lm`, a kdy stačí jednodušší řešení.

## What students already know (prerequisite audit of L01-L10)

- L02: "Počet teček v grafu proto nemusí být totožný s počtem nezávislých informačních jednotek" — several rows may belong to the same individual, nest, site or day (skripta, around line 295).
- L03: independence of observations follows from how the data were obtained; a residual plot cannot detect that several measurements come from the same individual, site or time series (skripta, around line 1523).
- L04: sampling variability, standard error, confidence interval; the standard error shrinks with roughly the square root of the number of observations (geyser example).
- L05: **explicit promise.** The crab lesson modelled 13 salt-marsh means instead of individual crabs and states: "Proč nelze jednotlivé kraby bez dalšího považovat za … nezávislých odpovědí na otázku o zeměpisné šířce, probereme později u hierarchických dat" (skripta, around line 566). Students know the t-statistic, df = n − 2, p-value, the null-world simulation, and type I and II errors. L05 already distributes the individual crab data (`data/pie_crab.csv`) next to the site means.
- L06: `lm(y ~ skupina)`, reference group, ANOVA as a special case of `lm`, Tukey comparisons; the "one modelling route" rule (no `t.test()`).
- L07: knotweed leaf thickness was averaged over individual plants per source population before modelling (skripta, around line 179) — a second, unexplained aggregation. Confounding and "effect at fixed values of the other predictors".
- L08-L09: interactions; candidate models and AIC.
- L10: closing box "Jsou ostrovy jednoho souostroví nezávislá pozorování?" announces sites, blocks and individuals for the next lesson; distributions and the normal reference shape (needed for "group baselines are drawn from a normal distribution").
- Not yet taught: hierarchie / hierarchická data, pseudoreplikace, jednotka nezávislé replikace, blok, opakovaná měření as a design term, pevný versus náhodný faktor, smíšený model, náhodný intercept, variance components.
- Glossary (`slovnik/pojmy.yaml`): slugs `hierarchicka-data`, `pseudoreplikace`, `opakovana-mereni`, `pevny-faktor`, `nahodny-faktor`, `jednotka-pozorovani`, `nahodny-vyber`, `uroven-faktoru` exist. Missing candidates for Stage 2: jednotka nezávislé replikace, blok, smíšený model, náhodný efekt, náhodný intercept, pevný efekt, variabilita mezi skupinami / uvnitř skupin; possibly vnitroskupinová korelace (ICC) if decision 4 includes it. The existing `nahodny-faktor` definition ("zajímá nás rozptyl, který přináší, ne konkrétní úrovně") fits the planned framing. New terms go through the `slovnik` workflow as a separate repository change.

## Inspiration consulted

- Authoring problem to solve: make independence concrete and measurable for beginners, then introduce the random intercept as the natural answer to a problem students have felt, without turning the lesson into a mixed-model methods course or a ritual ("always add `(1 | lokalita)`").
- Former course material: `_internal/prezentace/stare/10_design_pokusu_nahodne_efekty.pdf` (2025/26, 31 slides) and practical `_internal/R/old/010/` (`pacosi.txt`, `aov(... + Error(pacient))`, `lmer()` with random intercept and slopes). Used as a content inventory and risk source, not as a template.
  - Worth keeping: the grazed/ungrazed enclosure picture (2 versus 10 independent units); "pseudoreplication happens when the experimental unit does not match the level we want to generalise to"; split-plot logic — predictors defined at group level have df given by the number of groups, predictors defined within groups by the number of objects; fixed versus random factor decided by the question, with the checklist "do I care about the individual levels (would I run Tukey)? would the same levels recur in a repeated study? enough levels?"; random factors as an additional component of stochastic variability; the cultivar example (generalise to 5 cultivars versus to wheat in general).
  - Rejected: the experimental-design survey (control, negative results, power, latin squares) as main content; `aov()` with `Error()`; the orthogonality requirement; GLS, variograms and phylogenetic correlation beyond one naming sentence; text-only slides without data.
- Relevant sources from the course inspiration hub (L10-L12 block; "hierarchical thinking" is listed explicitly):
  - [CUNY Biostatistics book, linear model extensions](https://jsgosnell.github.io/cuny_biostats_book/content/chapters/Linear_model_extensions.html): oysters in tanks — "is n 75 oysters or 3 tanks?"; averaging per tank as an honest but data-poor remedy; blocking fails when each tank receives only one treatment (tank and treatment confounded); random intercepts as group baselines, random slopes as group-specific responses; 16 birds with two feather types showing that a random effect reproduces a paired comparison; about 5+ levels needed for a random effect; `lme4::lmer()`, `nlme` named as alternative.
  - [Modern Statistics with R, regression chapter](https://www.modernstatisticswithr.com/regression.html): independence as a key assumption "difficult to assess visually"; section 8.8 on mixed models (fitting, diagnostics, nested random effects, ANOVA with random effects, GLMM, Bayesian).
- Patterns worth borrowing:
  - Ask "kolik nezávislých odpovědí máme?" before any model.
  - Distinguish predictors that vary **between** groups (pseudoreplication risk) from predictors that vary **within** groups (the grouping removes noise).
  - Answer the same question three or four ways — all rows, group means, group as fixed factor, random intercept — and compare estimate, SE and interval side by side.
  - Random intercept pictured as "each group has its own baseline line, the slope is shared", with group baselines scattered around the overall line like draws from a normal distribution (L10 reference shape).
  - Fixed-versus-random checklist from the old deck, phrased as student questions.
- Patterns explicitly rejected: matrix notation `Y = Xβ + Zμ + ε`; Type III tests with Kenward-Roger df; `performance::check_model()` and DHARMa; AICc comparison of random-effect structures; nested multilevel models, ANOVA with random effects, GLMM and Bayesian estimation (MSwR 8.8.3-8.8.6); genomicsclass empirical-Bayes hierarchical models; paired t-test and repeated-measures ANOVA as separate tools (one-modelling-route rule).
- Gaps the lesson must fill itself: the explicit callback that L05 and L07 already analysed group means and why; showing in a plot how random-intercept baselines lie between "one line for all" and "a separate fixed line per group" (partial pooling shown visually, not named formally).
- Why the selected pattern fits this course: it reuses L04 (more observations shrink SE), L05 (t, df, null world, type I error), L06 (categorical predictor, reference group) and L10 (normal reference shape); the mixed model appears as one more extension of `lm`, consistent with "vše jako model".

## Concrete student actions

1. From a short description of how data were collected, describe the hierarchy (measurements → individuals → sites or blocks), name the level at which the predictor of interest varies, and count independent units versus rows.
2. Fit `lm()` on all rows and on group means of the same data, compare estimate, SE, 95% interval, residual degrees of freedom and p-value, and explain why the all-rows version is too optimistic.
3. Decide whether the grouping variable should be a fixed or a random factor, justifying the choice by the biological question, the number of levels and whether the predictor varies between or within groups.
4. Fit a random-intercept model in R, interpret its fixed effect with its uncertainty, read the between-group and within-group standard deviations, and compare the result with the earlier `lm()` versions.
5. Write a cautious biological conclusion stating the unit of replication, the model, the effect with its uncertainty and the main limitation.

## Proposed lesson spine (orientation only; not the Stage 2 story map)

1. Opening question where many rows hide few independent answers; callback to the L10 islands box and the L05 promise.
2. Where the data come from: hierarchy, observational unit versus unit of independent replication, the level at which the predictor varies.
3. What a simple `lm()` does with all rows; side-by-side with group means; why a too small SE means more false alarms (L05 type I error, stated in words).
4. The grouping as a fixed factor: when it helps (predictor varies within groups, blocks, repeated measures) and why it cannot be used for a group-level predictor.
5. Random intercept: groups as a sample of possible groups, own baselines, two sources of variability; fitting and reading the model; comparison table of all approaches.
6. Fixed or random? Decision questions on several biological scenarios.
7. Diagnostics in known terms (residuals within groups, distribution of group baselines), conditional conclusion, named further steps (random slope, spatial and temporal dependence), bridge to L12.

## Out of scope this week

- Crossed random effects, more than one grouping level in a model (nested random effects), split-plot analysis with several error strata.
- REML versus ML details, likelihood-ratio tests of random effects, df approximation methods by name (Satterthwaite, Kenward-Roger), shrinkage formulas, the variance-components algebra.
- GLMM and any binary or count response (L12 covers GLM without random effects).
- Temporal and spatial autocorrelation models (`gls()`, correlation structures, variograms), phylogenetic non-independence (named only).
- `aov()` with `Error()`, paired t-test and repeated-measures ANOVA as separate tools; formal experimental-design theory (power analysis, randomisation schemes, latin squares).
- Bayesian hierarchical models.
- Null-world simulations of false-alarm rates (decided by Ondřej Mottl, 2026-10-21: left out; the link between a too small SE and type I error is stated in words with the L05 vocabulary).

## Formal depth boundary

### Core and student-visible

- Hierarchy vocabulary: opakovaná měření, lokality, bloky, hierarchická data; observational unit versus unit of independent replication; the level at which the predictor varies.
- Pseudoreplication read from familiar `summary()` / `confint()` output: similar estimate, too small SE, too narrow CI, inflated residual df, too small p-value.
- Group means with `aggregate()` and `lm()`; the grouping as a categorical predictor with `lm()`; the limits of each.
- Random-intercept model fitted with one function call; its fixed-effect table with SE (and p-value if the chosen package reports one); its two standard deviations (between groups, within groups / residual) interpreted in the units of the response; group baselines shown in a plot.
- Fixed versus random factor decided by the question, the number of levels (rule of thumb about 5 or more) and the design.
- Text-only → concrete numbers → symbols progression for the model equation: `výška = intercept + odchylka lokality + sklon × prediktor + residuum`, then $y_{ij} = \beta_0 + u_j + \beta_1 x_{ij} + e_{ij}$ with $u_j$ and $e_{ij}$ explained in words.

### Intuitive only

- Observations within one group resemble each other (shared environment, genotype, observer, day); the share of variability between groups as "how similar are members of one group" (ICC named at most).
- Group baselines from the mixed model lie between the overall line and separate fixed-group lines (partial pooling shown in a figure, no formula).
- The mixed model judges a group-level predictor by roughly the number of groups, not the number of rows.

### Extra (written materials only, clearly marked; resolved decision 5)

- Random slope: groups may also differ in the slope; one picture and one formula line, no interpretation of the slope variance.

### Deferred or out of scope

- See the out-of-scope list above.

## Risks and dependencies

- Risk: scope overload — pseudoreplication, fixed versus random factors and the mixed model in 90 minutes. Mitigation: `skripta.qmd` is the complete source and the presentation distils (L10 precedent); one dataset carries the whole route; the fixed-factor block may be short.
- Risk: the mixed model becomes a black box or a ritual. Mitigation: it is introduced only after students have seen why both naïve solutions fail; every result is compared with the `lm()` versions in one table; fixed-versus-random is always argued from the question.
- Risk: mixed-model output is unfamiliar, and `glmmTMB` prints Wald z without degrees of freedom. Mitigation: read only the fixed-effect estimate, SE, interval and the two standard deviations; carry the "groups, not rows" message through the side-by-side comparison of SE and intervals (see resolved decision 2).
- Risk: package installation fails on some student computers. Mitigation: preflight check with a clear Czech message and a commented install command; verify the CRAN binary route in the Stage 2 and exercise distribution rehearsals.
- Risk: "more rows never help" overcorrection. Mitigation: more individuals per site make each site's baseline more precise but do not add sites.
- Risk: too few groups for a random effect in the chosen data. Mitigation: Stage 1 requires at least about 10 groups; the 5-level rule of thumb is taught explicitly.
- Dependency: L10 approved, merged, released (`L10-v1.0.0-20261015`, satisfied). The L11 PollsLive retrieval quiz retrieves L10 and waits for Stage 4.
- Dependency: new glossary terms via the `slovnik` workflow (separate repository change).
- Dependency: the revised `osnova_lekci.md` entry, committed to `_internal` `main` as `dd3ffda` on 2026-10-21.
- Dependency: the one-time repository setup items 2-6 require separate authorization.
- Dependency: the Moodle knowledge file `moodle/knowledge/L11.yaml` is built only after the lesson release; its `readable_output` will need a new entry type for mixed-model output.

## Resolved decisions

1. Random effects are taught in L11 (random-intercept mixed model in the core route). Stated by Ondřej Mottl, 2026-10-21; the 2025/26 deck is inspiration only.
2. Package for the student-visible mixed model: **`glmmTMB::glmmTMB()`**. Decided by Ondřej Mottl, 2026-10-21, deliberately accepting that it is more than L11 needs, because after L12 the same function and formula syntax extend to GLMs with a hierarchical structure (`family = binomial()` / `poisson()` with `(1 | skupina)`). Consequences to carry into Stages 1-2:
   - `glmmTMB` is not in the template `renv.lock` (`lme4` and `nlme` appear there only as dependency names). It is added to the L11 environment with `renv::install()` and `renv::snapshot()` scoped to that change; Stage 1 probes run in an untracked scratch library.
   - Students must install it (CRAN binaries exist for Windows and macOS). Learning materials and the exercise need a `requireNamespace()` preflight with a commented installation command, per `exercises.md`.
   - Visible call follows the course style: `glmmTMB::glmmTMB(formula = odezva ~ prediktor + (1 | skupina), data = ...)`; the Gaussian family is the default, which later lets L12 show that only `family` changes.
   - `summary()` prints random-effect variances and standard deviations and a fixed-effect table with `z value` and `Pr(>|z|)` (Wald z, no degrees of freedom). The "model counts groups, not rows" message therefore cannot come from printed df as with `nlme::lme()`; it is carried by the standard errors and intervals in the side-by-side comparison. The lesson must explain briefly why the table shows z instead of t, using only L05 knowledge.
   - With few groups, Wald z intervals and p-values are somewhat optimistic; Stage 1 should prefer data with about 15 or more groups; an internal (not student-facing) simulation may check how optimistic the Wald intervals are for the chosen number of groups.
   - Default estimation is ML (`REML = FALSE`); whether to set `REML = TRUE` for the variance components is a Stage 1 probe and stays out of student-facing explanation beyond one sentence if needed.
   - `confint()` works on the fitted object, so the familiar interval reading from L04-L05 carries over.
3. Revised `osnova_lekci.md` L11 entry (new title, seven-item model core including the `glmmTMB` model line, five outcomes) approved by Ondřej Mottl, 2026-10-21, and applied to `_internal/osnova_lekci.md` exactly as proposed above; committed to `_internal` `main` as `dd3ffda` on 2026-10-21. The five outcomes in that entry are now the canonical L11 outcomes. Note: its model-core item on pseudoreplication mentions more frequent false alarms "v nulovém světě"; after resolved decision 6 this is stated in words with the L05 vocabulary, without a simulation.
4. Dataset rule: Ondřej Mottl requested a full Stage 1 search (2026-10-21). The individual L05 crab data (`L05/data/pie_crab.csv`, 13 salt marshes, latitude varying only between sites) are an **eligible candidate on equal terms**; the comparison decides. If not selected, they may still appear as a callback to the L05 promise.
5. Random slope: an Extra box in the written materials only (one figure and one formula line, no interpretation of the slope variance). Approved by Ondřej Mottl, 2026-10-21.
6. Null-world simulation of false alarms: **left out** of the lesson. Decided by Ondřej Mottl, 2026-10-21, against the recommendation to include it; the side-by-side comparison of SE and intervals carries the pseudoreplication argument.

## Preliminary dataset needs for Stage 1 (not a dataset decision)

- Real biological data with a clear two-level hierarchy: several individuals or measurements per group, about 10-30 groups (enough for a random effect), unequal but not extreme group sizes.
- A numeric continuous response suitable for a normal linear model (no counts or proportions; L12).
- A predictor of interest that varies **between** groups, so the all-rows `lm()` visibly understates the SE while the estimate stays comparable; noticeable between-group variability (a visible baseline shift per group).
- Ideally a second predictor that varies **within** groups, so that the gain from modelling the grouping is also visible.
- Group identity that is plausibly a sample of possible groups (sites, populations, individuals, blocks), so the random-factor argument is natural.
- Documented provenance, explicit reuse terms, little missingness, an interpretable Czech story; preferred order per `lesson-workflow.md`.

## Decision

- [x] Random effects in scope (resolved decision 1)
- [x] Package `glmmTMB` (resolved decision 2)
- [x] Revised `osnova_lekci.md` entry approved and applied (resolved decision 3)
- [x] Dataset rule, random slope and simulation resolved (resolved decisions 4-6)
- [x] Human reviewer approved this scope (Ondřej Mottl, 2026-10-21)
- [x] Repository creation and planning branch authorized and done (Ondřej Mottl, 2026-10-21)
- [ ] One-time repository setup items 2-6 completed
- [x] Scope locked for implementation
- [x] Continue Stage 1 research on the planning branch
- Notes: Drafted on 2026-10-21 before the L11 repository existed. Ondřej Mottl decided the random-effects scope and `glmmTMB`, approved and applied the revised `osnova_lekci.md` entry, resolved decisions 4-6 and locked the scope on 2026-10-21. The `_internal/osnova_lekci.md` change was committed as `dd3ffda` the same day.
