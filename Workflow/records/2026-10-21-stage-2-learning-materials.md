# Stages 2-3 - Learning Materials and Human Review

## Metadata

- Week: L11
- Date: 2026-10-21
- Author: Claude (Claude Code), working with Ondřej Mottl
- Reviewer: Ondřej Mottl

## Git checkpoint

- Stage group: Stages 2-3 written materials
- Branch: `lesson/l11-skripta`
- Base branch and commit: `main` at `787973d` (merge of the planning PR #1)
- Stages 0-1 PR merged: [x] (#1, 2026-10-21)
- Branch created from updated default branch: [x] (`main` fast-forwarded to `787973d` before branching)
- `git status --short` reviewed before editing: [x] (clean)
- Written-materials PR: not created

## Inspiration consulted

- Relevant sources: [CUNY Biostatistics, linear model extensions](https://jsgosnell.github.io/cuny_biostats_book/content/chapters/Linear_model_extensions.html) (oysters in tanks; feathers of 16 birds), [Modern Statistics with R, section 8.8](https://www.modernstatisticswithr.com/regression.html), and the 2025/26 course deck `_internal/prezentace/stare/10_design_pokusu_nahodne_efekty.pdf` as a content inventory only.
- Which structural or explanatory pattern is being borrowed: the question "kolik nezávislých odpovědí máme?" before any model (CUNY); the same question answered several ways side by side (all rows, tank means, tank as a fixed factor, random intercept); the split-plot idea that a predictor defined at the group level is judged by the number of groups (old deck); the fixed-versus-random checklist (old deck).
- How that pattern is being adapted to Czech, beginner, model-first teaching: every approach is a `lm()` or one `glmmTMB()` call read through familiar output (estimate, SE, interval, df, p); the new idea is what counts as an observation, not new machinery; the random intercept is introduced only after both familiar remedies have shown their limits.
- What from the source is intentionally not being reused: matrix notation, Type III tests and df approximations, DHARMa and `performance` diagnostics, AICc comparison of random structures, nested and crossed random effects, `aov()` with `Error()`, the experimental-design survey of the old deck, simulated data as the main story.

## Numerical check of the story map (2026-10-21)

Scratch probes on `data/zabky_nadrze.csv` (not part of the repository; `glmmTMB` 1.1.15.2 in an untracked library). Every number quoted below comes from this check.

- Data: 485 froglets, 16 tanks (8 dried, 8 not dried), 11-47 froglets per tank; 295 froglets from dried and 190 from non-dried tanks; no missing values. Body length 19-35 mm in whole millimetres (median 25); dry mass 0.088-0.851 g (median 0.178, long right tail); emergence day 41-82 (dried tanks mean 57.6, non-dried 49.2).
- Tank means of body length: non-dried 26.3-30.6 mm, dried 23.0-26.7 mm (the two groups do not overlap).
- Naïve `lm(delka_tela_mm ~ vyschnuti)` on 485 froglets: −3.51 mm, SE 0.199, 95% CI [−3.90; −3.11], df 483, p 4.7e-54.
- `lm()` on the 16 tank means: −3.76 mm, SE 0.617, 95% CI [−5.09; −2.44], df 14, p 2.8e-5. SE ratio 3.1.
- Tank as a fixed factor: `lm(delka_tela_mm ~ factor(nadrz) + vyschnuti)` returns `NA` for `vyschnuti`; with the order reversed, R reports −1.98 mm for `vyschnuti`, which equals the difference between the means of tank 2 (26.68 mm) and tank 54 (28.67 mm), and drops tank 54 instead.
- `glmmTMB(delka_tela_mm ~ vyschnuti + (1 | nadrz), REML = TRUE)`: −3.73 mm, SE 0.604, z −6.17, Wald 95% CI [−4.91; −2.54]; tank SD 1.145 mm, residual SD 1.901 mm; share of variability between tanks 0.27. With default ML: SE 0.564, tank SD 1.059 mm.
- Tank baselines from the mixed model lie between the tank means and the treatment means; the largest pull is 0.47 mm for tank 45 (11 froglets), at most 0.13 mm for tanks with 40 or more froglets.
- Residuals of the mixed model are right-skewed (skewness 1.77; a few large froglets); tank baselines roughly symmetric. Dry mass gives the same picture (SE ratio 3.0; log dry mass 3.2).
- Within-tank predictor `den_pokusu`: ignoring tanks, slope −0.007 mm per day (SE 0.018, p 0.69); with tank as a fixed factor +0.233 mm per day (SE 0.012); with a random intercept +0.231 mm per day (SE 0.012). Later froglets are larger within each tank, but dried tanks produced froglets both later and smaller, which hides the pattern when tanks are ignored.
- Internal check only (not for the lesson, Stage 0 decision 6): with 16 tanks the Wald test of the mixed model raised a false alarm in 6 % of simulated null worlds, the naïve `lm()` in 52 %.
- L05 callback: 392 crabs in 13 salt marshes, latitude slope 0.485 mm per degree with SE 0.034 for all crabs versus 0.490 with SE 0.080 for marsh means.

## Mandatory story map

- Artifact: Learning materials (`Learning_materials/skripta.qmd`)
- Granularity: one row per major section or concept block
- Story-map status: complete
- Heading-strip audit completed: [x]
- Knowledge-state audit completed: [x]
- Human story-map approval: approved
- Approved by: Ondřej Mottl
- Approval date: 2026-10-21
- Approval decision and requested revisions: Ondřej Mottl approved revision 1 of the story map (51 rows in six parts, with the five-step "Vaše vlastní studie" design thread and Part F requested by him) and the knowledge-state ledger on 2026-10-21, after deciding open choices 1-7 (see "Decisions on the open choices").

Revision 1 (2026-10-21): at Ondřej Mottl's request the map gained a study-design angle — a thread of five "Vaše vlastní studie" boxes at the end of Parts A-E (rows 9a, 19a, 24a, 33a, 38a) and a new Part F "Jak naplánovat vlastní studii" (rows 39a-39d) with a checklist, a worked reference design and a one-page template. Lettered rows keep the existing block numbers stable. Control and random allocation appear only intuitively inside the checklist; formal design theory stays out of scope (Stage 0).

`Internal role` and `Speaker note` are backstage planning text. `Student-facing heading` holds only the exact proposed rendered heading; no student-facing prose has been drafted. Proposed H1 parts are marked **Part**; they group the blocks for self-study and later for the Stage 4 section dividers.

| Order | Internal role | Student-facing heading | Speaker note |
|---|---|---|---|
| 1 | Opening biological question | Vylézají z tůní, které vyschly, menší žabky? | Drying and refilling of ponds and pools in droughts, also in the Czech landscape. Pose the question; keep "how sure can we be?" open for Part B. Illustration S1 (`Learning_materials/images/GENERATED_IMAGES.md`). |
| 2 | Retrieval of two open questions | Co zůstalo otevřené u krabů a u ostrovů? | Recall the L05 sentence that crab means would be explained later and the L10 closing box on 30 islands. Individual prompt: "why did we use 13 marsh means instead of 392 crabs?" with no answer yet. |
| 3 | Learning outcomes | Co se v této lekci naučíte | Five outcomes in student language; the terms pseudoreplikace, náhodný intercept, pevný a náhodný faktor appear only as destinations. |
| 4 | **Part A** divider | Žabky z pokusných nádrží | Part heading only. |
| 5 | Source and experimental design | Pokus se šestnácti nádržemi | Ward et al. (2023): 64 cattle tanks, only the 16 amphibian-only tanks produced froglets; 50 tadpoles per tank; drying applied to whole tanks before the tadpoles were added. Illustration S2 of outdoor tanks, then a drawn schematic of the 8 + 8 design. Provenance and the preparation route in a collapsed box. |
| 6 | Observational unit and inspection habit | Jeden řádek tabulky představuje jednu žabku | Visible `read.csv()`, `str()`, `summary()`, `colSums(is.na())`. Body length in whole mm, dry mass with a long right tail (L10 vocabulary). |
| 7 | Data structure check | Kolik žabek vylezlo z které nádrže? | `table(data_zabky$nadrz)`: 11-47 per tank; 295 versus 190 froglets by treatment. Plant the density observation used in block 34. |
| 8 | First data moment | Jak velké jsou žabky z vyschlých a nevyschlých nádrží? | All 485 froglets by treatment (graf jednotlivých hodnot with box plot). Prompt: describe the difference; the gap looks clear. |
| 9 | Same data, new layer: tanks | Stejné žabky rozdělené podle nádrží | Same values split by tank and coloured by treatment. Prompt: what do froglets from one tank have in common? Tanks differ even within one treatment. |
| 9a | Design thread, step 1 (box) | Vaše vlastní studie: otázka a měření | Callout at the end of Part A. Students write their own ecological question (organism, response with unit, the comparison or gradient, where they would sample). Collapsed reference answer for the running example: dragonfly larvae in pools surrounded by forest versus fields. |
| 10 | **Part B** divider | Kolik nezávislých odpovědí máme? | Part heading only. |
| 11 | Hierarchy named from the design | Žabky v nádržích, nádrže v pokusu | Diagram froglet → tank → treatment; name hierarchická data and mention other everyday hierarchies (repeated measurements of one individual, organisms at one site, plots in one block) without modelling them yet. |
| 12 | Level of the predictor and unit of replication | Na které úrovni se rozhodovalo o vyschnutí? | Drying was decided per tank, so the tank is the unit of independent replication: 16 answers to the drying question, not 485. Name jednotka nezávislé replikace next to jednotka pozorování (L02, L05). Prompt before the answer. |
| 13 | Familiar model on all rows | Model, který počítá každou žabku zvlášť | Visible `lm(delka_tela_mm ~ vyschnuti)`; −3.51 mm, SE 0.199, CI, df 483, p. Read with L06 reference group and L05 output. |
| 14 | Familiar model on unit means | Model, který počítá každou nádrž jednou | Visible `aggregate()` and `lm()` on 16 tank means; −3.76 mm, SE 0.617, df 14. |
| 15 | Side-by-side evidence | Stejný rozdíl, trojnásobná nejistota | Table and interval plot of the two models. The estimate barely moves; SE and interval width triple; df 483 versus 14. |
| 16 | Explanation and concept naming | Proč šestnáct nádrží nevydá za 485 žabek | Froglets from one tank share water, food and history, so they resemble each other. L04: SE shrinks with the number of independent observations; counting 485 makes the uncertainty look too small and df too large; L05: a too small SE makes false alarms more likely than α suggests (in words only). Name pseudoreplikace here. |
| 17 | Misconception checkpoint | Pomůže změřit víc žabek z každé nádrže? | Prediction prompt with explanation: more froglets per tank make each tank mean more precise, but add no tanks; more tanks would. |
| 18 | Callback that fulfils the L05 promise | Proč jsme u krabů a křídlatky pracovali s průměry | L05 crabs: 13 marshes, SE 0.034 for all crabs versus 0.080 for marsh means; L07 knotweed plants averaged per population. Both earlier lessons used the honest unit. |
| 19 | Limits of the familiar remedy | Co průměry nádrží zahodí | Tanks with 11 and 47 froglets count the same; within-tank information and froglet-level predictors are lost. Open question: can a model keep every froglet and still count tanks? |
| 19a | Design thread, step 2 (box) | Vaše vlastní studie: kolik nezávislých odpovědí? | Students name the level at which their predictor varies, the unit of independent replication, and how many units versus measurements per unit they could realistically collect. Reference answer: the pool is the unit; more pools beat more larvae per pool. |
| 20 | **Part C** divider | Nádrž jako další prediktor? | Part heading only. |
| 21 | Predict and test a familiar idea | Co se stane, když přidáme nádrž do modelu? | Prompt: predict what `lm(delka_tela_mm ~ factor(nadrz) + vyschnuti)` reports. Output: `NA` for drying. Collapsed box: in the reversed order R reports −1.98 mm, which is only tank 2 minus tank 54. |
| 22 | Explanation and concept naming | Vyschnutí a nádrž nesou stejnou informaci | Every tank is either dried or not, so once each tank has its own level nothing is left to estimate drying from. Name pevný faktor (levels of interest, own coefficient each); a predictor that varies only between groups cannot sit beside the group as a fixed factor. |
| 23 | When the fixed factor helps (within-group predictor) | Pozdější žabky jsou větší, ale jen uvnitř nádrží | `den_pokusu` varies within tanks. Ignoring tanks: −0.007 mm per day, p 0.69; with tank as a fixed factor: +0.23 mm per day, SE 0.012. Figure: one cloud versus lines within tanks. Open choice 1. |
| 24 | Interpretation and generalisation | Proč se vztah ukázal až uvnitř nádrží | Dried tanks produced froglets later and smaller, so between-tank differences hide the within-tank pattern. Blocks and repeated measurements are the same situation; name blok. Bridge: drying still needs a model that keeps froglets but counts tanks. |
| 24a | Design thread, step 3 (box) | Vaše vlastní studie: co se mění uvnitř jednotek? | Students list what varies within their units (date, position, size class, observer) and whether pairing or blocks would remove noise (for example, sampling forest and field pools in the same region as one block). Reference answer included. |
| 25 | **Part D** divider | Každá nádrž má vlastní výchozí úroveň | Part heading only. |
| 26 | Groups as a sample; concept naming | Nádrže jako výběr z mnoha možných tůní | We do not care about tank 27 as such; tanks stand for possible ponds. Their baselines vary around the treatment mean like draws from a normal distribution (L10 reference shape). Illustration S3. Name náhodný faktor and náhodný efekt. |
| 27 | Text-only equation → one tank's numbers → symbols | Z čeho se skládá délka jedné žabky | Text-only equation: odhadnutá délka žabky = intercept + rozdíl po vyschnutí + odchylka nádrže; then one froglet from tank 45 with its numbers; then $y_{ij} = \beta_0 + \beta_1 x_{ij} + u_j + e_{ij}$, every symbol explained. Name náhodný intercept and smíšený model here. |
| 28 | Software step | Model s náhodným interceptem v R | Visible `requireNamespace()` check with a commented `install.packages("glmmTMB")`; `glmmTMB::glmmTMB(formula = delka_tela_mm ~ vyschnuti + (1 \| nadrz), data = data_zabky)`; read `(1 \| nadrz)` aloud. `REML = TRUE` with one plain sentence (decision 4). |
| 29 | Reading the fixed effect | Jak velký je rozdíl a jak přesně ho známe | −3.73 mm, SE 0.604, interval [−4.91; −2.54] from `confint()`; compare with the tank-means SE 0.617. One sentence on why the output shows z instead of t (normal approximation; slightly optimistic with few groups). |
| 30 | Reading the variance components | Jak moc se liší nádrže a jak moc žabky v jedné nádrži | Tank SD 1.15 mm, residual SD 1.90 mm, in the units of body length; about a quarter of the remaining variability lies between tanks and three quarters between froglets of one tank (plain share from the two variances; no ICC term or formula, decision 3). |
| 31 | Visual of partial pooling | Kde leží odhadnuté výchozí úrovně nádrží? | Tank means versus mixed-model baselines versus treatment means; the smallest tanks are pulled most (tank 45 by 0.47 mm). No formula, no term "shrinkage" required. |
| 32 | Synthesis of the approaches | Čtyři způsoby, jak odpovědět na stejnou otázku | Table: all froglets, tank means, tank as fixed factor (not possible), random intercept — estimate, SE, interval, what each counts. |
| 33 | Diagnostics in known terms | Co prozradí residua a výchozí úrovně nádrží | Histogram and Q–Q plot of residuals (right skew from a few large froglets) and of the 16 baselines; L10 reading of shape; only 16 baselines, so their shape is judged loosely. Optional collapsed box: dry mass shows the same conclusion. |
| 34 | Extra: random slope | Extra: Když se nádrže liší i ve sklonu | Collapsed box with one figure of tank-specific slopes of `den_pokusu` and one formula line `(1 + den_pokusu \| nadrz)`; no interpretation of the slope variance (Stage 0 decision 5). |
| 33a | Design thread, step 4 (box) | Vaše vlastní studie: zápis modelu | Students write the `glmmTMB` formula for their study (`odezva ~ prediktor + (1 \| jednotka)`) and say what one row of their table would be. Reference formula: `delka_larvy_mm ~ okoli + (1 \| tun)`. No fitting. |
| 35 | **Part E** divider | Pevný, nebo náhodný faktor? | Part heading only. |
| 36 | Decision questions | Zajímají nás konkrétní úrovně, nebo celý soubor možných úrovní? | Checklist: do we care about these particular levels; would they recur in a repeated study; are there enough levels (about 5 or more); does the predictor of interest vary between or within groups. |
| 37 | Transfer task | Pevný, nebo náhodný? Šest situací z biologie | Short scenarios: species compared in a pot experiment, sampling sites along a river, field blocks, individuals measured repeatedly, sex, three lakes only. Collapsed answers with reasons. |
| 38 | Design limits | Když nepomůže ani model: jedno ošetřené povodí | Hubbard Brook: one calcium-treated and one reference watershed; Mack Creek: one clear-cut and one old-growth section. With one unit per treatment no model can estimate the treatment's variability. |
| 38a | Design thread, step 5 (box) | Vaše vlastní studie: pevný, nebo náhodný faktor? | Students apply the block-36 questions to their own grouping variables and check that the treatment or gradient has several independent units, not one per level. Reference answer: pool random; surrounding (forest/field) fixed; at least several pools of each kind. |
| 39 | Biological conclusion | Vylézají z vyschlých nádrží menší žabky? | Cautious conclusion: about 3.7 mm shorter (interval about 2.5-4.9 mm) from 16 tanks; limitations: dried tanks produced more froglets, so drying and density are confounded (L07); 16 tanks; tanks are not wild pools. |
| 39a | **Part F** divider | Jak naplánovat vlastní studii | Part heading only. |
| 39b | Design checklist (synthesis of the thread) | Sedm otázek před prvním měřením | Ordered checklist: question and response; level at which the predictor varies; unit of independent replication; number of units versus measurements per unit; what varies within units (blocks, pairing, time); fixed versus random grouping; model formula sketched before collecting data. Each item points back to the block that earned it. Control and random allocation mentioned only intuitively (no design theory, Stage 0 out-of-scope list). |
| 39c | Worked reference example | Larvy vážek v tůních: návrh od otázky po model | The dragonfly example from the thread assembled in one place: question, sampling plan (for example 12 forest and 12 field pools in 6 regions, 10 larvae each), table layout of one row per larva, unit of replication, fixed and random parts, model formula, and the main risks (few pools, confounded surroundings). Illustration S4. Labelled as a hypothetical planning example; no data and no fitted numbers. |
| 39d | Transfer to the student's own project | Váš návrh na jedné stránce | Template for a one-page design of the student's own hierarchical study, filled from their five thread boxes; suggested use for a semester project or discussion with a supervisor. |
| 40 | Bridge to the next lesson | Co když nás nezajímá délka, ale přežití? | Survival and counts per tank need a different response distribution; `glmmTMB` uses the same formula with another `family` (next lesson). No GLM content. |
| 41 | Summary | Shrnutí | Five to six key points. |
| 42 | Glossary | Slovníček pojmů | Interactive table in HTML, online link in PDF (template). |

### Heading strip (audit)

Read alone, the headings run: question about froglets → open questions from crabs and islands → outcomes → the experiment and its table → how many froglets per tank → first and grouped view → how many independent answers → hierarchy → level of the decision → model per froglet → model per tank → same difference, triple uncertainty → why 16 tanks are not 485 froglets → would more froglets help → why earlier lessons used means → what means lose → tank as a predictor? → what happens when we add it → drying and tank carry the same information → later froglets larger only within tanks → why → each tank its own baseline → tanks as a sample of ponds → what one froglet's length consists of → the model in R → how large and how precise → how much tanks and froglets differ → where the baselines lie → four ways to answer → what residuals reveal → extra on slopes → fixed or random → which levels matter → six situations → when no model helps → the conclusion → how to plan one's own study → seven questions before the first measurement → dragonfly larvae from question to model → your design on one page → what if survival → summary. The five "Vaše vlastní studie" box titles recur at the end of Parts A-E as one recognisable thread.

- No workflow labels (motivation, bridge, formalisation) and no sequencing words (*nejdřív, potom, teď, dnes, znovu, nakonec, teprve*) appear in the headings.
- Technical terms appear in a heading only after the block that introduces them: náhodný intercept (block 27) before block 28; pevný/náhodný faktor (blocks 22 and 26) before Part E. "Výchozí úroveň" in the Part D divider is plain language and is explained in block 26.

## Active-learning plan

The learning materials use individual self-study prompts, each followed by a short payoff or a collapsed answer. Partner work and PollsLive belong to the separately approved presentation story map.

| Story-map block | Student task | Self-study implementation | Teaching purpose |
|---|---|---|---|
| 2 | Explain why L05 used 13 marsh means instead of 392 crabs. | Left open; answered in block 18. | Activate the open question. |
| 8 | Describe the difference between the two treatments. | Short payoff. | Notice the effect before uncertainty. |
| 9 | Say what froglets from one tank have in common. | Payoff below the figure. | Notice grouping before naming it. |
| 12 | Decide how many independent answers the data give to the drying question. | Answer revealed below. | Find the unit of replication. |
| 15 | Predict which of the two models gives the wider interval. | Table reveal. | Connect the unit to uncertainty. |
| 17 | Decide whether measuring more froglets per tank would help. | MCQ with an explanation for every option. | Repair "more rows = more information". |
| 21 | Predict what R reports when the tank is added. | Output reveal. | Make the limit of the fixed factor experienced, not told. |
| 23 | Predict the direction of the day-of-emergence relationship within tanks. | Figure reveal. | Contrast between- and within-tank information. |
| 30 | Say whether tanks or froglets within a tank differ more. | Payoff with the two SDs. | Read variance components in units. |
| 37 | Classify six grouping variables as fixed or random. | Collapsed answers with reasons. | Transfer the decision questions. |
| 39 | Write a two-sentence conclusion with the unit of replication and one limitation. | Model answer. | Conditional biological conclusion. |
| 9a, 19a, 24a, 33a, 38a | Build one's own hierarchical study step by step. | Five "Vaše vlastní studie" boxes, each with a collapsed reference answer for the dragonfly example. | Transfer each concept to the student's own ecological question. |
| 39d | Fill a one-page design of one's own study. | Template assembled from the five boxes. | Practise planning before collecting data. |

## Knowledge-state ledger

Read each row as the state before and after its matching story-map block. A question may point forward, but an answer may use only evidence already shown.

| Concept block | May assume before | Introduced or earned here | Must not assume yet | Evidence or experience |
|---|---|---|---|---|
| 1 — Question | Ponds, tadpoles, metamorphosis are everyday biology. | Lesson question; "how sure?" left open. | Any model; any hierarchy vocabulary. | Question, optional photo. |
| 2 — Retrieval | L05 crab marsh means and its promise; L10 islands box; L02 rows ≠ independent units. | The open question why means were used. | Its answer. | Two recalled sentences. |
| 3 — Outcomes | Course workflow. | Destinations named. | Their meaning. | Outcome list. |
| 5-7 — Data | Observations, variables, `NA`, `str()`, `summary()`, `table()` (L00-L10); skewness vocabulary (L10). | Source, design (drying per tank), unit, counts per tank, ranges. | Unit of replication; hierarchy as a term. | Design diagram; visible inspection code. |
| 8 — First view | Graphs of a numeric variable by group (L01, L06). | A clear difference between treatments. | Its uncertainty. | Graph of individual values. |
| 9 — Tanks | Block 8. | Froglets of one tank resemble each other; tanks differ within a treatment. | The words hierarchie, replikace. | Same data split by tank. |
| 9a — Thread 1 | Blocks 5-9; L01-L10 habit of naming response and unit. | Own question, response and sampling idea. | Unit of replication. | Own idea; reference example. |
| 11 — Hierarchy | Blocks 5-9. | hierarchická data; other everyday hierarchies named. | How to model them. | Diagram. |
| 12 — Unit | jednotka pozorování (L02, L05); block 11. | jednotka nezávislé replikace = tank; 16 versus 485. | Consequences for SE. | Design diagram. |
| 13 — Model per froglet | `lm(y ~ skupina)`, reference group (L06); SE, CI, df, p (L04-L05). | Naïve estimate and its uncertainty. | That it is too optimistic. | R output. |
| 14 — Model per tank | Block 13; `aggregate()` or group means (L05, L07). | Honest baseline analysis on 16 means. | Mixed models. | R output. |
| 15 — Comparison | Blocks 13-14. | Same estimate, three times the SE, df 483 versus 14. | The term pseudoreplikace. | Table and interval plot. |
| 16 — Explanation | SE and the number of observations (L04); type I error (L05). | Similarity within tanks; pseudoreplikace named; false-alarm risk in words. | Any simulation; mixed models. | Blocks 9 and 15. |
| 17 — Checkpoint | Block 16. | More froglets per tank ≠ more tanks. | — | MCQ. |
| 18 — Callback | L05 crabs, L07 knotweed; block 16. | Earlier lessons already used the honest unit. | — | Two recalled numbers. |
| 19 — Limits of means | Blocks 14-18. | Means weigh tanks equally and lose within-tank information. | A model that solves it. | Counts per tank (block 7). |
| 19a — Thread 2 | Blocks 11-19. | Own unit of replication; units versus measurements per unit. | Fixed or random grouping. | Own idea; reference example. |
| 21 — Tank added | Categorical predictors, reference group (L06); multiple predictors (L07). | R returns `NA` for drying; reversed order gives a tank difference. | Why. | R output. |
| 22 — Same information | Block 21. | A between-group predictor is fully determined by the group; pevný faktor named. | Random factors. | Design table tank × treatment. |
| 23 — Within-tank predictor | `lm()` with two predictors (L07); block 22. | A within-group predictor can be estimated with the group as a fixed factor; the relationship can hide between groups. | Random intercept. | Figure and two outputs. |
| 24 — Blocks | Blocks 22-23; confounding (L07). | blok; repeated measurements as the same situation. | Random effects. | Short examples. |
| 24a — Thread 3 | Blocks 23-24. | Own within-unit variables, blocks or pairing. | Model notation. | Own idea; reference example. |
| 26 — Sample of tanks | Population and sample (L04); normal reference shape (L10). | náhodný faktor, náhodný efekt; baselines vary around the mean. | Model notation. | Figure of tank means around the treatment means. |
| 27 — Equation | Model notation $y_i$, $\beta_j$, $e_i$ (L03-L08); block 26. | Text-only equation, one tank's numbers, $u_j$ and $e_{ij}$; náhodný intercept, smíšený model named. | Output reading. | Worked numbers for tank 45. |
| 28 — Fitting | `pkg::fn()` calls, formula syntax (L00-L10); block 27. | `glmmTMB()` call and `(1 \| nadrz)`. | Interpretation of the output. | Visible code. |
| 29 — Fixed effect | Estimate, SE, CI, p (L04-L05); block 15. | Mixed-model estimate and interval ≈ tank-means analysis; z instead of t. | — | R output and `confint()`. |
| 30 — Two SDs | SD and residual SD (L01, L03-L04). | Between-tank and within-tank SD in mm; plain share between tanks. | The ICC term and formula. | R output. |
| 31 — Baselines | Blocks 14, 26-30. | Baselines lie between tank means and treatment means; small tanks move most. | The word shrinkage as a requirement. | Figure. |
| 32 — Synthesis | Blocks 13-31. | What each approach counts and estimates. | — | Table. |
| 33 — Diagnostics | Histogram, Q–Q plot, residuals, skewness (L03, L10). | Residual and baseline checks for a mixed model. | Specialised mixed-model diagnostics. | Two diagnostic plots. |
| 34 — Extra slope | Interaction idea (L08); block 23. | Groups may differ in slope (Extra only). | Interpreting the slope variance. | Collapsed figure. |
| 33a — Thread 4 | Blocks 27-28. | Own model formula with `(1 \| jednotka)`; one row of the own table. | Fixed versus random checklist. | Own idea; reference formula. |
| 36 — Decision questions | Blocks 22, 26. | Fixed versus random checklist, about 5+ levels. | — | Checklist. |
| 37 — Transfer | Block 36. | Classification in new biological designs. | — | Six scenarios. |
| 38 — Design limits | Blocks 12, 36. | One unit per treatment cannot be rescued by any model. | — | Two LTER examples. |
| 38a — Thread 5 | Blocks 36-38. | Own grouping classified; several units per treatment level. | — | Own idea; reference answer. |
| 39 — Conclusion | All blocks; confounding (L07). | Conditional answer with unit of replication and limitations. | Count or survival models. | Evidence card. |
| 39b — Checklist | Blocks 9a-38a. | Seven ordered design questions; control and random allocation intuitively. | Formal design theory, power analysis. | Checklist with back-links. |
| 39c — Reference design | Block 39b. | A complete design assembled from question to formula, with risks. | Fitted results for it. | Worked example without data. |
| 39d — Own one-page plan | Blocks 39b-39c and the five thread boxes. | Student's own design on one page. | — | Template. |
| 40 — Bridge | All blocks. | A different response needs a different `family`. | GLM content. | One open question. |

## Glossary coverage plan

Existing slugs to use (checked in `slovnik/pojmy.yaml`, commit `c9f9003`): `hierarchicka-data`, `pseudoreplikace`, `opakovana-mereni`, `pevny-faktor`, `nahodny-faktor`, `jednotka-pozorovani`, `vyber`, `nahodny-vyber`, `populace`, `standardni-chyba`, `interval-spolehlivosti`, `stupne-volnosti`, `p-hodnota`, `chyba-i-typu`, `referencni-skupina`, `kategoricka-promenna`, `konfundovani`, `residuum`, `intercept`, `efekt`, `variabilita`, `rozptyl`, `normalni-rozdeleni`, `sikmost`, `qq-graf`, `graf-residui`, `diagnostika-modelu`.

Candidates to add through the `slovnik` workflow (separate repository and authorization), with proposed Czech forms to confirm and then record in `terminology.md`:

- **jednotka nezávislé replikace** (experimental unit; avoid "experimentální jednotka" as the main term because L11 also uses observational data examples);
- **smíšený model** (lineární smíšený model; mixed model);
- **náhodný efekt** and **pevný efekt** (random / fixed effect; the existing slugs `nahodny-faktor` and `pevny-faktor` stay for the factors);
- **náhodný intercept** (random intercept; plain-language gloss *výchozí úroveň skupiny*);
- **blok** (block in an experimental design);
- (dropped after decision 3: no term for the intraclass correlation is needed.)

## Environment note for drafting

- Add `glmmTMB` to the L11 project library with `renv::install("glmmTMB")` and record it with `renv::snapshot()` once the skripta uses it. The same snapshot should record `glossary`, `showtext` and `sysfonts` (used by the template setup, recorded in L10's lockfile, missing from the inherited L11 lockfile). Never edit `renv.lock` by hand.
- The fresh-clone bootstrap problem (missing `renv/library/`) is recorded in the Stage 1 record as a template issue.

## Decisions on the open choices (Ondřej Mottl, 2026-10-21)

1. Within-tank block: **keep `den_pokusu`** (blocks 23-24).
2. Main response: **`delka_tela_mm`**; dry mass only in the collapsed diagnostic box.
3. Share of variability between tanks: the author did not know the term ICC; therefore the lesson gives only the plain share ("about a quarter of the remaining variability in body length lies between tanks, three quarters between froglets of one tank"), computed from the two variances, **without naming ICC** and without a formula.
4. REML: the author delegated the decision. Applied recommendation: **`REML = TRUE`** in the visible call with one plain sentence (the variance of tanks is estimated after the treatment effect, similar to dividing by n − 1 for the SD in L01), because its SE (0.604) matches the honest tank-means analysis (0.617) better than the default (0.564). The author may override.
5. Images: illustrations are generated by a separate agent from a prompt file, `Learning_materials/images/GENERATED_IMAGES.md` (S1-S4: drying pool, outdoor tanks, tanks standing for pools in a landscape, dragonfly-larvae pools for Part F). The 8 + 8 design diagram stays a drawn figure from the data.
6. L05 crab callback: **the two printed SEs only**.
7. Reference example of the design thread: **dragonfly larvae** in forest versus field pools, labelled as a hypothetical planning example.

## Open choices for the human reviewer (as presented)

1. **Within-tank block (blocks 23-24).** Recommended: keep `den_pokusu` within tanks — real data, the same dataset, and a striking contrast (no relationship ignoring tanks, +0.23 mm per day within tanks). Risk: it is a between-versus-within (Simpson-type) pattern that adds load. Alternative: a short second example (for example `ChickWeight` growth within chicks) or only a verbal block.
2. **Main response.** Recommended: body length `delka_tela_mm` (intuitive unit, less skew); dry mass only in a collapsed diagnostic box. Alternative: dry mass as the main response.
3. **Share of variability between tanks (block 30).** Recommended: give it as an intuitive share ("about a quarter") without the ICC formula, ICC named at most once. Alternative: omit the share.
4. **REML in the visible call (block 28).** Recommended: `REML = TRUE` with one plain sentence, because its SE (0.604) matches the honest tank-means analysis (0.617) better than the default ML (0.564). Alternative: default ML without the extra argument.
5. **Images.** No licensed photo of the tanks exists in the dataset. Recommended: a drawn design diagram (blocks 5 and 11) plus a reusable photo of a drying pool or of *Lithobates blairi* if one with a clear licence is found in Stage 2B; otherwise no photo.
6. **L05 crab callback (block 18).** Recommended: recall with the two printed SEs only. Alternative: a small visible worked example with `pie_crab.csv` from L05.
7. **Reference example of the design thread.** Recommended: dragonfly larvae in Czech pools surrounded by forest versus fields (hypothetical design, no data, clearly labelled as a planning example). Alternatives: a Czech amphibian monitoring design, or let each box use only the student's own idea without a reference answer.

## Stage 2A - Structural draft

- Story map completed and explicitly human-approved before full prose: [x] (Ondřej Mottl, 2026-10-21)
- Section order complete: [x]
- First visual/table included: [x]
- First interpretation prompt included: [x]
- Misconception checkpoint included: [x]
- Bridge to next concept included: [x]

### Structural draft notes

- Opening biological question: drying and refilling of pools in droughts; „Vylézají z tůní, které vyschly a znovu se naplnily, menší žabky? A jak jistě to můžeme z naměřených dat tvrdit?“ (document title and the Hlavní otázka box; block 1 has no separate heading, following L10).
- First data moment: the 8 + 8 design schematic with froglet counts per tank, then the visible inspection and the base-R box plot with individual froglets.
- Where the model-based framing first appears: block 13, `lm(delka_tela_mm ~ vyschnuti)` on all froglets, read with the L06 reference group.

### Deviations from the approved story map

- Headings of blocks 5 and 16 use computed numbers („Pokus se 16 nádržemi“, „Proč 16 nádrží nevydá za 485 žabek“) instead of words, because data-derived numbers in headings must be inline R; the hidden data-loading chunk therefore sits directly before the Part A heading.
- Block 18 (L05 crabs) reads an unchanged copy of `L05/data/pie_crab.csv` (`data/pie_crab.csv`, documented in `data/README.md`) so that both SEs are computed, not typed.
- Block 39c puts the dragonfly model formula below the table instead of inside it (a `|` cannot be written inside a Markdown table cell in the PDF).
- Block 30 shows the share of variability as a text-only and a numeric equation without a symbolic stage, because the author decided against the ICC term and formula (decision 3).
- After the independent review, the headings of blocks 15 and 23 were neutralised because they revealed the answer to the prediction prompt directly below them: „Stejný rozdíl, trojnásobná nejistota“ → „Který model je přesnější: všechny žabky, nebo průměry nádrží?“ and „Pozdější žabky jsou větší, ale jen uvnitř nádrží“ → „Souvisí den metamorfózy s délkou žabky?“. The author may restore the approved wording.
- Block 39 gained the student task „Napište závěr“ above the model answer, as promised in the active-learning plan.

### Independent reviews (2026-10-21)

- Lesson-vision review (`.ai/agents/vision-corrector.md`), read-only subagent, model Sonnet (capable general-purpose model for a complete-lesson review). Verdict: matches the approved vision; review-ready after a small revision pass. Resolved: all hardcoded data-derived values (headings, alt texts via `!expr`, dragonfly design inputs defined once in `navrh-vazky-vstupy`, p-value condition); two answer-revealing headings; the worked equation in block 27 (indicator in the text-only equation, an added intermediate line, „tři části“ wording); „náhodou vyschly“; removed forward-steering sentence; a sentence on when simpler solutions suffice (outcome 5); the conclusion task; „nepatrně užší“ → „o něco užší“; `aggregate(x = …)`; rounded `coef(summary())` output; „numerických“; non-causal „která zbývá po zohlednění vyschnutí“; an orienting sentence for the `glmmTMB` summary header; hidden-chunk `$`, `paste()` and long lines replaced with `dplyr::pull()`, `purrr::chuck()`, `stringr::str_glue()`/`str_c()`. Re-rasterised the final PDF and inspected the changed pages.
- Glossary-coverage review (`.ai/agents/glossary-coverage-reviewer.md`), read-only subagent, model Haiku (economical model for a bounded check). 59 first-occurrence wrappers added per `##` section; the HTML now contains 109 glossary tooltips. Not wrapped by choice: prose under H1 parts without `##` sections (introduction, outcomes, bridge, summary), generic words (`odhad`, `pozorování`, `úroveň`).
- Not resolved (outside this lesson's source): callout headers can be separated from their body at a page break in the PDF (pp. 22, 35, 36); the Typst callout style belongs to `_brand`. The four illustration PNGs (3,4 MB each) make the HTML about 23 MB and the PDF about 17 MB; a web-sized derivative is proposed to the author. New glossary terms still need slugs in `slovnik`.

## Stage 2B - Development pass

- Major concept blocks have visual anchors: [x]
- Interpretation prompts expanded: [x]
- Explanatory payoff text improved: [x]
- Transitions revised for self-study readability: [x] (sequencing words such as „teď“ removed from transitions)
- Glossary markup checked where relevant: [x] (independent glossary-coverage review, 59 wrappers added)

### Development pass notes

- Which concept block improved most: Part C — the `NA` for drying when the tank is a fixed factor (and the reversed-order −1,98 mm that is only tank 2 minus tank 54) makes the limit of fixed factors visible instead of asserted.
- Which visual or comparison became the main anchor: the side-by-side tables (two models in block 15, four approaches in block 32) and the tank-by-tank plot in block 9.
- Where the lesson still feels thin: Part F has no data by design; the partial-pooling figure (block 31) shows only small shifts (at most 0,47 mm) because the tanks are large.
- Implementation notes: hidden computations use a separate hidden copy of the data (`data_zabky_skryte`) beside the visible `data_zabky`; numbers inside display math use `R/Functions/format_cz_math.R` so that the decimal comma and minus sign render correctly in MathJax and Typst; `glmmTMB` was installed into the project library with `renv::install()` (lockfile snapshot still pending).
- Rendered with `R/render_skripta.R`: HTML 23 MB, PDF 17 MB, 38 pages; no R errors or warnings; visual check of all PDF pages at 60 dpi. Size is driven by the four illustration PNGs (3,4 MB each, 1536 × 1024 RGBA); a decision on web-sized derivatives is open.

## Quality check notes

- What improved most:
- What remains weak:
- What needs reviewer focus:

## Stage 3 - Human review gate

- Finished headings and transitions compared with the story map: [x]
- Heading-strip, visible-copy, and first-use audits completed: [x]
- Lesson-vision review completed: [x]
- Glossary-coverage review completed: [x]
- Human review completed: [ ] (batch 1 received and implemented; final decision pending)
- Credible findings resolved: [x] (independent reviews and batch 1)
- HTML/PDF rendered and checked: [x] (PDF 47 pages after batch 1, all changed pages inspected)
- Reviewer decision:

### Human review batch 1 (Ondřej Mottl, 2026-10-22)

Classified as lesson-specific feedback unless noted.

1. Block 8: box plots replaced by a violin plot with a narrow box plot and coloured points (`ggplot2`, hidden), with the `ggplot2` code in a collapsed box; colours match the tank figure. General preference noted by the author („I do not like boxplots in general“) — check neighbouring lessons before propagating; not propagated.
2. Before block 13: a bridging paragraph recalls that the crab and knotweed lessons averaged groups without explanation and announces what this lesson shows instead.
3. Block 21: the complete `summary(mod_nadrz_pevne)` is shown, and the text points to the `NA` row and the singularity note.
4. Block 28: a longer introduction explains that `lm()` cannot fit random effects, lists `nlme`, `lme4`, `glmmTMB` and `brms`, justifies `glmmTMB` (same formula syntax as `lm()`/`lme4`, one function for later GLMs, readable output, reliability) and shows that `glmmTMB()` without a random term reproduces `lm()` exactly.
5. Blocks 13-14 and 33: basic model checks added — histogram of residuals and residuals versus fitted values for both `lm()` models and for the mixed model, plus residuals by tank for the all-froglet model (shows the dependence that ordinary residual plots miss); R² of both `lm()` models with the L09 rule that R² is comparable only for the same response and observations; marginal and conditional R² of the mixed model (Nakagawa & Schielzeth 2013, computed from the variance components) added to the comparison section. The comparison section now follows the mixed-model diagnostics.
6. Block 39: the „Závěr“ box reports the variability captured by drying (marginal R²) and by tanks instead of the sentence on independent replicates.

### Human review batch 2 (Ondřej Mottl, 2026-10-22)

1. Block 28: the package table is reframed as complexity, versatility and drawbacks; the error-distribution framing (unknown to students) is removed.
2. R² of the mixed model moved out of the comparison section into five new `##` sections placed between the mixed-model diagnostics and the four-approaches comparison:
   - recall of R² from the total sum of squares and RSS for the all-froglet `lm()`, with hand computation matching `summary()`, and the ANOVA between/within-groups split;
   - R² as a share of variance (variance of fitted values + variance of residuals = variance of lengths);
   - three variance parts of the mixed model, a prediction question, a table, a stacked-bar figure comparing both models, a note on why the three parts sum to slightly more than the observed variance, and a warning box reconciling the 27 % (share of the variability left after drying) with the 17 % (share of the total);
   - marginal and conditional R² in words, then numbers, then symbols, with a collapsed box showing the computation in R;
   - what R² of a mixed model does and does not say: L09 limits, a high conditional R² does not mean the predictor matters, the model describes tank differences but does not explain them, no comparison with the tank-means R².
3. New terms `marginální R²` and `podmíněné R²` are marked with a TODO slug comment for a separate `slovnik` change.

### Human approval of the written materials

- Approver: Ondřej Mottl
- Date: 2026-10-22
- Decision: approved after review batches 1 and 2
- Requested revisions: none outstanding

## Decision

- [x] Written materials are review-ready
- [x] Story-map status is `complete`
- [x] Human story-map approval is `approved` and recorded
- [x] Diff contains only Stages 2-3 sources, records, and corresponding outputs
- [ ] Written-materials PR ready to merge
- Notes:
  - The diff also carries render infrastructure synced from L10 so the skripta renders with glossary definitions and the current semantic boxes (`R/Functions/render_glossary_term.R`, `R/Functions/render_presentation_outputs.R`, `theme/semantic-boxes.lua`, `theme/presentation_components.scss`, `theme/brand_manifest.json`); the other modified theme and R files differ only in line endings.
  - Open before the PR: `renv::snapshot()` for `glmmTMB`, `glossary`, `showtext` and `sysfonts`; the size of the four generated images (PDF about 17 MB).
  - Open after the PR, in `slovnik`: slugs for the new terms marked with TODO comments in `skripta.qmd`.
