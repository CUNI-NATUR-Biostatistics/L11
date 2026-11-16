# Stage 0 - Scope lock

## Metadata

- Week: L11 (GLM: binární a početní odezva)
- Date: 2026-11-06
- Author: Claude (Claude Code), working with Ondřej Mottl
- Reviewer: Ondřej Mottl
- Status: **approved and locked**
- Human approval: Ondřej Mottl, 2026-11-06

## Why this lesson is L11

For 2026/27 the lessons L11 and L12 were swapped (decision by Ondřej Mottl, recorded in `_internal/obecne/nove/plan_zapocet_a_prohozeni_L11_L12_2026-27.md`). The zápočtový týden (4.–10. 1. 2027) coincides with the last lecture week, so the zápočet runs in the L12 practical slots and L12 is lecture only. GLM therefore moves to L11 (lecture Mon 14. 12. 2026, practicals 14.–17. 12.), and hierarchical data move to L12 (lecture Mon 4. 1. 2027).

- The hierarchical lesson developed earlier as L11 lives on in the repository `CUNI-NATUR-Biostatistics/L12` (renamed 2026-11-06; Stage 4 paused on `lesson/l11-presentation`).
- This repository is a new `L11` created from `_L-template` on 2026-11-06.
- GLM is examined only in the zkouška; the zápočet covers L01–L10. A slip in this lesson's exercise therefore does not affect the zápočet, but the exercise is needed by Thu 10. 12. for the practical teachers.

Milestones (swap plan, Phase 3b): Stages 0–1 approved by Fri 13. 11.; skripta story map by Fri 20. 11.; skripta review-ready by Fri 4. 12.; exercise by Thu 10. 12.; presentation and PollsLive by Fri 11. 12.; release and lecture Mon 14. 12.

## Git checkpoint

- Stage group: Stages 0-1 planning
- Repository: `CUNI-NATUR-Biostatistics/L11`, created from `_L-template` (template `main` at `954222f`) as a public repository on 2026-11-06 with explicit authorization from Ondřej Mottl
- Branch: `lesson/l11-scope-data`
- Base branch and commit: `main` at `49d93ed` (template initial commit)
- `git status --short` reviewed: [x] (clean before branch creation)
- Previous-stage PR merged: N/A
- Planning PR: not created

## New repository setup (`lesson-workflow.md`)

All items completed on 2026-11-06, each with explicit authorization from Ondřej Mottl.

1. Workflows from the current template: [x] `release.yml`, `preview.yml` and `pollslive.yml` have the same Git blobs as the template (`preview.yml` differs on disk only in line endings); the release caller grants `actions: write`, `contents: write`, `pages: write`, `id-token: write`.
2. GitHub Pages built by GitHub Actions: [x] `build_type: workflow`, `https://cuni-natur-biostatistics.github.io/L11/`.
3. `github-pages` environment rules: [x] branch `main` and tag pattern `L11-v*`, matching L10.
4. Access to `HUB_APP_ID` and `HUB_APP_PRIVATE_KEY`: [x] `L11` added in the organisation settings; both access lists show `L00`–`L12` and `L07-private-archive` (checked through the API).
5. Verification: [x] `Publish preview` run 42216364646 succeeded on attempt 2 (attempt 1 ran before Pages existed); `/L11/preview/` returns 200.
6. PollsLive lesson-reader GitHub App access (`pollslive.md`, Path B step 4): [ ] pending; PollsLive stays dormant until Stage 4. The registered L11 poll (`cmvkmcg3c004hld01so25kthb`, retrieves L10) was synced from the former L11 repository and is re-synced from this repository in Stage 4.

## Weekly outcomes

### Current canonical entry

`_internal/osnova_lekci.md`, section **L12 – GLM: binární a početní odezva** (renumbered to L11 in the planned `_internal` swap edit):

Úvodní odstavec: Jednotná logika modelu pokračuje pro odezvy, u nichž normální rozdělení a přímá lineární predikce nedávají smysl.

Modelové jádro lekce:

- Typ odezvy určuje vhodné pravděpodobnostní rozdělení a spojovací funkci.
- Pro 0/1 data není vhodný lineární model s normálními chybami; používá se logistický model.
- Početní data vyžadují model respektující jejich diskrétní a nezápornou povahu.
- Důraz je na biologickou interpretaci predikcí a efektů, nikoli na matematické odvození spojovacích funkcí.

Výstupy z učení:

1. Rozlišit spojitou, binární a početní odezvu a přiřadit jí odpovídající typ modelu.
2. Vysvětlit, proč jednoduchý lineární model není vhodný pro 0/1 data.
3. Fitovat a věcně interpretovat jednoduchý GLM pro binární nebo početní odezvu.

### Proposed revised entry (for approval; applied in the `_internal` swap edit with its own commit authorization)

The current entry is thin compared with L10 and the hierarchical lesson, and outcome 3 says "binární *nebo* početní", while the swap plan fixes one binary and one count example. Proposed text, to be adjusted after decisions D1-D6:

Title: **L11 – GLM: binární a početní odezva**

Úvodní odstavec: Jednotná logika modelu pokračuje pro odezvy, u nichž normální rozdělení a přímá lineární predikce nedávají smysl: výskyt ano/ne a počty. Studenti uvidí, proč přímka s normálními residui u takových dat předpovídá nemožné hodnoty, a rozšíří lineární model o rozdělení odezvy a spojovací funkci. Logistický a Poissonův model fitují funkcí `glm()` a výsledky čtou jako předpovězené pravděpodobnosti, počty a násobky.

Modelové jádro lekce:

- Typ odezvy určuje vhodné rozdělení: spojitá → normální, 0/1 → binomické (Bernoulliho), počty → Poissonovo. Rozdělení odezvy říká, jak se data rozptylují kolem předpovědi.
- Lineární model pro 0/1 data předpovídá hodnoty mimo interval 0–1 a jeho residua nemohou mít normální rozdělení; pro počty předpovídá záporné hodnoty a přehlíží, že rozptyl roste s průměrem.
- GLM zachovává lineární prediktor $\beta_0 + \beta_1 x$ (stejný vzorec jako `lm()`), ale převádí ho na škálu odezvy spojovací funkcí: logit pro pravděpodobnost, logaritmus pro počty.
- Koeficienty leží na škále lineárního prediktoru; biologicky je čteme přes předpovědi na škále odezvy (`predict(..., type = "response")`) a u Poissonova modelu jako násobky `exp(b)` (navazuje na logaritmickou škálu z L10).
- Nejistota: standardní chyby, intervaly spolehlivosti a p-hodnoty se čtou stejně jako dosud; tabulka ukazuje `z value` místo `t value`.
- Kontrola modelu u GLM nestojí na normalitě residuí; kontrolujeme, zda předpovědi odpovídají pozorovaným podílům a počtům, a u počtů, zda rozptyl není výrazně větší, než Poissonův model připouští (nadměrný rozptyl, *overdispersion*).
- Porovnání kandidátních modelů pomocí AIC funguje i u GLM se stejnou odezvou (navazuje na L09).

Výstupy z učení:

1. Rozlišit spojitou, binární a početní odezvu a přiřadit jí vhodné rozdělení a typ modelu.
2. Vysvětlit, proč lineární model s normálními residui není vhodný pro 0/1 data a pro počty.
3. Fitovat logistický a Poissonův model funkcí `glm()` a interpretovat jeho efekt pomocí předpovězených pravděpodobností nebo počtů a jejich nejistoty.
4. Interpretovat koeficient Poissonova modelu jako násobek očekávaného počtu a vysvětlit roli spojovací funkce slovy, bez odvozování.
5. Posoudit, zda model odpovídá datům (předpovědi proti pozorovaným hodnotám, nadměrný rozptyl u počtů), a formulovat opatrný biologický závěr.

## What students already know (starting-knowledge summary)

Sources: `_internal/moodle/knowledge/L01.yaml`–`L10.yaml` (all sections, extracted by a read-only subagent on 2026-11-06) and `_internal/R/Functions/Prior_knowledge/standing_practices.csv`. The lesson repositories remain canonical; doubtful items are verified there in Stage 2.

### Notation

- L03 introduced $\hat{y}_i = a + b \cdot x_i$ and $e_i = y_i - \hat{y}_i$. L06 switched to $\hat\beta_0, \hat\beta_1$ (hat for the estimate), and L07–L10 kept the $\beta$ notation ($Y_i = \beta_0 + \beta_1 X_{1i} + \dots + \varepsilon_i$). **L11 continues with $\beta$.**
- L10: `log()` is the natural logarithm and `exp()` its inverse; $\ln S = \ln c + b \ln A$.
- L09: AIC $= -2 \cdot \log L + 2k$, so the log-likelihood has appeared in a formula. L09 deferred likelihood itself to the GLM lesson.

### Concepts

- **Model structure:** observed = fitted + residual (L03). The assumptions concern the residuals (L03, L10), and independence follows from the design (L03). "Linear" means linear in the coefficients (L10).
- **Diagnostics:**
  - residuals vs fitted with lowess (L03);
  - residual histogram and Q–Q plot, read for systematic patterns (L03, L10); Shapiro–Wilk depends on $n$ (L10);
  - Cook's distance with the $4/n$ line, checked but never used to delete (L03, L05, L09);
  - a fan shape in the residuals as heteroskedasticity (L03, L10).
- **Logarithmic scale (L10, the main bridge for GLM):**
  - log turns multiples into equal steps, and $\log(0) = -\infty$, so true zeros cannot be logged;
  - in `log(y) ~ x`, one unit of $x$ multiplies $y$ by $\exp(b)$;
  - `exp(predict())` gives a typical value close to the geometric mean, not the arithmetic mean;
  - AIC and $R^2$ cannot be compared between $y$ and $\log y$.
- **Uncertainty:** SE, CI, the confidence band for the mean response, and a prediction interval mentioned only as wider (L04); t-test, p-value and $\alpha$ (L05).
- **Predictors:** categorical predictors with a 0/1 switch and a reference level (L06), conditional coefficients (L07), interactions (L08).
- **Model comparison:** $R^2$, adjusted $R^2$, AIC and ΔAIC, only with the same response and the same rows (L09).
- **Proportions and counts so far:**
  - `table()` and `prop.table()` (L02);
  - an `rpois()` beetle-count simulation that students only ran (L10);
  - species counts per island as the L10 response, log-transformed.
- **Never taught:** binomial or Poisson distributions, odds, likelihood as a concept.

### R functions

- **Modelling and inference:** `lm()`, `summary()`, `coef()`, `fitted()`, `resid()`, `confint()`, `predict(newdata, interval = "confidence")`, `anova()`, `AIC()`, `nobs()`, `df.residual()`, `cooks.distance()`, `emmeans()` / `contrast()`.
- **Transformations:** `log()`, `exp()`, `sqrt()`, `I()`, `relevel()`, `factor()`, `expand.grid()`, `seq(length.out)`.
- **Data handling:** `read.csv()`, `str()`, `table()`, `prop.table()`, `tapply()`, `aggregate()`.
- **Plots:** `plot()`, `lines()`, `points()`, `abline()`, `legend()`, `hist()`, `boxplot()`, `barplot()`, `stripchart()`, `qqnorm()` / `qqline()`.
- `deviance()` and `logLik()` appeared only in an L09 extension, where the deviance equals the RSS.
- **New in L11:** `glm()` (D1), `family = binomial`, `family = poisson`, `predict(type = "response")`, and `predict(type = "link", se.fit = TRUE)` for the confidence band. `predict(interval = ...)` does not work for GLMs, so the band needs a new but short recipe.

### Readable output

- `summary(lm)`: Estimate (L03), Std. Error and Residual standard error (L04), t value and Pr(>|t|) (L05), R² and adjusted R² (L09).
- Also known: `confint()` output, `predict()` with fit, lwr and upr, `anova()` tables, and AIC/ΔAIC tables.
- `summary(glm)` (D1) has a coefficient table like `summary(lm)` with `z value` and `Pr(>|z|)` instead of t, plus the dispersion-parameter line, null and residual deviance, AIC and Fisher scoring iterations. Only the coefficient table, and AIC as known from L09, are read in the core.

### Standing practices this lesson triggers

The CSV triggers match `\blm\(` and do not fire on `glm(`. They are extended to `glm(` in the `_internal` change that adds any L11 row, so that `check_prior_practices.R L11` works.

| Practice (lesson) | L11 handling |
| --- | --- |
| `check_table_structure` (L00), `state_observation_unit`, `check_missing_values`, `plot_distribution_before_summary` (L01) | apply as usual |
| `plot_relationship_before_model`, `show_groups_in_plot`, `state_association_not_causation` (L02) | apply; for 0/1 data the relationship plot needs jittered points or binned proportions |
| `check_independence_from_design` (L03) | apply; also the bridge to L12 |
| `plot_residuals_vs_fitted` (L03) | applied to the `lm()` on 0/1 data and counts, to show why it fails; replaced for the GLM by the observed-vs-predicted check (D4), with the reason stated to students |
| `plot_residual_histogram`, `plot_residual_qq` (L03) | omitted for the GLM with the reason stated: normality of residuals is not an assumption of a binomial or Poisson model |
| `check_influential_observations` (L03) | apply: `cooks.distance()` works on the `glm()` object (D1 revision) |
| `report_effect_in_original_units` (L03) | adapted: predicted probabilities and counts on the response scale; `exp(b)` for the Poisson model (D3 covers the logistic model) |
| `stay_within_observed_range` (L03) | apply to every prediction |
| `report_standard_error`, `report_confidence_interval` (L04) | apply; the interval for `exp(b)` comes from `exp(confint())` |
| `show_confidence_band` (L04) | adapted: band on the link scale with `se.fit`, back-transformed |
| `report_effect_size_with_p_value` (L05) | apply; one sentence on `z` versus `t` |
| `state_reference_level` (L06) | only if a categorical predictor is used |
| `check_predictor_correlation`, `interpret_coefficient_conditionally`, `consider_interaction` (L07, L08) | only if the model has two or more predictors (Stage 1 decides) |
| `adjust_pairwise_comparisons` (L06) | not triggered unless groups are compared |

### Terms

- **Known glossary slugs reused:** odezva, prediktor, linearni-model, parametry-modelu, intercept, sklon, efekt, residuum, diagnostika-modelu, heteroskedasticita, qq-graf, cookova-vzdalenost, standardni-chyba, interval-spolehlivosti, pas-spolehlivosti, p-hodnota, binarni-promenna, aic, delta-aic, kandidatni-model, transformace, logaritmicka-skala, geometricky-prumer, normalni-rozdeleni, cetnost, diskretni-promenna.
- **Not yet introduced; candidates for Stage 2 and the `slovnik` workflow:**
  - zobecněný lineární model (GLM), rozdělení odezvy, pravděpodobnost (as the modelled quantity);
  - binomické / Bernoulliho rozdělení, Poissonovo rozdělení;
  - spojovací funkce, logit, lineární prediktor;
  - nadměrný rozptyl;
  - deviance (named only), šance and poměr šancí (Extra, D3), věrohodnost (one sentence, if needed).
- Each is checked against `slovnik/glossary_data.yaml` in Stage 2.

### Forward references from earlier lessons that the swap changes

- **Moodle knowledge records.**
  - L08, L09 and L10 `deferred` entries promise GLM, counts and likelihood "until L12".
  - L01–L05 and L10 promise hierarchical data and pseudoreplication "until L11".
  - These are derived `_internal` files. They are re-pointed in the `_internal` swap edit, after checking which generator produces them.
- **Student-facing text.** Only the L10 closing box and the speaker note on the matching slide encode the lesson order (see Risks). The L05 promise ("probereme později u hierarchických dat") has no lesson number and stays true.
- **Nothing to satisfy.** No earlier lesson promises logistic regression or binary responses explicitly; L06 uses 0/1 only for predictors.

## Inspiration consulted

- Authoring problem to solve: introduce GLM to beginners as one more extension of the linear model ("vše jako model"), not as a new toolbox; make the link function intuitive without algebra; reuse L10's logarithmic scale and multiplicative effects so that the Poisson model feels familiar; keep the scope lean enough for a 14. 12. release.
- Former course material: the 2025/26 course had no GLM lesson. Its practical 11 (`_internal/R/old/011/skript11_2025.R`, data `opyl.txt`, `smokers.txt`, `baits.txt`, `Titanic.txt`) taught the chí-kvadrát, Fisher and binomial tests for categorical data. Rejected as a route: the course rule is one modelling route instead of separate tests. Possibly reusable as a named connection only ("the logistic model with one categorical predictor answers the question of a 2 × 2 table").
- Relevant sources from the course inspiration hub (section "regression, multiple predictors, interactions, or GLMs"):
  - [Modern Statistics with R](https://modernstatisticswithr.com/) – logistic regression and count models presented as a connected family with the linear model; interpretation and diagnostics alongside fitting.
  - [CUNY Biostatistics book](https://jsgosnell.github.io/cuny_biostats_book/) – biology-oriented GLM chapters with "the linear model breaks here" motivation.
  - [genomicsclass / PH525x](https://genomicsclass.github.io/book/) – the linear-model backbone; GLM only as a short extension (checked for depth boundary, not for content).
- Patterns worth borrowing (to be verified and cited in Stage 1):
  - Start by fitting the familiar `lm()` to 0/1 data and to counts, and let students see predictions below 0 or above 1 and negative counts.
  - Show the same linear predictor on two scales: a straight line on the logit/log scale and an S-curve or exponential curve on the response scale.
  - Read results through predictions at chosen predictor values (with intervals), not through coefficients alone.
  - For counts, `exp(b)` as "kolikrát víc" per unit, directly echoing L10.
- Patterns explicitly rejected: maximum-likelihood derivation, the exponential-family form, link-function algebra; deviance-based likelihood-ratio tests as the main inference route; odds-ratio tables as the primary reading of the logistic model (see D3); separate test procedures (chí-kvadrát, Fisher, binomial test).
- Gaps the lesson must fill itself: a beginner-proof picture of "the model predicts a probability, the data are 0/1"; diagnostics students can do with tools they know (see D4).

## Concrete student actions

1. Recognise the response type in a short description of a study (spojitá, binární, počet) and choose the distribution and model.
2. Fit `lm()` to 0/1 data and to counts, find predictions outside the possible range, and explain from the residual plot why the normal linear model does not fit.
3. Fit a logistic model with `glm(..., family = binomial)`, compute predicted probabilities with `predict(type = "response")` for chosen predictor values, draw the fitted curve with its confidence band, and interpret the effect in biological terms.
4. Fit a Poisson model with `glm(..., family = poisson)`, interpret `exp(b)` as a multiplicative change in the expected count with its interval, and check for overdispersion.
5. Write a cautious biological conclusion: the response type and model, the effect on the response scale with its uncertainty, and the main limitation.

## Proposed lesson spine (orientation only; not the Stage 2 story map)

1. Opening question with a binary response; callback to L10 ("vrátíme se k počtům druhů … modely, které s počty a podíly pracují přímo").
2. Three types of response and what "rozptyl kolem předpovědi" looks like for each.
3. `lm()` on 0/1 data fails visibly; the logistic model: linear predictor → logit link → probability; fitting, predictions, confidence band, reading the table.
4. Counts: `lm()` fails differently (negative predictions, variance growing with mean); the Poisson model with the log link; `exp(b)` as a multiplier.
5. Is the model adequate? Observed versus predicted, overdispersion check, Cook's distance (standing practice), AIC between candidate predictors.
6. Conclusion pattern; named further steps (negative binomial, proportions from counts with `cbind()`, GLM with random effects in L12).

## Out of scope this week

- Maximum likelihood estimation beyond one intuitive sentence; deviance algebra; likelihood-ratio tests (`anova(..., test = "Chisq")`) unless D5 decides otherwise.
- Odds and odds ratios as the main interpretation (see D3).
- Binomial models for proportions from counts (`cbind(uspech, neuspech)`), probit and other links, multinomial and ordinal models.
- Negative binomial and quasi-Poisson models beyond naming them as the remedy for overdispersion; zero-inflated models.
- Offsets for unequal effort (unless the Stage 1 dataset requires one; then named only).
- Random effects and GLMM (L12).
- Separate tests for categorical data (chí-kvadrát, Fisher, binomial test).
- Classification metrics (ROC, AUC, confusion matrices).

## Formal depth boundary

### Core and student-visible

- Response types and their distributions; the linear predictor as the familiar $\beta_0 + \beta_1 x$.
- Link function in words and with one numerical example per model (from linear predictor to probability or count), no formula derivation.
- `glm()` with `family = binomial` and `family = poisson` (D1); its coefficient table read like `summary(lm)` (estimate, SE, z, p); `confint()`; `predict(type = "response")`; fitted curve with a confidence band built on the link scale and back-transformed.
- `exp(b)` for the Poisson model.
- AIC for candidate models with the same response.

### Intuitive only

- The logit as "šance na logaritmické škále" – named in one sentence if D3 keeps odds out of the core.
- Overdispersion as "data se rozptylují víc, než Poissonův model připouští", checked by the ratio of residual deviance to residual degrees of freedom.
- Why the table shows `z` instead of `t` (one sentence with L05 vocabulary).

### Extra (written materials only, clearly marked; depends on D3)

- Odds and `exp(b)` of the logistic model as an odds ratio.

### Deferred or out of scope

- See the out-of-scope list above.

## Decisions

### Resolved (Ondřej Mottl, 2026-11-06)

- **D1 – Function for the student-visible model: base `glm()`** (revised by Ondřej Mottl, 2026-11-07; the original `glmmTMB()` decision of 2026-11-06 is kept below).
  - The skripta states that GLMs can be fitted with many functions and uses base `glm()`, the most common one.
  - L12 keeps `glmmTMB()` (not `lme4`) and introduces it as the same model as `glm()` plus a random effect, for example `(1 | strom)`. Without a random effect, `glmmTMB()` gives the same estimates as `glm()` (checked in the Stage 1 probe).
  - Reason for the revision: `cooks.distance()` has no `glmmTMB` method, and the argument for `glmmTMB()` in this lesson ("L12 only adds a random effect to the same function") came from the old order, in which the hierarchical lesson preceded GLM. With `glm()`, every tool students know from `lm()` works unchanged: the `summary()` layout, `plot()`, `cooks.distance()`, `confint()`, `predict(se.fit = TRUE)` and `AIC()`. `lme4` was rejected for L12 because its draft is written with `glmmTMB()`, `lmer()` prints no p-values, and binary and count responses need a separate function there.

  Consequences to carry into Stages 2–5:
  - **Environment:** no new package; `glm()` is in base `stats`. `glmmTMB` is not added to the L11 `renv.lock`, and the planned `glm()` Extra box is dropped.
  - **Installation for students:** none in L11. Students install `glmmTMB` in L12, whose preflight stays as written.
  - **Visible call:** `glm(formula = odezva ~ prediktor, family = binomial, data = ...)` and `family = poisson`.
  - **Readable output:** `summary(glm)` prints the coefficient table with `z value` and `Pr(>|z|)`, plus the dispersion-parameter line, null and residual deviance, AIC and the number of Fisher scoring iterations. Only the coefficient table and AIC are read in the core; the other lines are named, not interpreted.
  - **Cook's distance:** `cooks.distance()` on the `glm()` object (largest values 0.05 for the binary model and 0.33 for the count model on the Stage 1 data).
  - **Overdispersion:** the sum of squared Pearson residuals (`residuals(m, type = "pearson")`) divided by `df.residual(m)`.
  - **Confidence band:** `predict(m, newdata, type = "link", se.fit = TRUE)` on the link scale, then back-transformed.
  - **L12 continuity (renumbering branch):** L12 `skripta.qmd` line 2226 ("V následující lekci budeme modelovat odezvy typu ano/ne a počty. `glmmTMB()` takové modely umí také…") becomes a backward reference along the lines of "V minulé lekci jsme odezvy typu ano/ne a počty modelovali funkcí `glm()`. `glmmTMB()` takové modely umí také, a navíc s náhodnými efekty…". Line 2230 (`glmmTMB()` gives the same results as `lm()`) is extended to `glm()`.

  Original D1 (2026-11-06, superseded): `glmmTMB::glmmTMB()` in the core, so that L12 only adds a random effect to the same function, with base `glm()` named in the text and shown in an Extra box; `glmmTMB` added to the L11 `renv`; Cook's distance from a `glm()` refit.

- **D2 – One data story preferred.** Stage 1 searches first for one data story that supplies both a binary and a count response, for example presence/absence and abundance of a species across sites. Two datasets are accepted only if no single story serves both well. The L10 Galápagos species counts are assessed as a callback.
- **D3 – Probabilities only in the core.** The logistic model is interpreted through predicted probabilities and differences in probability at chosen predictor values, with a confidence band. Odds and the odds ratio `exp(b)` go in an Extra box in the skripta only.
- **D4 – Observed versus predicted.** The model checks are:
  - binned observed proportions against the fitted curve for the binary model;
  - observed versus fitted counts for the Poisson model;
  - the overdispersion ratio for the Poisson model;
  - Cook's distance with `cooks.distance()` on the `glm()` object.

  `DHARMa` and `performance::check_model()` are not used.

- **D5 – Model comparison: AIC.** Candidate models with the same response are compared with AIC and ΔAIC, as in L09. No deviance or likelihood-ratio tests.
- **D6 – Revised `osnova_lekci.md` entry: approved.** The proposed text above is approved; after the D1 revision of 2026-11-07 it names `glm()` instead of `glmmTMB()`. It is applied in the `_internal` L11/L12 swap edit, which needs its own commit authorization.

### Original wording of D5 and D6 (as proposed)

- **D5 – Model comparison.** Recommended: AIC between candidate predictors with the same response (L09 standing tool); no deviance tests. Alternative: also `anova(model_1, model_2, test = "Chisq")`.
- **D6 – Revised `osnova_lekci.md` entry.** Approve the proposed text above (after D1-D5), to be applied in the `_internal` L11/L12 swap edit.

## Risks and dependencies

- Risk: scope overload with two models in one 90-minute lecture. Mitigation: one shared structure (response type → distribution → link → predictions), the skripta carries the complete route, the presentation distils; lean out-of-scope list.
- Risk: the link function becomes a black box. Mitigation: always show the same model on both scales and translate one predicted value by hand.
- Risk: overcorrection into "never use `lm()` for counts" (large counts with roughly constant variance can be fine with `lm()` or a log transformation from L10). Mitigation: one sentence relating GLM to the L10 transformation route and when each is reasonable.
- Risk: timeline. Release on 14. 12. with an exercise by 10. 12. leaves about five weeks for three artifacts. Mitigation: milestones above; exercise priority over presentation polish (swap plan risk table).
- Dependency: L10 forward reference is now wrong. L10 `Learning_materials/skripta.qmd` line 3157 (box "Jsou ostrovy jednoho souostroví nezávislá pozorování?") says dependence comes "v následující lekci" and counts "později"; the speaker note at L10 `Presentation/presentation.qmd` line 2830 says the same. The L10 lecture is on 7. 12., so the fix must be released before then. It is an L10 change with its own branch and authorization; the L10 working tree currently holds uncommitted work on `fix/l10-define-test-power`.
- Dependency: the L11 PollsLive retrieval quiz (retrieves L10) exists and is approved; it moves here from the L12 repository in Stage 4.
- Dependency: glossary terms via the `slovnik` workflow (separate repository change); candidates listed after the starting-knowledge summary.
- Dependency: the `_internal` swap edit of `osnova_lekci.md` (D6) and the HUB schedule swap (swap plan Phase 2).
- Dependency: the Moodle knowledge file `moodle/knowledge/L11.yaml` is built after release; its `readable_output` needs a `summary.glm` entry type.

## Preliminary dataset needs for Stage 1 (not a dataset decision)

- Real biological data with a binary response (presence/absence, survival, infection, germination) and a numeric predictor with a clear biological story; enough observations (roughly 50–300) that the S-curve is visible, with both outcomes well represented across the predictor range.
- A count response (abundance, species richness, number of offspring or visits) with small to moderate counts, including zeros, where `lm()` visibly predicts negative values or misses the growing variance; overdispersion present but not extreme, or a clean way to discuss it.
- Ideally both responses from one data story (D2).
- No hidden grouping that would require random effects (that is L12), or a structure where one observation per site keeps independence plausible.
- Documented provenance, explicit reuse terms, little missingness, an interpretable Czech story; preferred order per `lesson-workflow.md`.

## Decision

- [x] D1-D4 resolved by the human reviewer (Ondřej Mottl, 2026-11-06)
- [x] D5 resolved by the human reviewer (Ondřej Mottl, 2026-11-06: AIC)
- [x] Revised `osnova_lekci.md` entry approved (D6; Ondřej Mottl, 2026-11-06)
- [x] Repository creation, setup and planning branch authorized and done (Ondřej Mottl, 2026-11-06)
- [x] Human reviewer approved this scope (Ondřej Mottl, 2026-11-06)
- [x] Scope locked for implementation
- [x] Continue Stage 1 research on the planning branch
- Notes: Ondřej Mottl resolved D1-D6 and locked the scope on 2026-11-06. On 2026-11-07 he revised D1 to base `glm()` (with `glmmTMB()` kept for L12), after the Stage 1 probe showed that `cooks.distance()` has no `glmmTMB` method; the outcome wording in the proposed `osnova_lekci.md` entry follows. The approved `osnova_lekci.md` entry and the L10 forward-reference fix are separate repository changes.