# Stages 4-5 - Slide Storyboard, Build, and Human Review

## Metadata

- Week: L11
- Date: 2026-10-22
- Author: Claude Code (Opus 5.5), working with Ondřej Mottl
- Reviewer: Ondřej Mottl

## Git checkpoint

- Stage group: Stages 4-5 presentation
- Branch: `lesson/l11-presentation` (created locally with explicit authorization from Ondřej Mottl, 2026-10-22; not pushed)
- Base branch and commit: `main` at `dd0b922` (squash merge of the Stages 2-3 PR #2)
- Stages 2-3 PR merged: [x] (#2, 2026-10-22)
- Branch created from updated default branch: [x] (`git pull --ff-only` on `main` reported it up to date with `origin/main`)
- `git status --short` reviewed before editing: [x] (clean)
- Presentation PR: not created

## Inspiration consulted

- Relevant sources from `_internal/obecne/nove/biostatistics_course_inspiration_hub.md`: [CUNY Biostatistics, linear model extensions](https://jsgosnell.github.io/cuny_biostats_book/content/chapters/Linear_model_extensions.html) (oysters in tanks; "is n 75 oysters or 3 tanks?") and [Modern Statistics with R, section 8.8](https://www.modernstatisticswithr.com/regression.html). These are the sources recorded in Stage 0 and used for the approved skripta.
- Visual or data-storytelling pattern worth borrowing: one question ("kolik nezávislých odpovědí máme?") asked before any model; the same biological question answered four ways and compared side by side; the tank-by-tank strip plot as the anchor graph that returns whenever a new model treats tanks differently.
- How the pattern is adapted to this course's slide rules: every block opens with a data moment, a vote or a prediction; the term (pseudoreplikace, pevný faktor, náhodný faktor, náhodný intercept) arrives only after the encounter. Model output is shown as short excerpts beside visible code; the full output stays in the skripta.
- Revision 2 web research (2026-10-22, two read-only research subagents, Sonnet; reports summarised here):
  - Adopted: the data built from its components, layer by layer (DeBruine & Barr simulation appendix, <https://debruine.github.io/lmem_sim/>; Winter 2013, <https://arxiv.org/abs/1308.5499>, "the random effect gives structure to the error term"); the treatment mean / own mean / model estimate per group, after Bayes Rules! ch. 15–17 (<https://www.bayesrulesbook.com/chapter-15>) and McElreath's reedfrog tanks (<https://bookdown.org/content/1850/multilevel-models.html>); arrows from raw group means to model estimates, ordered by group size (Tristan Mahr, <https://www.tjmahr.com/plotting-partial-pooling-in-mixed-effects-models/>); group means added to the within/between-slope figure (Friendly et al., <https://arxiv.org/abs/1302.4881>); the effective number of independent observations from the design effect (Lai, <https://bookdown.org/marklhc/notes_bookdown/hierarchical-multilevel-models.html>; Lazic et al. 2018, <https://www.biorxiv.org/content/10.1101/183962>), drawn as our own curve because no source plots it.
  - Rejected by the author after the mock-up: the bell curve of tank shifts and the simulation of different tank shares.
  - Rejected as out of scope: null-world false-alarm simulations (Stage 0 decision 6), shrinkage-weight formulas, prediction intervals for a new tank, random slopes in the core, intercept–slope correlations, likelihood-ratio or AIC selection of random structures.
- What from the source is intentionally not being reused: matrix notation, Type III tests and df approximations, DHARMa and `performance` diagnostics, nested and crossed random effects, AICc comparison of random structures, simulated null worlds (Stage 0 decision 6).

## Presentation vision

One question carries the deck: **Vylézají z tůní, které vyschly, menší žabky?** Students commit to a biological prediction on slide 2 and see the answer to its first half on slide 12. The second half, *how sure can we be?*, is the real subject. Part A meets the experiment and shows that froglets of one tank resemble each other. Part B asks how many independent answers the experiment gives, compares a model that counts every froglet with a model that counts every tank, names pseudoreplication, and fulfils the L05 promise about crab marsh means. Part C tries the familiar remedy, the tank as a categorical predictor, and finds that it fails for drying but works for a predictor that varies within tanks (day of metamorphosis). Part D introduces the random intercept as each tank's own baseline drawn from a common distribution, fits it with `glmmTMB()`, and reads the fixed effect, the two standard deviations, the shifted baselines, the diagnostics and the marginal and conditional R². Part E decides between fixed and random factors from the question and shows a design that no model can rescue. The close answers the opening question with its limitations, gives the seven design questions and opens the next lesson with survival instead of length.

The slides distil the approved 51-block skripta (plus its five R² sections) and introduce no core concept that the skripta lacks. Deliberately left to the skripta:

- the data-acquisition box (Zenodo download, SHA-256);
- the histogram and residual plot of the all-froglet model and the residual plot of the tank-means model (the deck shows the residuals-by-tank contrast instead);
- the reversed predictor order with −1,98 mm (speaker note only);
- the `requireNamespace()` preflight, the package comparison table and the check that `glmmTMB()` without a random term reproduces `lm()` (one speaker-note sentence);
- the R² recap from sums of squares and the R² as a share of variance (the deck goes straight to the three variance parts);
- the warning box reconciling the 27 % and 17 % shares (speaker note only);
- the dry-mass box and the random-slope Extra;
- the five "Vaše vlastní studie" boxes and the one-page template (one transfer slide and the checklist represent the thread; the speaker note points students to the skripta boxes).

## Mandatory story map

- Artifact: Presentation (`Presentation/presentation.qmd`)
- Granularity: one row per slide, including section dividers and PollsLive slides
- Story-map status: complete
- Heading-strip audit completed: [x]
- Knowledge-state audit completed: [x]
- Human story-map approval: approved
- Approved by: Ondřej Mottl
- Approval date: 2026-10-22
- Approval decision and requested revisions: Ondřej Mottl approved revision 2 of the story map and the knowledge-state ledger on 2026-10-22 („I approve the story map“), after requesting revision 1 (study-design thread, pictures, colours, easier Q1) and choosing the five random-intercept visuals of revision 2 from a mock-up. This approval did not cover the PollsLive block, the illustration plan or the cuts; those were decided separately the same day (below).
- Separate decisions (Ondřej Mottl, 2026-10-22): **PollsLive** integration map and the three exact questions approved as written (key C–B–A). **Illustration plan** (T, G1–G6) approved as written. **Cuts:** none; the deck keeps all 66 slides, and the five cut candidates are marked as optional in their speaker notes so they can be skipped live.

Revision 1 (2026-10-22), requested by Ondřej Mottl after reading the first map: (1) reuse the skripta pictures and add more where useful; (2) give students a study-design thread in the deck; (3) show the treatment colours side by side before deciding; (4) Q1 needs no mental arithmetic. Applied: the five „Vaše vlastní studie“ steps now close Parts A–E (rows 13a, 27, 35a, 49a, 53a) with one new recurring illustration (G6); slide 40 is folded into 39 as a fragment; Q1 asks for the calculation, not its result. After a side-by-side comparison figure (`l11_barvy_uprav_srovnani.png`, scratchpad, with a deuteranopia simulation), the author chose the `_brand` steel blue and terracotta for the treatments and asked for the same change in the skripta. That change was made on this branch (`barvy_vyschnuti` and four alt texts in `Learning_materials/skripta.qmd`), and the skripta outputs were re-rendered. Lettered rows keep the original slide numbers stable for discussion.

Revision 2 (2026-10-22): two rounds of web research on teaching the random intercept (record below, *Inspiration consulted*) produced seven candidate visuals, mocked up from the froglet data (`Temp/mock_slides/ukazky.qmd`, git-ignored). Ondřej Mottl rejected the bell curve of tank shifts and the simulation of different tank shares and accepted the other five: the data built in three layers (slides 38, 38a, 38b, replacing the old dot plot on 38), the effective number of independent froglets (44a), the small, middle and large tank (44b), arrows by tank size on 45, and tank means on the day-of-metamorphosis figure (34). Each needs a matching skripta addition (see *Skripta additions required by revision 2*).

`Internal role` and `Speaker note` are backstage. `Student-facing heading` is the exact proposed visible title; headings with numbers will compute them inline. No full slide copy has been drafted. Numbers in speaker notes come from the Stage 2 numerical check (`Workflow/records/2026-10-21-stage-2-learning-materials.md`) and from a 2026-10-22 rerun of the L10 island and mammal values; on the slides every value will be computed from the data or model objects.

| Order | Internal role | Student-facing heading | Speaker note |
|---|---|---|---|
| 1 | Question-first title (title image T) | Vylézají z tůní, které vyschly, menší žabky? | `.course-title .course-title-illustrated` arrival screen: L11, formal title „Hierarchická data a náhodné efekty“, course link, portrait title image slot `zabky_titulni.png`. |
| 2 | Visual hook plus personal prediction (G1) | Jak velké žabky vylezou z tůně, která vyschla? | G1 (= skripta S1, drying pool) left. Right: two sentences of context (pools dry out in droughts and refill after rain; size at the end of metamorphosis matters for survival on land) and three equal vote cards: menší · stejně velké · větší. Show of hands; ask students to remember their choice. The data answer the first half on slide 12; "how sure?" returns on slide 56. |
| 3 | PollsLive collection | Co si pamatujete z minulé lekce? | Generated by the PollsLive include: QR/link plus three self-paced L10 retrieval questions. |
| 4 | Retrieval Q1 (generated) | Desetkrát větší ostrov má podle modelu Mocninný vztah asi 2,45krát víc druhů. Kterým výpočtem zjistíte, kolikrát víc druhů má ostrov stokrát větší? | Exact text under *PollsLive retrieval proposal*. |
| 5 | Retrieval Q2 (generated) | Krabicový graf hmotností v kilogramech označil 11 z 83 druhů savců jako možná odlehlé. Kolik druhů označí krabicový graf stejných hmotností převedených na z-skóre? | As above. |
| 6 | Retrieval Q3 (generated) | Co z těchto grafů residuí poznat nemůžeme? | Spoken bridge: L10 ended with "Jsou ostrovy jednoho souostroví nezávislá pozorování?" Residual plots cannot answer that; the froglets show how to find out. |
| 7 | Learning outcomes | Výsledky učení | Five incremental bullets matching the skripta outcomes. Terms (hierarchie, pseudoreplikace, pevný a náhodný faktor, náhodný intercept) appear only as destinations, with restrained highlights. |
| 8 | Section divider | Žabky z pokusných nádrží | Minimal H1. |
| 9 | Source and design (G2) | Pokus se `r pocet_nadrzi` nádržemi | G2 (= skripta S2, outdoor tanks) left. Right, four short lines: Ward et al. (2023), Kansas 2021; 64 cattle tanks of 1 000 l; half dried out and were refilled before the experiment; 50 tadpoles of *Lithobates blairi* per tank; froglets only from the 16 fish-free tanks, each measured when it left the water. Footer: data Dryad, CC0. |
| 10 | Design schematic, noticing task | Které nádrže vyschly a kolik žabek z nich vylezlo? | The 8 + 8 schematic from the skripta (tank number inside, froglet count below). Prompt: was drying decided for a froglet or for a tank? Fragment 1: always for the whole tank. Fragment 2: 295 froglets from dried and 190 from non-dried tanks, although every tank received 50 tadpoles (inline; planted for the limitation on slide 56). |
| 11 | Data inspection habit | Jeden řádek tabulky představuje jednu žabku | Code left (`read.csv()`, `factor()` with the non-dried tanks as reference group, `str()`, `colSums(is.na())`), output right. Quick question: which column says which tank a froglet came from? Fragment card (inline): 485 rows, 0 missing values, body length 19–35 mm in whole millimetres. |
| 12 | First data moment, answers slide 2 | Jak velké jsou žabky z vyschlých a nevyschlých nádrží? | Violin plot with narrow box plot and jittered froglets in the treatment colours (skripta figure, presentation canvas). Pair: how large is the difference, do the groups overlap? Fragment: group means (inline) and "compare with your choice on slide 2". It looks like a clear result. |
| 13 | Same data, new layer; think–pair–share (anchor graph) | Stejné žabky rozdělené podle nádrží | Tank strip plot ordered by tank mean, with mean ticks. 30 s think, then pairs: what do froglets of one tank have in common? Do tanks with the same treatment differ? Fragment: tank-mean ranges (inline; non-dried 26,3–30,6 mm, dried 23,0–26,7 mm); each tank shared its water, algae and tadpole density. |
| 13a | Design thread, step 1 of 5 (G5) | Vaše vlastní studie: otázka a měření | Recurring thread layout (`.panel-olive` kicker „Vaše vlastní studie · krok 1 z 5“). 1 min individually, then tell a neighbour: organism, measured quantity with unit, what you compare, where you would sample. Fragment: the reference example with G5 (= skripta S4): dragonfly larvae, body length in mm, woodland versus field pools, several pools in several regions; labelled as a hypothetical planning example without data. Speaker note: the skripta boxes and the one-page template support the same thread at home. |
| 14 | Section divider | Kolik nezávislých odpovědí máme? | Minimal H1. |
| 15 | Hierarchy named from the design | Žabky v nádržích, nádrže v pokusu | Diagram froglet → tank → treatment (skripta figure). Name „hierarchická data“. Fragment: three everyday hierarchies (opakovaná měření jednoho jedince, organismy z jedné lokality, plochy v jednom bloku); observations of one group resemble each other. |
| 16 | Prediction vote, partner convince | Na které úrovni se rozhodovalo o vyschnutí? | Small schematic repeated. Question: „Kolik nezávislých odpovědí na otázku o vyschnutí dává tento pokus?“ Four equal cards: 485 · 295 · 16 · 2 (inline; 295 misreads the dried froglets, 2 counts the treatments). Partner convince, then `.rn-circle-orange` on 16. |
| 17 | Concept naming, contrasted panels | Žabka je jednotka pozorování, nádrž jednotka nezávislé replikace | Two panels: jednotka pozorování (what one row describes; žabka; 485) versus jednotka nezávislé replikace (the smallest unit that received the treatment independently; nádrž; 16). Why it matters: a tank that happened to have worse water can be balanced only by more tanks, not by more froglets from it. One line: the crab lesson met the same situation (answered on slide 26). |
| 18 | Familiar model on all rows | Model, který počítá každou žabku zvlášť | Visible `lm(delka_tela_mm ~ vyschnuti)` left; output excerpt right (coefficient rows, `confint()`, residual df). Inline: −3,51 mm, SE 0,199, df 483, p far below 0,001. „Vypadá to velmi jistě.“ |
| 19 | Residual check, pair, reveal by tank (anchor graph returns) | Vypadají residua tohoto modelu v pořádku? | Left: residuals versus fitted values (two columns, nothing alarming). Pair: is anything wrong? Fragment right: the same residuals by tank, in the tank order of slide 13; the number of tanks whose mean residual lies more than 1 mm from zero (inline). Takeaway: residuals of one tank move together, so they are not independent. Callback L03: a residual plot alone cannot see groups. |
| 20 | Familiar model on unit means | Model, který počítá každou nádrž jednou | Visible `aggregate()` and `lm()` on the tank means left; output excerpt right. Inline: −3,76 mm, SE 0,617, df 14. Callback: the crab marshes were handled the same way. The residual plot of this model is fine (skripta). |
| 21 | Prediction vote, partner convince | Který model dá širší interval spolehlivosti? | Two equal model cards: „každá žabka zvlášť (485 řádků)“ and „každá nádrž jednou (16 řádků)“, same question, no results. Vote: všechny žabky · průměry nádrží · oba stejně široký. |
| 22 | Evidence reveal and interpretation | Stejný rozdíl, `r format_cz(pomer_se, 0)`krát větší nejistota | Comparison table (estimate, SE, 95% CI, df) and the purple interval plot. Fragment: the estimate barely moved; SE ×3,1 (inline); df 483 → 14; the difference stays clear in the honest model, we only know its size less precisely. |
| 23 | Explanation and naming | Proč `r pocet_nadrzi` nádrží nevydá za `r pocet_zabek` žabek | Froglets of one tank share water, food and density, so a second froglet from the same tank says little new about drying. The all-froglet model "sees" far more independent information: too small SE, too narrow interval, too many df, too small p. Name „pseudoreplikace“. L05: a too small SE makes a false alarm (chyba I. typu) more likely than α. `.box-rule`: the level at which the predictor varies decides the number of independent answers. |
| 24 | Misconception MCQ (blank heading) | *(prázdný nadpis)* | Blank-heading MCQ box: „Pokus zopakujete a chcete rozdíl odhadnout přesněji. Co pomůže nejvíc?“ A: dvakrát víc žabek v každé ze 16 nádrží; B: dvakrát víc nádrží se stejným počtem žabek; C: měřit žabky na desetiny milimetru; D: A i B pomohou stejně. Partner convince, then circle B. The reasons for every option arrive on slide 25. |
| 25 | Interpretation with metaphor (G3) | Víc žabek zpřesní nádrž, víc nádrží zpřesní odpověď | G3 (new: one tank measured endlessly versus many unvisited tanks) left. Right: why A, C and D fall short and B works, one line each. `.takeaway-strip`: velký počet řádků neznamená velký počet nezávislých opakování. |
| 26 | Callback that fulfils the L05 promise | Proč jsme u krabů a křídlatky pracovali s průměry | Question first: why did the crab lesson model 13 marsh means instead of 392 crabs? Fragment: latitude varies only between marshes, so 13 answers; SE of the slope 0,034 for all crabs versus 0,080 for marsh means (inline, ratio inline). One line: knotweed leaves were averaged per population for the same reason. |
| 27 | Design thread, step 2 of 5 (G6) | Vaše vlastní studie: kolik nezávislých odpovědí? | Thread layout with G6 (new recurring planning illustration) small at the top right. Own study first: at which level does your predictor vary, what is your unit of independent replication, how many units versus measurements per unit could you manage? Fragment, reference example: two designs with the same 240 larvae, 24 pools × 10 larvae versus 4 pools × 60 larvae (inline from the skripta design inputs); pairs say how many independent answers each gives to „les, nebo pole?“; reveal 24 versus 4 (2 woodland and 2 field pools). |
| 28 | Spine return (mid-lecture) | Co už o žabkách víme? | `.box-question` repeats the title question. Left `.panel-result`: froglets from dried tanks are shorter by about 3,8 mm (tank means, inline); 16 independent answers; honest SE about 0,6 mm. Right `.panel-question`: tank means count a tank with 11 and with 47 froglets equally, lose the differences within tanks and cannot use predictors measured on single froglets. Can one model keep every froglet and still count tanks? |
| 29 | Section divider | Nádrž jako další prediktor? | Minimal H1. |
| 30 | Prediction vote with visible code | Co model vypíše pro vyschnutí, když přidáme nádrž? | Visible `lm(delka_tela_mm ~ factor(nadrz) + vyschnuti)`. Equal cards: podobný rozdíl s menší SE · podobný rozdíl s větší SE · rozdíl blízký nule · žádný odhad. Show of hands. |
| 31 | Evidence reveal | Pro vyschnutí zbylo jen `NA` | Output excerpt: the last coefficient rows with `vyschnutivyschla NA` and „(1 not defined because of singularities)“, marked with one `.rn-box-orange`. Speaker note: in the reversed order R reports −1,98 mm, which is only tank 2 minus tank 54 (skripta box). |
| 32 | Explanation and naming, rule | Vyschnutí a nádrž nesou stejnou informaci | The schematic of slide 10 with each tank inside its treatment row. With its own coefficient for every tank, drying is already contained in the tank coefficients; nothing is left to estimate it from. Name „pevný faktor“ (each level its own coefficient; the particular levels interest us). `.box-rule`: a predictor that varies only between groups cannot sit beside the group as a fixed factor. |
| 33 | Prediction vote (within-tank predictor) | Souvisí den metamorfózy s délkou žabky? | Prompt: a tadpole that stays longer in the water has more time to grow; froglets of one tank left the water between day 41 and 82 (inline). Two questions: what do you expect within a tank, and what will a model that ignores tanks show? Cards: rostoucí · žádný · klesající vztah. |
| 34 | Evidence reveal, two panels | Uvnitř nádrží jsou pozdější žabky větší | Two-panel figure: one purple line for all froglets versus parallel lines within tanks in the treatment colours. Fragment (revision 2): each tank's mean day and mean length as a large open circle in its treatment colour, so the "later tank = smaller froglets" pattern between tanks is visible next to the rising lines within tanks. Inline: −0,007 mm per day (p 0,69) versus +0,23 mm per day (SE 0,012), about 2,3 mm per ten days. |
| 35 | Interpretation and generalisation, contrasted panels | Proč se vztah ukázal až uvnitř nádrží | Points back to the open circles of slide 34: dried tanks released froglets later on average (inline) and smaller, so differences between tanks hide the pattern within tanks. Contrasted panels: „prediktor se mění jen mezi skupinami → pevný faktor nepomůže (vyschnutí)“ versus „prediktor se mění uvnitř skupin → pevný faktor pomůže (den; bloky; opakovaná měření)“. Name „blok“. Bridge line: for drying we still need a model that keeps every froglet but counts tanks. |
| 35a | Design thread, step 3 of 5 (G6) | Vaše vlastní studie: co se mění uvnitř jednotek? | Thread layout with G6. Own study: what varies within your units (date, position, size class, observer), and could units be grouped into blocks with similar conditions? Fragment, reference: size and stage of larvae and sampling date vary within a pool; choosing woodland and field pools in the same 6 regions (inline) makes the region a block. |
| 36 | Section divider | Každá nádrž má vlastní výchozí úroveň | Minimal H1; "výchozí úroveň" is plain language, explained on slides 37–39. |
| 37 | Groups as a sample (G4) | Zajímá nás nádrž 27 sama o sobě? | G4 (= skripta S3, tanks standing for pools in a landscape) left. Right: a repeated experiment would use other tanks with other water and algae; we care how much pools typically differ, not whether tank 27 beats tank 54. Quick question: is the tank like drying (levels we care about) or like a sample? |
| 38 | Data built in layers, step 1 (revision 2) | Z čeho se skládají délky žabek? | One mm axis, tanks on the x axis grouped by treatment and ordered by mean. Only the two treatment means as horizontal segments in the treatment colours. Prompt: if every froglet were exactly the treatment mean, what would the data look like? |
| 38a | Data built in layers, step 2 (repeated heading) | Z čeho se skládají délky žabek? | Same frame, plus orange arrows from the treatment mean to each tank mean (graphite tick). Each tank sits a bit higher or lower; the shifts scatter on both sides, roughly like the normal reference shape of L10. Name „náhodný faktor“ (tanks as a sample of possible pools) and „náhodné efekty“ (the shifts). |
| 38b | Data built in layers, step 3 (repeated heading) | Z čeho se skládají délky žabek? | Same frame, plus the grey froglets around their tank means. One sentence: délka žabky = průměr úpravy + posun nádrže + odchylka žabky; a plain `lm()` lumps the last two into one residual, the new model keeps them apart (Winter's "structure in the error term"). Leads directly into the equation on 39. |
| 39 | Text-only equation → one froglet's numbers → symbols and naming | Z čeho se skládá délka jedné žabky | Text-only equation: odhadnutá délka žabky = intercept + rozdíl po vyschnutí × vyschla + odchylka nádrže. Fragment 1: value table and substitution for froglet 1 of tank 45, then its residual (all inline from the hidden mixed-model fit on this slide). Fragment 2 (formerly slide 40): $y_{ij} = \beta_0 + \beta_1 x_j + u_j + e_{ij}$, every symbol in words; $u_j$ comes from a normal distribution with mean 0 and an estimated SD. Name „náhodný intercept“ and „smíšený model“. If the slide gets crowded in the render, it is split again into two slides with the same heading. |
| 41 | Software step | Model s náhodným interceptem v R | One line on why `glmmTMB()`: `lm()` cannot estimate random effects; the formula is written as in `lm()` and `lme4`; the same function later handles yes/no answers and counts. Visible call with `REML = TRUE`; `(1 \| nadrz)` read aloud as „intercept se liší podle nádrže“. Speaker note: the REML sentence of the skripta; `glmmTMB()` without the random term reproduces `lm()`; install once with `install.packages("glmmTMB")`. |
| 42 | Prediction vote | Bude standardní chyba blíž modelu žabek, nebo modelu nádrží? | Two reference cards with the SEs (0,199 all froglets; 0,617 tank means; inline). Vote: kolem 0,2 · mezi nimi · kolem 0,6 · víc než 0,6. |
| 43 | Evidence reveal (fixed effect) | Jak velký je rozdíl a jak přesně ho známe | Output excerpt of `Conditional model` plus `confint(parm = "beta_")`. Inline: −3,73 mm, SE 0,604, 95% CI −4,91 to −2,54. `.box-result`: the SE matches the tank-means model although every froglet stays in the model, so the model "recognised" that drying varies between 16 tanks. Small note: `z value` instead of `t value`, slightly optimistic with 16 tanks; it does not change the conclusion. |
| 44 | Variance components, vote then reveal | Liší se víc nádrže, nebo žabky v jedné nádrži? | `Random effects` excerpt with its two rows. Question first (show of hands). Fragment: tank SD 1,15 mm, residual SD 1,90 mm (inline), each read in millimetres; then about 27 % of the variability left after drying lies between tanks (text-only share and numbers, compressed). |
| 44a | Effective sample size (revision 2) | Kolik nezávislé informace je v 16 nádržích? | Prediction first: if we measured 100 froglets in every tank, how many independent froglets would that be worth? Fragment: purple curve of the estimated number of independent froglets against froglets per tank (16 tanks, the between-tank share from slide 44), levelling off at about 60 (dashed graphite "strop"); orange point at our experiment (about 30 froglets per tank → about 55 independent froglets, not 485; inline). Takeaway: the uncertainty therefore came out about 3× larger than in the all-froglet model, matching the SE ratio of slide 22 (inline). Closes the MCQ of slide 24 with a number. No formula on the slide; the computation is in a collapsed skripta box. |
| 44b | Prediction then reveal: three tanks (revision 2) | Malá, střední a velká nádrž: čemu model věří? | Three panels: the smallest (11 froglets), a middle (19, the largest of the small-tank cluster, because tank sizes form two clusters 11–19 and 38–47) and the largest tank (47), grey froglets, the treatment mean (graphite dashed) and the tank's own mean (orange). Pair prediction: where will the model put each tank's baseline? Fragment: the purple model baseline, between the two lines, visibly pulled from the tank mean towards the treatment mean for the small tank and almost on the tank mean for the large tank. |
| 45 | Partial-pooling overview, pair (anchor graph returns) | Kde leží odhadnuté výchozí úrovně nádrží? | All 16 tanks ordered by froglet count (documented exception to the slide-13 order, because tank size is the point): hollow tank means, purple model baselines, orange arrows between them, dashed treatment lines. Pair: which tanks moved most, and why? Fragment: tank 45 with 11 froglets moved 0,47 mm, tanks with 40 or more froglets at most 0,13 mm (inline); with 11–47 froglets per tank the pull is small, and a small tank "borrows" information from the others. |
| 46 | Diagnostics in known terms, pair | Co prozradí residua a výchozí úrovně nádrží? | Three panels: residual histogram, residual Q–Q plot, Q–Q plot of the 16 tank deviations. Pair, with L10 vocabulary: which shape do you see? Fragment: mild right skew from a few large froglets; tank deviations near the line, but only 16; the drying conclusion does not hinge on it (the tank-means model agrees). |
| 47 | Prediction, stacked-bar reveal | Kolik variability zachytí vyschnutí a kolik nádrže? | Three equal cards first: vyschnutí · rozdíly mezi nádržemi · rozdíly mezi žabkami v nádrži; which part is largest? Fragment: the stacked-bar figure comparing the all-froglet model with the mixed model (purple drying, orange tanks, grey froglets). Takeaway: the mixed model took nothing away from drying; it split the residuals into two parts. Speaker note: why the 27 % of slide 44 and the share here differ (different denominator). |
| 48 | Naming and caveat | Marginální a podmíněné R² | Two cards in words and numbers (inline): marginální R² (drying only) and podmíněné R² (drying plus tanks). `.box-warning`: a high conditional R² does not mean that drying matters; the model describes differences between tanks but does not explain them. One line: R² is comparable only for the same response and observations (L09). |
| 49 | Synthesis table | Čtyři způsoby, jak odpovědět na stejnou otázku | Table of the four approaches in their stable order: units, estimate, SE (inline; fixed factor „nelze“). Fragment: when the simpler route suffices (predictor varies only between groups, similar group sizes, no predictor within groups: group means give practically the same answer). |
| 49a | Design thread, step 4 of 5 (G6) | Vaše vlastní studie: zápis modelu | Thread layout with G6. Own study: write the formula in the form `odezva ~ prediktor + (1 \| jednotka)` and say what one row of your table will be. Fragment, reference: one row is one larva; `delka_larvy_mm ~ okoli + (1 \| tun)`, `okoli` with levels `les` and `pole`. |
| 50 | Section divider | Pevný, nebo náhodný faktor? | Minimal H1. |
| 51 | Decision rule card | Zajímají nás konkrétní úrovně, nebo celý soubor možných úrovní? | `.box-rule` with the four skripta questions (konkrétní úrovně? opakovaly by se v novém pokusu? je úrovní dost, zhruba pět a víc? na které úrovni se mění prediktor?). Fragment: applied to the froglets, drying is fixed and the tank random (16 levels). |
| 52 | Small-group transfer | Pevný, nebo náhodný? Šest situací z biologie | Six scenario cards in a 3 × 2 grid (grass species, river sites, field blocks, bats weighed repeatedly, sex, three lakes). Groups of 3–4, 2 minutes. Fragment badges per card (pevný / náhodný / opatrně). Reasons from the skripta solution in the speaker note. |
| 53 | Design limit, warning | Když nepomůže ani model: jedno ošetřené povodí | Hubbard Brook: one calcium-treated and one reference watershed, hundreds of maple seedlings. Quick question: how many independent answers about calcium? Fragment: one treated unit and one control. `.box-warning`: chybu v návrhu analýza neopraví. Speaker note: Mack Creek (clear-cut versus old growth, one section each). |
| 53a | Design thread, step 5 of 5 (G6) | Vaše vlastní studie: pevný, nebo náhodný faktor? | Thread layout with G6. Own study: which grouping variables are fixed and which random, and does every level of your predictor have several independent units, not one? Fragment, reference: surroundings fixed; pool random, and region too if pools were chosen in regions; several woodland and field pools in each region, otherwise the design falls into the one-watershed trap of slide 53. |
| 54 | Section divider | Závěr | Minimal H1. |
| 55 | Silent write, then pair | Napište závěr o žabkách dvěma větami | Evidence card (inline): mixed-model difference with 95% CI, 16 tanks, marginal R². Sentence stems: „Žabky z vyschlých nádrží byly … (95% interval …), odpověď stojí na … nezávislých nádržích.“ and „Hlavním omezením je …“. 40 s, then compare with a neighbour. |
| 56 | Spine answer | Vylézají z vyschlých nádrží menší žabky? | `.box-result` (inline): about 3,7 mm shorter (95% CI about 2,5–4,9 mm) from 16 tanks; drying captures about X % and tanks about Y % of the variability. Limitations: drying and tadpole density overlap (295 versus 190 froglets, slide 10); only 16 tanks; tanks are not wild pools. Callback to slide 2. |
| 57 | Design checklist, closes the thread (G6) | Sedm otázek před prvním měřením | `.box-rule` with the seven skripta questions in compact form, each tagged with the thread step that earned it; G6 small. One line: a control differs only by the treatment, and treatments are allocated by lot. Closing line: the five answers from the thread give a one-page design (template in the skripta), useful for a semester project or a first meeting with a supervisor. |
| 58 | Key-ideas summary | Co si odnést | Five one-line takeaways from the skripta summary, with semantic highlights. |
| 59 | Closing question and next-lesson bridge | Co když nás nezajímá délka, ale přežití pulců? | Prompt: for every tadpole we record whether it survived to metamorphosis (ano/ne). Pairs: what is one row now, what is the unit of independent replication, would `(1 \| nadrz)` still belong in the model? Answer: tadpole, tank, yes; the hierarchy comes from how the data were collected. What changes is the type of response, which the next lesson takes up. |

### Revision 3 (approved 2026-10-23)

Approval: Ondřej Mottl approved revision 3 as written on 2026-10-23. Open decision 1: (a), cause plus robustness; adding the day of metamorphosis stays in the speaker notes. Open decision 2: the skripta also mirrors the new effective-information narrative (49) and the slide 52 message, besides the tank labels and the independence callback.

Requested by Ondřej Mottl after reviewing the rendered deck (author review batch 3). Slide numbers below are the rendered numbers (1–67), not the order labels of the table above.

#### Structure

- The design thread leaves the froglet story. Slides 14, 28, 37, 56 and 61 („Vaše vlastní studie“ steps 1–5) are removed from their places. A new final section follows the froglet conclusion (after slide 64): H1 „Paralelní studie: larvy vážek v lesních a polních tůních“, then five slides, one per step. Each slide asks the class a planning question about the suggested dragonfly study (question → pairs → reveal of the worked answer), using the G5/G6 images. The block ends with the seven-question checklist (slide 65). Students' own study appears only as a pointer to the skripta template on the checklist slide.
- New slide after slide 20 (residuals by tank): „Lineární model potřebuje nezávislá pozorování“. Callback to the four checks of L03 (shape of the relationship, constant spread, shape of the residuals – the normality checked in L10 – and independence). The all-froglet model breaks the fourth: R fits it, but its SE, interval and p-value are wrong. Slide 19 gets one line: „R model spočítá, i když jeho předpoklady neplatí.“
- Totals: 67 − 5 + 1 + 1 (H1) + 5 = 69 slides.

#### Data and quiz

- Tank labels become `N2`, `N4`, … in the dataset itself (`R/prepare_frog_data.R` → `data/zabky_nadrze.csv`), so the deck, the skripta and later exercises share them; all text mentions („nádrž 27“) and figure orders are updated.
- PollsLive Q2: the evidence becomes the L10 box plot of mammal body mass in kilograms (as in the L10 skripta), not the histogram. Q3 stem: „Grafy residuí modelu Mocninný vztah neukazují žádný zřetelný problém. Co z nich přesto poznat nemůžeme?“ Options, answers and key unchanged.

#### Slide changes

- 10: tank labels N…
- 12: group means as large points.
- 33 „Vyschnutí a nádrž nesou stejnou informaci“: new figure. One row per tank, 16 tank-coefficient columns plus the `vyschla` column; the `vyschla` column is exactly the sum of the eight dried-tank columns (orange outline), so the model has nothing left to estimate drying from.
- 39: reworded heading „Zajímá nás konkrétní nádrž, nebo nádrže obecně?“ and shorter text.
- 42 (third layer): grey segments from each froglet to its tank mean (the residuals).
- 43–44: the formula says „přepínač ‚vyschla?‘“; the caption about the model is replaced by the values themselves (intercept, difference, deviation of the example tank), then substituted into the formula.
- 45: a figure of the fitted model (tank baselines and treatment lines) after the call; „v příští lekci zvládne i odezvy typu ano/ne a počty“ → „a je dostatečně flexibilní i pro složitější modely“.
- 48: the share is built visually (a bar of tank variance plus froglet variance, orange part = share) before any number; the formula goes to the speaker notes.
- 49: new narrative: designing the experiment with either many single-froglet small tanks or more froglets in fewer large tanks; the curve shows how many single-froglet tanks our 16 tanks are worth (about 55, ceiling about 60).
- 50: layout fixed so no text is pushed below the figure.
- 51: tanks ordered by mean froglet length, dashed treatment lines in the treatment colours, froglet counts labelled.
- 52: the model now handles the non-independence; then ask which assumption is left (shape of the residuals) and whether it holds: no, a long right tail (skewness 1,8) made by late, large froglets. See open decision 1.
- 54 R²: the stacked bars of slide 53 repeated with brackets; marginal R² = purple part, conditional R² = purple + orange.

#### Skripta

- Tank labels via the dataset.
- Independence callback (four checks of L03, normality from L10) where the all-froglet model is fitted, stating that the model is wrong for this question.

#### Open decisions

1. Slide 52, after "the residuals are not normal": (a) explain the cause (late, large froglets) and that the conclusion stands because the tank-means model gives the same answer; or (b) also show that adding the day of metamorphosis removes the tail (skewness 0,4), but changes the drying estimate to −5,5 mm because drying delays metamorphosis (a mediator).
2. Should the skripta also mirror the new effective-information narrative (49) and the slide 52 message, or only the tank labels and the independence callback?

Planned totals (revision 2): 66 visible slides (revision 1's 62, plus two more layer steps 38a–38b, plus 44a and 44b), including 6 H1 dividers (8, 14, 29, 36, 50, 54), 4 PollsLive-generated slides (3–6), 1 blank-heading MCQ (24), 5 design-thread slides (13a, 27, 35a, 49a, 53a) plus the checklist (57), 6 in-deck illustrations (G1 on 2, G2 on 9, G5 on 13a, G3 on 25, G4 on 37, G6 recurring on 27, 35a, 49a, 53a and 57) and the title image (1).

## Knowledge-state ledger

| Concept block | May assume before | Introduced or earned here | Must not assume yet | Evidence or experience |
|---|---|---|---|---|
| 1 — Hook, retrieval, outcomes (1–7) | L10: logarithm turns multiples into equal steps; z-score changes only location and scale; residual plots and Q–Q plots; L10 closing question on islands; L03: residual plots cannot detect groups. | Lesson question; a personal biological prediction; retrieved L10 ideas (multiplicative reading of the exponent, scale versus shape, what residual plots cannot show). | Any hierarchy vocabulary, the froglet data, any mixed-model idea. | G1, show of hands, three L10 evidence-reading questions. |
| 2 — Experiment and data (8–13) | Observations, variables, `NA`, `str()`, `table()`, reference group (L00–L10); graphs of a numeric variable by group (L01, L06); violin plot (skripta). | Source and design (drying per tank); the unit of observation (froglet); counts per tank; a clear difference between treatments; froglets of one tank resemble each other, tanks differ within a treatment. | Unit of replication; the word hierarchie; uncertainty of the difference. | G2, schematic, visible inspection code, violin plot, tank strip plot. |
| 3 — Independence and pseudoreplication (14–28) | Block 2; SE shrinks with the number of independent observations (L04); SE, CI, df, p, type I error (L04–L05); `lm(y ~ skupina)` (L06); `aggregate()`/group means (L05, L07); residual plots (L03). | hierarchická data; jednotka nezávislé replikace beside jednotka pozorování; naïve and tank-means models; residuals move together within tanks; same estimate, about three times the SE; pseudoreplikace and its consequences in words; more froglets ≠ more tanks; why crabs and knotweed were averaged; transfer to a planned design; what tank means lose. | Fixed versus random factors; mixed models. | Diagram, vote, contrasted panels, two code-and-output pairs, residuals by tank, comparison table and interval plot, MCQ, G3, crab SEs, G5 transfer, spine card. |
| 4 — Tank as a fixed factor (29–35) | Multiple predictors and categorical predictors (L06–L07); confounding (L07); block 3. | `NA` for drying when the tank is a factor; pevný faktor named; a between-group predictor cannot sit beside the group as a fixed factor; a within-group predictor can, and the pattern can hide between groups; blok named. | Random factors and random intercepts. | Visible code and vote, output excerpt, schematic, two-panel figure, contrasted panels. |
| 5 — Random intercept (36–49) | Population and sample (L04); normal reference shape (L10); model notation $y_i$, $\beta_j$, $e_i$ (L03–L08); `pkg::fn()` calls; SD (L01); R² and its comparability rule (L03, L09); histogram and Q–Q reading (L10). | Tanks as a sample; the data built from treatment mean, tank shift and froglet deviation; náhodný faktor and náhodné efekty; the three-part decomposition in words, numbers and symbols; the effective number of independent froglets and its ceiling with 16 tanks; small tanks pulled towards the treatment mean more than large ones; náhodný intercept and smíšený model; `glmmTMB()` and `(1 \| nadrz)`; the fixed effect and its interval (SE like the tank-means model); z instead of t; two SDs and the share between tanks; shifted baselines of small tanks; diagnostics of a mixed model; three variance parts; marginal and conditional R²; when the simpler route suffices. | Random slopes (skripta Extra only); likelihood-ratio tests; specialised mixed-model diagnostics; the ICC term; the design-effect formula on a slide. | G4, three-layer build, equations with one froglet, effective-sample curve, three-tank panels, visible code, two votes, output excerpts, partial-pooling figure, three diagnostic panels, stacked bar, synthesis table. |
| 6 — Fixed or random (50–53) | Blocks 4–5. | Four decision questions; classification in new biological designs; one treated unit per treatment cannot be rescued by any model. | — | Rule card, six scenarios, Hubbard Brook story. |
| Design thread (13a, 27, 35a, 49a, 53a, 57) | At each step only the part just finished: 13a after block 2; 27 after block 3; 35a after block 4; 49a after block 5; 53a after block 6. | Own question and measurement; own unit of replication and units versus measurements; within-unit variables and blocks; own model formula; own fixed and random factors; the seven design questions. Reference answers for the hypothetical dragonfly design. | Fitting the own model; design theory, power analysis (out of scope). | Five thread slides with the reference example, checklist. |
| 7 — Conclusion and close (54–59) | Complete lesson; confounding (L07). | Conditional answer with the unit of replication and limitations; seven design questions; key ideas; the hierarchy stays when the response changes. | Models for yes/no answers and counts (next lesson). | Written answer, evidence card, result box, checklist, summary, closing question. |

## PollsLive retrieval proposal

This block needs **its own explicit approval** (integration map plus exact questions) in addition to the story map, per `.ai/authoring/pollslive.md`.

### Integration map

- Placement: slides 3–6, after the hook (slide 2) and before `Výsledky učení` (slide 7), via `{{< include ../pollslive/generated/active.qmd >}}`. In the deck this block replaces the skripta's opening callback (skripta block 2); the L10 islands question becomes retrieval Q3, and the L05 crab question moves to slide 26, where it is answered.
- Retrieves: approved, merged and released L10 material (`L10-v1.0.0-20261015`; the deck at `d76cab3`). Q1 covers the multiplicative reading of the power-law exponent. Q2 covers the difference between transformations that change only location and scale and those that change shape. Q3 covers what residual plots can and cannot show, which is the L10 closing question.
- Bridge (spoken): L10 ended with "Jsou ostrovy jednoho souostroví nezávislá pozorování?" Residual plots cannot answer that; the froglets show what can.
- Scheduled lecture: 2026-12-14 (from `_pollslive/pollslive/activation-2026-27.json`, L11 row, currently disabled and unpinned).
- Difficulty: one short computation (Q1, U2), one transfer to a new variable (Q2, U3), one interpretation of evidence (Q3, U2); every distractor encodes a named misconception, options are similar in length, and all numbers are computed from the real L10 data.
- Evidence assets: rendered deterministically by a new `R/render_pollslive_assets.R` from an unchanged copy of `L10/data/druhy_galapagy.csv` (SHA-256 `a60499f4…98fb2`, from `faraway` 1.0.9 under GPL, attribution kept in `data/README.md`) and from `ggplot2::msleep` (as in L10). Hashes are pinned in `R/verify_pollslive_assets.R`, following L10. Explanations contain no hardcoded numbers beyond the stems approved here.
- Values verified on 2026-10-22 from those sources in a fresh R session: exponent of Mocninný vztah 0,3886 (95% CI 0,30–0,47); 10^0,3886 = 2,45; 100^0,3886 = 5,99; 2 × 2,45 = 4,89; 10 × 2,45 = 24,5; 100 × 0,3886 = 38,9. Mammals: 83 species; box-plot outliers 11 in kg, 11 as z-scores, 11 in grams, 0 after the logarithm.
- Adapter: L11 has only the template files (`config.template.json`, `quiz.template.json`, `validate.mjs`). `_L-template` `config.template.json` still pins the client to `main`, which `pollslive.md` forbids, so after approval the adapter is taken from merged L10 (client `_pollslive` pinned at `17a62da`, correct-position guard), as L10 did from L09. The lesson-reader GitHub App access for L11 is still open (Stage 0 setup item 6).

### Exact questions

#### 1. Multiples on log axes

- ID: `stokrat-vetsi-ostrov`
- Revision 2 (Ondřej Mottl, 2026-10-23, approved): in revision 1 the stem gave 2,45, so the question could be answered without the evidence table and the table supported only distractor A. The stem no longer gives the multiple, so students must read the slope 0,389 from the table; they still only choose a calculation.
- Text: `Kterým výpočtem zjistíte podle modelu Mocninný vztah, kolikrát víc druhů má ostrov stokrát větší?`
- Options:
  1. A `sklon-krat-sto`: `0,389 × 100 (sklon vynásobený stem)` (reads the slope as if the scale were not logarithmic)
  2. B `sklon-krat-log-sto`: `0,389 × log(100) (sklon vynásobený logaritmem stovky)` (stays on the log scale and does not back-transform)
  3. C `sto-na-sklon`: `100 na 0,389 (sto umocněné na sklon)` **Correct**
  4. D `intercept-plus-sklon-krat-sto`: `2,904 + 0,389 × 100 (intercept plus sklon krát sto)` (plugs the raw area into the model as if it were a straight line)
- Explanation: `Na logaritmických osách je sklon exponent: násobek plochy umocníme na sklon. 100 na 0,389 je asi 6,0, totéž jako 10 na 0,389 dvakrát za sebou (2,45 × 2,45). Součin 0,389 × log(100) je jen změna na logaritmické ose, kterou je ještě potřeba převést zpět.`
- Revision 1 text, superseded: stem `Desetkrát větší ostrov má podle modelu Mocninný vztah asi 2,45krát víc druhů. Kterým výpočtem zjistíte, kolikrát víc druhů má ostrov stokrát větší?` with options `0,389 × 100`, `2,45 × 10`, `2,45 × 2,45` (correct), `2,45 + 2,45`.
- Evidence: the L10 coefficient table of Mocninný vztah (`log(pocet_druhu) ~ log(plocha_km2)`, estimate and 95% interval), as on the L10 slide „Kolikrát víc druhů má dvakrát větší ostrov?“, without the worked 2^0,389 result.
- Alt: `Tabulka koeficientů modelu Mocninný vztah: intercept a sklon logaritmu plochy 0,389 s 95% intervalem spolehlivosti od 0,30 do 0,47.`
- Distractor logic: A reads the exponent as a slope on the raw scale; B multiplies the species multiple by the area factor; D adds the two tenfold steps instead of multiplying them. All four options share one parallel form of similar length, so the correct one is neither the longest nor the only explained one. The question still tests the U2 step (how multiples combine on log axes) without a calculator.

#### 2. Scale versus shape on a new variable

- ID: `savci-z-skore`
- Text: `Krabicový graf hmotností v kilogramech označil 11 z 83 druhů savců jako možná odlehlé. Kolik druhů označí krabicový graf stejných hmotností převedených na z-skóre?`
- Options:
  1. A `zadny-jako-log`: `Žádný: z-skóre zkrátí dlouhý chvost podobně jako logaritmus.`
  2. B `stejne-jedenact`: `Stejně 11: z-skóre mění jen polohu a měřítko, ne tvar.` **Correct**
  3. C `mene-mensi-rozptyl`: `Méně než 11: z-skóre zmenší rozptyl hmotností na jedničku.`
  4. D `nelze-bez-jednotek`: `Nelze určit: z-skóre už nemá žádné jednotky hmotnosti.`
- Explanation: `Z-skóre od každé hmotnosti odečte průměr a vydělí ji směrodatnou odchylkou. Posune a zmenší osu, ale tvar rozdělení zůstane, a s ním i dlouhý chvost a stejní odlehlí savci. Tvar mění až transformace jako logaritmus.`
- Evidence (revision 3, approved 2026-10-23; revision 2 showed a histogram, which did not match the box plot in the stem): the L10 skripta box plot of mammal body mass in kilograms (`ggplot2::msleep$bodywt`, 83 species), a single vertical box with 11 points flagged as possible outliers by `grDevices::boxplot.stats()`; asset `l10-hmotnost-savcu-kg-krabicovy-graf.png`. The logarithmic box plot is left out so that it does not suggest option A.
- Alt (revision 3, 2026-10-23): `Krabicový graf tělesné hmotnosti 83 druhů savců v kilogramech. Krabice je stlačená u nuly a nad ní leží mnoho bodů označených jako možná odlehlá pozorování.`
- Distractor logic: A treats every transformation as shape-changing ("transformation is cosmetic" reversed); B confuses a smaller SD with fewer outliers; C thinks a unitless scale cannot be compared.
- Note: the stem gives 11 and 83 as evidence; both will be checked against the asset source when the quiz file is written.

#### 3. What residual plots cannot show

- ID: `co-residua-neukazou`
- Text (revision 3, approved 2026-10-23): `Grafy residuí modelu Mocninný vztah neukazují žádný zřetelný problém. Co z nich přesto poznat nemůžeme?`
- Options:
  1. A `nezavislost-ostrovu`: `Zda jsou ostrovy jednoho souostroví navzájem nezávislá pozorování.` **Correct**
  2. B `tvar-vztahu`: `Zda je vztah na logaritmických osách přibližně přímý, nebo zakřivený.`
  3. C `soumernost-residui`: `Zda mají residua přibližně souměrné rozdělení bez dlouhého chvostu.`
  4. D `stejny-rozptyl`: `Zda je rozptyl residuí podobný u malých i u velkých ostrovů.`
- Explanation: `Graf residuí ukáže oblouk, vějíř i dlouhý chvost. Neukáže ale, zda si některé ostrovy nejsou podobné jen proto, že jsou sousedé a vyměňují si semena a živočichy. Nezávislost posuzujeme podle toho, jak data vznikla.`
- Evidence: the L10 three-panel diagnostics of Mocninný vztah (residuals versus fitted values, residual histogram, residual Q–Q plot), as on the L10 slide „Pomohl logaritmus také residuím?“.
- Alt: `Tři diagnostické grafy modelu Mocninný vztah. Residua tvoří přibližně stejně široký vodorovný pás kolem nuly, histogram je přibližně souměrný a body Q–Q grafu leží blízko přímky.`
- Distractor logic: B, C and D are properties that these exact plots do show; choosing them reveals the misconception that a clean residual plot certifies the whole model, or that diagnostics cannot read shape.
- Overlap check: the question foreshadows slide 19 (residuals by tank) without revealing it; it uses only L03 and L10 content.

### Correct-answer balance

- Proposed key: **Q1 C, Q2 B, Q3 A** (three distinct positions; the key C–B–A is not used in L01–L10).
- Course four-option retrieval totals before L11 (L02–L10, 27 questions, read from each lesson's `pollslive/quiz.json` on 2026-10-22): A 7, B 6, C 7, D 7. Per slot: Q1 A 2, B 2, C 2, D 3; Q2 A 3, B 2, C 2, D 2; Q3 A 2, B 2, C 3, D 2.
- After L11: A 8, B 7, C 8, D 7 (25 % ± 1). Per slot: Q1 C 3, Q2 B 3, Q3 A 3; every slot differs by at most one. To stay within one per slot, L11 had to avoid D for Q1, A for Q2 and C for Q3, and it needed one B overall; the only other balanced key is A–D–B.
- No locked or image-constrained positions: the evidence images carry no option letters.

### Retrieval-block knowledge state

| Step | May assume before | Retrieved here | Must not assume yet | Evidence |
|---|---|---|---|---|
| Q1 | Power-law model on log axes, exponent 0,389, the doubling and tenfold multiples (L10). | Multiples combine by multiplication on log axes. | Anything about hierarchy. | Coefficient table. |
| Q2 | z-score, box-plot outliers, scale versus shape, the L10 mammal slide (L01, L10). | z-scores keep the shape and the outliers; only shape-changing transformations shorten a tail. | — | Kilogram histogram. |
| Q3 | Residual plots and Q–Q plots (L03, L10); L03: residual plots cannot detect groups; L10 closing question. | Independence is judged from how the data arose, not from residual plots. | Units of replication, pseudoreplication (slides 14–23). | Three diagnostic panels. |
| Bridge | L10 closing question. | "Are islands independent?" stays open. | The answer. | Spoken bridge to slide 8. |

## Active-learning cadence

| Minute (approx.) | Slide | Activity | Evidence of learning |
|---|---|---|---|
| 2 | 2 | Personal prediction, show of hands | Checked on slide 12 |
| 4–11 | 3–6 | PollsLive retrieval | Read L10 evidence |
| 14 | 10 | Noticing: froglet or tank? | Treatment level seen in the design |
| 16 | 11 | Quick question on the table | Data-inspection habit |
| 18 | 12 | Pair: describe the difference | Effect before uncertainty |
| 21 | 13 | Think–pair–share on the tank plot | Grouping noticed before naming |
| 23 | 13a | Own study, step 1 | Own question and measurement |
| 25 | 16 | Vote with partner convince | Unit of replication |
| 30 | 19 | Pair: residuals look fine? | Dependence within tanks |
| 34 | 21 | Vote: wider interval | Unit linked to uncertainty |
| 38 | 24 | Blank-heading MCQ, partner convince | More rows ≠ more units |
| 43 | 27 | Own study, step 2, and dragonfly designs | Units in one's own and a planned study |
| 47 | 30 | Vote: tank as a predictor | Limit of the fixed factor experienced |
| 51 | 33 | Vote: day of metamorphosis | Between versus within groups |
| 55 | 35a | Own study, step 3 | Within-unit variables, blocks |
| 58 | 37 | Quick question: tank like drying? | Groups as a sample |
| 63 | 42 | Vote: SE of the mixed model | Model counts tanks |
| 66 | 44 | Vote: tanks or froglets differ more? | Variance components in mm |
| 68 | 44a | Prediction: 100 froglets per tank | Ceiling of independent information |
| 70 | 44b | Pair prediction: where is the model's baseline? | Small versus large tank |
| 72 | 45 | Pair: which tanks moved? | Partial pooling seen |
| 74 | 46 | Pair: residual shapes | Diagnostics in known terms |
| 76 | 47 | Prediction: largest variance part | Decomposition |
| 79 | 49a | Own study, step 4 | Own model formula |
| 83 | 52 | Small groups: six scenarios | Fixed versus random transfer |
| 85 | 53 | Quick question: Hubbard Brook | Design limit |
| 87 | 53a | Own study, step 5 | Own fixed and random factors |
| 90 | 55 | Silent write, then pair | Conditional conclusion |
| 96 | 59 | Closing question in pairs | Hierarchy independent of response type |

Minutes are cumulative estimates for revision 2 without cuts. The 38–38b build adds a prompt on 38, so the longest stretch without an interaction stays about 5 minutes. The revision-2 estimate is about 96–100 minutes: the layer build, the effective-sample slide and the three-tank slide add about 5 minutes on top of revision 1. *Risks and fixes* lists the cuts that bring it back to 90.

## Visual vocabulary (planned)

- **Anchor graph:** the tank strip plot (slide 13: froglets per tank, ordered by tank mean, mean ticks) returns as residuals by tank on slide 19 in the same tank order and the same canvas. Slide 45 reuses the tank axis ordered by froglet count, because tank size is the point there; the heading and axis label say so.
- **Treatment colours (decided by Ondřej Mottl, 2026-10-22, option C):** non-dried tanks steel blue `#2E6CA4`, dried tanks terracotta `#C2613A` from the `_brand` accessible group palette, applied to the skripta (`barvy_vyschnuti`) as well, so both artifacts show the same figures. They are a documented categorical override (`_brand/brand_guidelines.qmd`, "Categorical group colour"); they overlap neither the model purple nor the focus orange. They appear on slides 10, 12, 13, 32, 34, 38 and 45 and nowhere else.
- **Semantic colour:** individual froglets and residuals grey; model lines, estimates and intervals purple; the current focus (tank 45, the `NA`, the shifted tanks, the between-tank variance part) orange; reference lines (zero line, Q–Q line, treatment-mean lines) graphite dashed. Text highlights follow the same mapping (`.text-hgl-graphite`, `.text-hgl-indigo_velvet`, `.text-hgl-orange`).
- **Count cue:** „485 žabek“ (rows) in graphite and „16 nádrží“ (independent answers) in orange, wherever the two numbers meet (slides 16, 17, 22, 23, 26, 27, 43, 49), so that the unit of replication always carries the focus colour.
- **Approach identity:** the four approaches keep stable names and order: „každá žabka zvlášť“, „průměry nádrží“, „nádrž jako pevný faktor“, „náhodný intercept“ (slides 18, 20, 30, 41, 49).
- **Variance parts:** drying purple, between tanks orange, between froglets of one tank grey, on slides 44, 47 and 48.
- **Code-and-output pairs:** code left, output excerpt right (slides 11, 18, 20, 30–31, 41, 43–44); excerpts are captured from the real model objects, never typed.
- **Design-thread cue:** the five „Vaše vlastní studie“ slides and the checklist share one silhouette: an olive kicker „Vaše vlastní studie · krok N z 5“, the own-study prompt first, the dragonfly reference as a fragment below, and G6 small at the top right (G5 on step 1, where the dragonfly example is introduced). Olive is reserved for this thread and for partner prompts, as in `active-learning.md`.
- **Interaction cue:** prompts use `.panel-question` or a bold minimal question; votes use equal option cards, and the correct option is marked only with `.rn-circle-orange` after commitment. Slide 24 is the blank-heading MCQ.
- **Generated illustrations:** the title image and G1–G5 share one cast and style (below), carry Czech alt text and the caption „Ilustrace vytvořená pomocí AI.“, and carry no statistical evidence.

## Generated illustration plan

### Shared visual language

- Style and cast as in `Learning_materials/images/GENERATED_IMAGES.md` (version 2): warm storybook natural-history watercolour/gouache, gentle academic humour, natural anatomy; a plains leopard frog field ecologist with a small notebook and ruler and a blue-green dragonfly assistant; natural colours for organisms and habitat, course indigo, parchment, graphite and small orange accents only on equipment.
- Global constraints: no text, letters, numbers, axes, charts, logos or watermarks; no image shows or implies which froglets are larger or how many tanks there are.
- Storage and provenance: `Presentation/Materials/<name>.png` and `Presentation/Materials/GENERATED_IMAGES.md` (slide, teaching role, exact prompt, Czech alt text, status, tool, date, file name, SHA-256). Every planned slide gets an `include_optional_figure()` slot that shows nothing, and no caption, until the file exists.

### In-deck series

| ID | File | Slide | Teaching role | Source |
|---|---|---|---|---|
| G1 | `zabky_vysychajici_tun.png` | 2 | Makes the biological question concrete: a pool that dried out and refilled, froglets leaving the water. | Reuse of skripta S1 (v2), copied with its provenance. |
| G2 | `zabky_pokusne_nadrze.png` | 9 | Shows a tank mesocosm as a physical object before the schematic. | Reuse of skripta S2 (v2). |
| G3 | `zabky_jedna_nadrz_mnoho_zabek.png` | 25 | Metaphor after the MCQ: measuring ever more froglets from one tank refines that tank, while the question needs more tanks. | **New.** |
| G4 | `zabky_tune_v_krajine.png` | 37 | Metaphor for a random factor: a few tanks stand for many possible pools. | Reuse of skripta S3 (v2). |
| G5 | `vazky_tune_les_pole.png` | 13a | Introduces the dragonfly reference example of the design thread: woodland and field pools with larvae. | Reuse of skripta S4 (v2). |
| G6 | `zabky_planovani_studie.png` | 27, 35a, 49a, 53a, 57 | Recurring icon of the design thread: the cast planning a study before going into the field, so that students recognise "your own study" at a glance. | **New** (revision 1). |

Reusing S1–S4 keeps the cast identical between the skripta and the deck and avoids four new generations. Each reused file is copied unchanged into `Presentation/Materials/` and recorded with its original prompt, tool, date and SHA-256 from the skripta record.

#### G3 — `zabky_jedna_nadrz_mnoho_zabek.png` (new)

- Teaching role: an image students can recall when they are tempted to measure more individuals instead of adding units. Placed on slide 25, after the MCQ on slide 24 has been answered, so it reveals nothing.
- Prompt core: warm storybook natural-history watercolour/gouache, landscape 4:3, transparent RGBA background with an irregular painterly vignette. On a field-station meadow, the plains leopard frog field ecologist sits beside one round grey cattle tank and patiently measures a long queue of froglets climbing out of that single tank with its ruler, its notebook pages filling up. Behind it, a row of other identical tanks stretches into the distance, unvisited; the blue-green dragonfly assistant hovers over them and gestures towards them. Gentle academic humour. All froglets the same size; the number of tanks in the row cannot be counted. No text, letters, numbers, labels, arrows, charts, logos or watermarks.
- Alt: `Žába ekoložka trpělivě měří dlouhou řadu žabek, které lezou z jediné nádrže, zatímco vážka nad ní ukazuje na řadu dalších nádrží, ke kterým se zatím nikdo nedostal.`
- Acceptance: one tank clearly busy, many other tanks clearly untouched; no size differences between froglets; no text.

#### G6 — `zabky_planovani_studie.png` (new, revision 1)

- Teaching role: a recurring, recognisable cue for the design thread; it shows planning, not results, so it can sit on every thread slide.
- Prompt core: warm storybook natural-history watercolour/gouache, square 1:1, transparent RGBA background with an irregular painterly vignette, readable at about 220 px. The plains leopard frog field ecologist sits at a small folding field table at the edge of a meadow with pools in the background, sketching in its notebook beside an unfolded blank map with a few pool outlines and small pebbles placed on some of them as markers; the blue-green dragonfly assistant hovers over the map, pointing at one pool with a leg. A dip net and a ruler lean against the table, still unused. Gentle academic humour. No text, letters, numbers, labels, arrows, charts, logos or watermarks; the map carries only outlines.
- Alt: `Žába ekoložka u polního stolku plánuje studii nad prázdnou mapou s obrysy tůní, na které rozmisťuje oblázky; vážka ukazuje na jednu tůň a síťka zatím stojí opřená o stůl.`
- Acceptance: legible as "planning" at small size; the map has no writing; consistent with the cast of S1–S4.

### T — title image `zabky_titulni.png` (slide 1)

- Format: portrait 3:4 (for example 1086 × 1448 px), PNG RGBA with genuine transparency and an irregular painterly vignette that fills almost the whole canvas, per `presentation.md`. L10 `ostrovy_titulni.png` is supplied only as a composition, painterly-style and transparency reference.
- Reference assets: G1 (drying pool), G2 (tanks) and G4 (pools in the landscape) for the cast, the tanks and the setting; the tank strip plot of slide 13 only as a loose motif of grouped columns (no axes, no numbers).
- Prompt core: the frog ecologist and the dragonfly in the lower foreground at the rim of a cattle tank, froglets climbing out over the rim; behind and above them, a pool with a band of cracked dried mud that is refilling, and further up a landscape dotted with pools and a few tanks. No size differences between froglets; no text.
- Teaching role: introduce the drying pool, the tanks and the cast without implying the result. Generated after G3, per `presentation.md`; provenance in `GENERATED_IMAGES.md`. A missing title image blocks public release; a missing G3 does not.

### Generation route and boundary

This Claude Code session has no image-generation tool. During drafting, the full prompts go into `Presentation/Materials/GENERATED_IMAGES.md` and every slot into the deck; S1–S4 are copied from the skripta folder. G3 and T are then generated with an available image tool (L08–L11 used OpenAI built-in image generation) with targeted edits until each acceptance check passes. The human author may reject any image independently of the story-map approval.

## Story-map audits before human approval

- **Heading strip:** the title question leads to a prediction about froglet size and L10 retrieval, then outcomes. Part A: the experiment with its tanks, which tanks dried and how many froglets came out, one froglet per row, the sizes of froglets from both kinds of tank, the same froglets split by tank. Part B: how many independent answers; froglets in tanks; at which level drying was decided; froglet as the unit of observation and tank as the unit of replication; a model per froglet; do its residuals look fine; a model per tank; which interval is wider; same difference, three times the uncertainty; why 16 tanks are not 485 froglets; the MCQ; more froglets refine a tank, more tanks refine the answer; why crabs and knotweed were averaged; dragonfly larvae; what we know about the froglets. Part C: the tank as a predictor; what the model prints; only `NA`; drying and tank carry the same information; day of metamorphosis; later froglets larger within tanks; why only within tanks. Part D: own baseline per tank; tank 27; tanks scattered around their treatment mean; what one froglet's length consists of (twice); the model in R; closer to which SE; how large and how precise; tanks or froglets; where the baselines lie; residuals and baselines; how much variability drying and tanks capture; marginal and conditional R²; four ways. Part E: fixed or random; levels of interest; six situations; one treated watershed. Close: conclusion; write it; the answer; seven questions; what to take away; survival instead of length. The strip reads as a content narrative.
- **Banned sequencing words:** no heading or planned prompt uses nejdřív, potom, teď, dnes, znovu, nakonec or teprve. The body of slide 2 describes the biological event of refilling; it will be phrased without „znovu“ where possible („po deštích se naplní“).
- **Data story first:** every concept block opens with a data moment, a vote or a question before its term. „Hierarchická data“ is named on 15 after the tank plot on 13. „Jednotka nezávislé replikace“ is named on 17 after the vote on 16. „Pseudoreplikace“ is named on 23 after the comparison on 22. „Pevný faktor“ is named on 32 after the `NA` on 31. „Blok“ is named on 35 after the within-tank lines on 34. „Náhodný faktor“ is named on 38a after the question on 37 and the first layer on 38. „Náhodný intercept“ and „smíšený model“ are named on 40 after the decomposition on 39. „Marginální a podmíněné R²“ are named on 48 after the stacked bar on 47. The headings that contain a term (17, 48) state a conclusion about something already seen.
- **Conclusion headings after votes:** the headings of 22, 31 and 34 state results, but each follows a separate vote slide (21, 30, 33) on which students commit first. The skripta neutralised the equivalent headings only because there the answer sat directly below the prompt.
- **First use:** jednotka pozorování (L02, L05) precedes jednotka nezávislé replikace (17). SE, CI, df and p are read on 18 and 20 before pseudoreplication (23). The L05 type I error is recalled in words only (23). `factor()` and reference groups (L06) precede the fixed-factor model (30). The normal reference shape (L10) precedes the random-effect distribution (38, 40). The SEs compared on 42 come from 18 and 20. R² and its comparability rule (L03, L09) precede 47–48.
- **No leakage:** the spine card on 28 poses the open question without naming any model. The PollsLive questions use only L03 and L10 content; Q3's answer names independence of islands, which L10's closing slide already asked.
- **Opening order:** title → hook (2) → retrieval (3–6) → outcomes (7) → first data moment (9–12), as `AGENTS.md` requires.
- **Spine:** the title question returns at 12 (first half), 28 (mid-lecture accounting) and 56 (conditional answer).
- **Inline values:** every number in slide copy, headings, cards and annotations will be computed from the froglet, crab, design-input and model objects; the speaker-note numbers above are only for planning.
- **Illustrations:** G1 and G2 ground the setting; G3 and G4 are metaphors attached to ideas already earned (slides 24 and 37–38); G5 grounds a transfer task. None appears on a vote or MCQ slide, and none carries a result.
- **Alignment with the skripta:** every slide maps to a skripta block; the only deck-only element is the vote content of slides 16, 21, 30, 33, 42 and 47, which turns skripta prompts into options.

## Risks and fixes

- **Pacing risk (revision 2):** 66 slides with about 29 interactions, estimated at 96–100 minutes. Part D now has 17 slides. **Proposed cuts for approval (about 8–10 minutes in total):**
  1. 53 (Hubbard Brook) shortened to one sentence in the step-5 reference of 53a (−1 slide);
  2. 26 (crabs) folded into 17 as a fragment with the two SEs (−1 slide);
  3. 20 merged into 18 as a fragment, so that both `lm()` outputs share one code-and-output slide (−1 slide);
  4. 49 dropped; the four-approaches table stays in the skripta, and 56 repeats its message in one line (−1 slide);
  5. 47 and 48 merged: the stacked bar with the two R² values as fragments below it (−1 slide).

  With all five cuts the deck has 61 slides and about 90 minutes. The thread steps stay short: 1 minute individually, then the reference as a fragment.
- **Content risk:** the output excerpts of `glmmTMB` contain more than students need. Fix: show only the rows read on each slide, captured from the model object, and point to the full output in the skripta.
- **Content risk:** two shares of variability between tanks (27 % on slide 44, 17 % on slide 47). Fix: the stacked bar shows parts of the total, the speaker note explains the different denominator, and slide 44 phrases its share as "of the variability left after drying".
- **Visual rhythm risk:** Part B has four code-and-output or table slides in a row (18–22). Fix: the vote card on 21 and the residual contrast on 19 break the run; audit the 3-in-5 component threshold after drafting.
- **Dependency:** the PollsLive adapter comes from merged L10; lesson-reader App access for L11 must be verified; synchronized rendering needs the quiz inputs committed and pushed (separate authorization). The `renv::snapshot()` for `glmmTMB`, `glossary`, `showtext` and `sysfonts` noted in the Stage 2 record is still open.

## Open choices for the human reviewer

1. **R² in the deck (47–48).** Recommended: keep the compact version (stacked bar, then the two R² in words and numbers), because the author added these sections in Stage 3. Alternative: leave R² to the skripta and end Part D with the synthesis table.
2. **Illustrations.** Decided in revision 1: reuse S1–S4 (G1, G2, G4, G5) and add new images where useful (G3, G6 and the title image).
3. **Design thread.** Decided in revision 1: the five „Vaše vlastní studie“ steps close Parts A–E, followed by the checklist.
4. **Treatment colours.** Decided by Ondřej Mottl on 2026-10-22: **C** (`_brand` steel blue and terracotta), also in the skripta. Options shown in the side-by-side figure: A skripta blue `#3A7DB8` / brown `#B5651D`; B `_brand` teal `#4E9A8A` / terracotta `#C2613A`; C `_brand` steel blue `#2E6CA4` / terracotta `#C2613A`. In the deuteranopia simulation, A and C stay clearly distinguishable (blue versus olive), while B's teal turns grey and loses contrast against the grey data points. Recommendation: A, or C if the brand palette is preferred (C needs the skripta figures changed too). B is not recommended.
5. **PollsLive key.** Recommended: C–B–A, as listed (balanced to 25 % ± 1). Alternative: A–D–B (also balanced).
6. **Pacing.** Decided by Ondřej Mottl on 2026-10-22: no cuts; the five candidates are marked as optional in their speaker notes.

## Skripta additions required by revision 2

The deck must not get ahead of the skripta, so each accepted visual gets a matching skripta change on this branch after the story map is approved (as with the treatment colours). No skripta text has been drafted yet.

| Deck slide | Skripta section | Planned change |
|---|---|---|
| 34 | „Souvisí den metamorfózy s délkou žabky?“ | Add the tank means (large open circles) to the existing two-panel figure and one sentence in „Proč se vztah ukázal až uvnitř nádrží“ pointing to them. |
| 38–38b | „Nádrže jako výběr z mnoha možných tůní“ | Replace the dot plot of tank means with a three-panel version of the layer build (treatment means → plus tank shifts → plus froglets), with a short paragraph before the text-only equation of the next section. |
| 44a | after „Jak moc se liší nádrže a jak moc žabky v jedné nádrži“ | New section „Kolik nezávislé informace je v 16 nádržích?“: the curve, the 55 versus 485 reading and the link to the SE ratio. A collapsed „Doplňující“ box computes it in words, then numbers, then symbols (the four-stage progression), using „podíl variability mezi nádržemi“ without naming the ICC (Stage 2 decision 3). |
| 44b | „Kde leží odhadnuté výchozí úrovně nádrží?“ | Add the three-tank figure before the existing overview, with one interpretation paragraph. |
| 45 | same section | Replace the segments in the existing figure with orange arrows; the tank order by froglet count stays. |

These changes need a glossary-coverage check of the new prose and a re-render of the skripta.

Status (2026-10-22, after story-map approval): all five additions made in `Learning_materials/skripta.qmd`.

- New hidden chunks: `nakreslit-vrstvy-delky`, `spocitat-efektivni-pocet-zabek`, `nakreslit-efektivni-pocet-zabek`, `spocitat-vychozi-urovne` and `nakreslit-tri-nadrze`. The existing chunks `nakreslit-den-a-nadrze` and `nakreslit-vychozi-urovne` were extended.
- All values are computed inline.
- The effective-sample box follows the four-stage equation progression.
- The middle tank of the three-tank figure is the 19-froglet tank, the largest of the small-tank cluster.
- Two errors found in the rendered figures were corrected:
  - the arrows of the layer build leaked into panel 1 (`tidyr::crossing()` → `tidyr::expand_grid()`);
  - the prose wrongly said the smallest tank's baseline lies close to the treatment mean.
- `R/render_skripta.R` exit 0. The changed figures were checked in the rendered HTML.
- Glossary links moved to the first occurrence in each section.
- Still to do: the independent glossary-coverage pass on the new prose (together with the presentation review); the PDF pages were not rasterised.

## Stage 4 drafting notes (2026-10-22)

### Deck

`Presentation/presentation.qmd` was drafted from the approved story map (revision 2), replacing the template gallery: 66 visible slides with 6 H1 dividers. DeckTape's slide count of the static variant was 66.

Deviations within the map:

- Slide 22 heading reads „Stejný rozdíl, mnohem větší nejistota“. The SE ratio is given in the takeaway strip instead, because an inline value in a heading needs its object before the slide starts.
- Slide 40 is folded into 39 as a second fragment, as planned in revision 1.
- The hidden data-loading chunk sits under the H1 divider „Žabky z pokusných nádrží“, because the next heading („Pokus se `r pocet_nadrzi` nádržemi“) uses an inline value. This is the same exception as in the skripta.
- The worked froglet of slide 39 is the first froglet of the smallest tank (tank 45, as in the skripta), selected in code rather than typed.
- Speaker notes mark the five cut candidates as optional (20, 26, 46, 47–48, 49, 53), as the author decided.

Infrastructure:

- Helpers copied from L10: `R/Functions/include_optional_figure.R` and `R/Functions/ai_disclosure.R`; their header lines now name L11.
- Reused illustrations copied byte-identically to `Presentation/Materials/`: G1, G2, G4 and G5.
- `Presentation/Materials/GENERATED_IMAGES.md` records T and G1–G6 with prompts, alt texts and provenance.
- Every illustration slot uses `include_optional_figure()`, so G3, G6 and the title image show nothing until generated.

### PollsLive adapter

Built by a separate agent (Sonnet) from merged L10, with the client pinned to `17a62daf970278f2cf5ce134d1b68ec01819be15`:

- `pollslive/config.json` and `pollslive/quiz.json`: the approved questions verbatim, key C–B–A, lecture date 2026-12-14.
- `R/render_pollslive_assets.R` and `R/verify_pollslive_assets.R`.
- Three evidence PNGs in `pollslive/assets/`.
- `data/druhy_galapagy.csv`: a byte-identical copy of the L10 table (SHA-256 `a60499f4…98fb2`), documented in `data/README.md`.
- `.github/workflows/pollslive.yml` now matches L10.

Asset SHA-256:

- `l10-koeficienty-mocninneho-vztahu.png`: `eca43a7a…8192758`
- `l10-hmotnost-savcu-kg.png`: `770fc71d…cc9132f1`
- `l10-diagnostika-mocninneho-vztahu.png`: `e46f3717…c77b870c`

Validation:

- `node pollslive/validate.mjs` passes, and it rejects three identical correct positions.
- `R/verify_pollslive_assets.R` passes and detects a changed asset.
- The quiz text is byte-identical to the approved strings.
- The pre-checks reproduce 83 mammals, 11 outliers in kg and as z-scores, and the exponent 0,389 (95% CI 0,30–0,47).

The asset script uses L10's own quiz theme, not `R/set_r_theme.R`, so it needs no web fonts.

Not done, each needing separate authorization: lesson-reader GitHub App access for L11 (Stage 0 item 6); committing and pushing the quiz inputs; the synchronized render; the `_pollslive` activation PR.

### Environment and render

- `renv::install(c("sysfonts", "showtext"))` installed three packages (`showtextdb` as a dependency) into the L11 project library. `R/set_r_theme.R` needs them, and the Stage 2 record had already listed them as missing.
- `renv.lock` is unchanged; the `renv::snapshot()` for `glmmTMB`, `glossary`, `showtext` and `sysfonts` is still pending.
- The PollsLive client cache was copied from L10 (`pollslive/.client-cache/`, git-ignored), as L10 did from L09.
- **Blocker:** the canonical offline render (`R/render_presentation.R`) builds both HTML variants, but DeckTape times out on slide 1. It fails the same way on a minimal two-slide deck without the theme, on L10's previously exported deck, with the bundled browser, with system Chrome or Edge, and outside the command sandbox. DeckTape cannot drive headless Chrome on this machine at present. This is an environment problem, not a deck problem.
- Because the wrapper publishes HTML and PDF together, `Presentation/presentation.html`, `presentation.pdf` and `docs/index.html` were not regenerated.
- A temporary script (`Temp/debug_decktape/render_live_only.R`, git-ignored) rendered the live HTML variant into `Temp/` with exit 0. Its figures were extracted and inspected; one fix followed (shorter diagnostic panel titles).
- No full-slide screenshots or fragment states could be produced.

## Independent reviews round 1 (2026-10-22)

- **Lesson-vision review** (`.ai/agents/vision-corrector.md`): a separate read-only subagent, model Sonnet (capable general model, complete-deck review). It read the full source, the record, the skripta, the quiz, the image record and the extracted figures. Verdict: the deck matches the approved story map; the cadence, spine and opening order are correct; it is not review-ready until the findings below are fixed. Gap: full-canvas and fragment states could not be inspected (DeckTape).
- **Glossary-coverage review** of the new skripta prose (`.ai/agents/glossary-coverage-reviewer.md`): a separate read-only subagent, model Haiku (economical, bounded check). Five missing first-occurrence wrappers were added: `prumer` twice, `linearni-model`, `pozorovani`, `smerodatna-odchylka`. Borderline verb forms („odhaduje“) and generic „rozdělení“ were left unwrapped.

Resolved findings:

- **HIGH, object locality:** `data_vrstvy_zabky` moved to the third layer slide; `r2_podminene` moved to the R² slide. The dragonfly design inputs and the divider data chunk stay as documented exceptions: they are used on their slide through derived values or a heading.
- **MEDIUM, single-froglet slide:**
  - the worked froglet is now from a dried tank (the middle tank of the three-tank slide), so the drying term is visible;
  - the source model is named on the slide;
  - the residual uses a typographic minus;
  - the symbols moved to a second slide with the same heading, as revision 1 allowed. The deck now has **67 slides**.
- **MEDIUM, sequencing words:**
  - „teď“ removed from the closing question;
  - „znovu napuštěna / znovu se naplnily“ replaced by „doplněna vodou“ in the deck (bullet, schematic label, alt text, conclusion). The skripta wording is unchanged.
- **MEDIUM, G4 revealed the answer:** the illustration now appears with the answer fragment, not before it.
- **MEDIUM, recurring cues:** see the list below.
- **MEDIUM, component run in Part B:** the crab slide is now plain text with fragments.
- **LOW:**
  - the 50 tadpoles are now a named input on the first slide that uses them;
  - the alt-text counts are computed;
  - the curve range is tied to the 100-froglet scenario;
  - „mírně šikmá“ became „pravostranně šikmá“;
  - visible code names all arguments (`is.na(x = …)`, `coef(object = …)`);
  - the hidden helper functions are renamed `spocitat_efektivni_pocet()` and `nakreslit_tri_nadrze()`;
  - the density mechanism (more tadpoles survived, so they competed more) is added to the limitations;
  - „Hlasujte rukou.“ removed;
  - MCQ and variance-card option lengths balanced;
  - the variance-slide SDs use 2 decimals;
  - speaker notes now explain G5 and G6.
- **Typographic minus:** negative values in slide text use a new `format_cz_minus()` helper in the setup chunk.

Recurring-cue changes in detail:

- **Three-tank slide** (deck and skripta): treatment mean graphite dashed, tank mean in the treatment colour, model purple. The legend became a caption whose model part appears with the model line.
- **„Kde leží…“** (deck and skripta): graphite dashed treatment lines; the deck adds a one-line key.
- **Effective-n curve:** direct labels „strop ≈ 60“ and „náš pokus“.
- **Highlights that clashed with treatment colours** (vyschnutí on slides 2 and 9, the within-tank slope, between/within on slide 35) became bold text.

Not changed, reported:

- Hidden chunks keep some one-line `<-` assignments with a function call. This is a LOW convention point, and L10 has the same pattern.
- Five slides may overflow once all their fragments are shown: the formula slide, „Jak velký je rozdíl…“, the six scenarios, „Sedm otázek…“ and step 2. They can only be judged on full-canvas renders.
- The generated PollsLive intro line „Společné odpovědi projdeme po hlasování“ comes from the shared adapter output, outside this lesson's source.

Validation after the fixes:

- `R/render_skripta.R`: exit 0.
- Live deck variant (`Temp/debug_decktape/render_live_only.R`): exit 0, 67 sections. All changed figures were re-extracted and inspected (three-tank slide, effective-n curve, „Kde leží…“, diagnostics titles, schematic label).
- The PDF and the full-canvas review are still blocked by DeckTape.

## Author review batch 1 (Ondřej Mottl, 2026-10-22)

Request: „The slides are very text heavy. Can we lighten it up with some images? Illustration?“

The author reviewed the deck as JPEG pages: four slides per image, all fragments revealed. The pages came from Chrome's own headless screenshot mode, which works on this machine although DeckTape does not. These screenshots also gave the first full-canvas pass of all 67 slides.

Decisions:

- **Four new illustrations** approved:
  - G7 `zabky_jednotka_replikace.png` (unit of observation versus unit of replication);
  - G8 `zabky_sbor_jedne_nadrze.png` (froglet choir, pseudoreplication);
  - G9 `zabky_pevny_nahodny.png` (chosen flowers versus pebbles drawn from a bag);
  - G10 `povodi_vapnik.png` (one limed valley).
  Prompts and alt texts are in `Presentation/Materials/GENERATED_IMAGES.md`, with slots on the slides. G1 also returns on the conclusion slide.
- **PollsLive:** the three explanations were shortened to one sentence each; questions, options, answers and the key C–B–A are unchanged. `node pollslive/validate.mjs` passes. The new texts need the author's confirmation, because they change approved quiz text.

Changes:

- **Text moved to speaker notes** on 15 slides; each keeps one dominant element: the experiment, the schematic, the unit slide, pseudoreplication, the MCQ answer slide, crabs, the fixed-factor slide, the day prompt and its explanation, the fixed-effect output, the variance components, the R² caveat, the decision questions, Hubbard Brook, the conclusion and the summary.
- **Layout fixes:**
  - slide 11 shows code and output side by side;
  - the text-only equation on slide 43 now spans two aligned lines;
  - shorter captions and figures on slides 49 and 53;
  - a non-breaking space in „1 000“.
- **Two errors introduced by the scripted edits were found in the renders and corrected:** a leftover copy of the old slide 11 (duplicate chunk label), and the `$$` delimiters on slide 43.

Still open:

- The PollsLive slides 5–6 still overflow in the static fallback with all fragments shown. The long question stems in the headings are the cause, and shortening them would change approved questions.
Validation: live-variant render exit 0, 67 slides; full-canvas screenshots of all slides inspected.

Images in place (2026-10-22): the title image, G1–G10 and the reused skripta images are all in `Presentation/Materials/`, with provenance in `GENERATED_IMAGES.md` and the prompt JSON. The live variant renders with exit 0 and 67 slides. Full-canvas screenshots of every slide were checked again. Slide 60 had its warning box touching the slide number, so the image column was narrowed from 50 % to 44 %. No other layout problems were found besides the open PollsLive overflow. The self-contained live HTML is about 80 MB because of the large illustrations.

## Author review batch 2 (Ondřej Mottl, 2026-10-22)

- Slide 19 („Model, který počítá každou žabku zvlášť“): the author asked to link the R output to a figure. A hidden figure was added: every froglet as a point in its treatment colour, plus the fitted model as one purple segment joining the two group means, labelled with the intercept and the difference, the same values as in the `lm()` output.
- Slide 59 („Pevný, nebo náhodný? Šest situací z biologie“): the author asked that the slide always show the unit students should classify. Each card now shows the grouping variable from the start (druh, lokalita, blok, netopýr, pohlaví, jezero), and only the verdict appears on click. The reveal order follows the situation numbers 1–6 via `fragment-index`.
- Validation: live-variant render exit 0; both slides checked as full-canvas screenshots.
- PollsLive question slides: the author found the question headings too large. Instead of shortening the approved questions, the question style changed: `.reveal section.quiz-question > h2` at 1.15em (headings are 1.9em) in the canonical `_brand` generator `R/Functions/Theme_generation/generate_presentation_components.R`, and L11's `theme/` cache was regenerated with `R/generate_theme.R`. Slides 4–6 now fit with all fragments shown, so the open overflow item is resolved. The `_brand` change reaches every lesson with PollsLive on its next supported render.
- Canonical render (2026-10-23, after `_brand` PR #11 was merged): `Rscript R/render_presentation.R` in sync mode stopped before rendering, because the PollsLive client requires the quiz inputs to be pushed and the three `pollslive/assets/*.png` files are not yet on `origin/lesson/l11-presentation`. With `POLLSLIVE_RENDER_MODE=offline`, the same script exited 0: it wrote `Presentation/presentation.html` and `Presentation/presentation.pdf`, and DeckTape printed all 67 slides (DeckTape now works on this machine). The PDF uses the static quiz variant, which differs from the checked screenshots only in that the answers are not revealed on click. A sync-mode render is still needed after the branch is pushed.
- Sync render (2026-10-23): the PollsLive inputs including the revised Q1 were committed and pushed as `7ef3d07` (author's go-ahead). The first sync attempt failed because the lesson-reader App (`cuni-mb120p163-pollslive-reader`) had no access to L11; the author added L11 to its selected repositories, which closes Stage 0 setup item 6. The second `Rscript R/render_presentation.R` exited 0 in `sync` mode: it rendered the live and static variants, DeckTape printed 67 slides, and `presentation.html` and `presentation.pdf` were published with the new Q1.
- PollsLive explanations: with the extra space, the author asked for longer explanations. The three explanations approved with the quiz were restored word for word (see „Exact questions“ above), which replaces the one-sentence versions from batch 1; that pending confirmation is no longer needed. `node pollslive/validate.mjs` passes; slides 4–6 fit with all fragments shown.

## Revision 3 implementation and reviews (2026-10-23)

- **Dataset.** `R/prepare_frog_data.R` now writes tank labels `N2`…`N54`; only the label column changed (checked by comparing old and new tables). `data/README.md` describes the label and has the new SHA-256. The Stage 1 record keeps the historical hash.
- **Deck.** Implemented as approved, 70 slides. Two additions came from the independent review and go beyond the approved list:
  - a „Shrnutí lekce“ divider before „Co si odnést“, so the lesson does not end inside the parallel-study section;
  - „Krok 1–5“ in the headings of the parallel-study slides, with the factor slide (krok 4) before the model formula (krok 5), so the checklist tags have targets.
- **Deck code.** In both the visible and the hidden code, `nadrz` is a factor in numeric tank order, as in the skripta, and `factor(nadrz)` is gone from the formulas.
- **PollsLive.** Q2 evidence is now the L10 kilogram box plot (`l10-hmotnost-savcu-kg-krabicovy-graf.png`, exactly 11 flagged species, deterministic, hash pinned). The Q3 stem is reworded. `validate.mjs` passes. The quiz inputs are not yet pushed, so the sync render waits for the next push.
- **Skripta.** Tank labels, the independence callback, the single-froglet-tank narrative, and the residual-shape message (cause plus robustness). Rendered HTML and PDF, exit 0.
- **Independent reviews.** The model choices follow `behaviour.md`: Sonnet for the complete reviews, Haiku for the glossary check.
  - Skripta, vision-corrector (Sonnet). Fixed:
    - the „mírně šikmý … model je v pořádku“ wording for the all-froglet residuals;
    - a sentence explaining why the day of metamorphosis stays out of the drying model (mediator);
    - four older sequencing words.
  - Skripta, glossary coverage (Haiku). Four wrappers added or moved (`pozorovani`, `histogram`, `prumer`, `nejistota`).
  - Deck, vision-corrector (Sonnet), no content errors. Fixed:
    - the dangling „krok“ tags;
    - the step order;
    - the closing section;
    - the formula overflow on 41;
    - slide 11 code clipped;
    - tank means hidden on 48;
    - the colour cue in the slide 43 caption;
    - the matrix size on 32;
    - the SE wording on 47;
    - „téměř stejné“ on 51.
  - Deck review findings left open, all pre-existing or optional:
    - wide `summary()` outputs cut at the p-value column (18, 21, 31, 45);
    - small arrows on 49;
    - small PollsLive evidence images;
    - some top-heavy slides.
- **Validation.** Live-variant render exit 0, 70 slides; full-canvas screenshots of all slides inspected after the fixes.

## Author review batch 4 (Ondřej Mottl, 2026-10-23)

- Slide 15 („Žabky v nádržích, nádrže v pokusu“): the hierarchy diagram uses the treatment colours (treatment labels, branches and tanks); froglets stay graphite.
- New slide 33 „Kdy může nádrž zůstat v modelu jako pevný faktor?“, requested as an expansion of the overlap matrix and a segue to the day of metamorphosis. It shows the same grid for a hypothetical design: four tanks, each split by a partition into a fed and an unfed half. The treatment column is not the sum of the tank columns, so the model can estimate it beside tank as a fixed factor. A closing fragment bridges to the day of metamorphosis, which varies within every tank. The example is labelled as invented; „blok“ is still named on the slide after the day of metamorphosis.
- Krok 3–5: each answer moved under its question in the left column, and the slide is vertically centred, removing the empty middle.
- The deck now has 71 slides. Live-variant render exit 0; all slides re-shot and the changed ones inspected. The canonical render is still blocked by DeckTape timing out on any deck, including the minimal test deck, so `Presentation/presentation.html` and `presentation.pdf` remain the 09:00 versions.

## Visual workflow checks

- Story map completed and explicitly human-approved before full slide copy: [x] (Ondřej Mottl, 2026-10-22, revision 2)
- Text-light slides (no dense walls): [ ]
- Staged reveal via fragments/incremental: [ ]
- Figures generated locally near slide blocks: [ ]
- Immediate interpretation after key visuals: [ ]
- Interaction cadence present: [ ]

## Slide-role rhythm

- Main interaction slide form used: prediction votes on equal cards (2, 16, 21, 30, 33, 42, 44, 47), one blank-heading MCQ (24), pair prompts beside figures or code (12, 13, 19, 27, 45, 46), small-group classification (52), silent write (55).
- Main evidence reveal form used: same data, new layer (13, 19), code plus output excerpt (18, 20, 31, 43, 44), two-panel figure (34), comparison table and interval plot (22).
- Main interpretation form used: contrasted panels (17, 35), graph plus takeaway (25, 38), the spine card (28), the result box (43, 56).
- Where the bridge to the next concept happens: 28 (to the fixed factor), 35 (to the random intercept), 49 (to the fixed-versus-random decision), 59 (to the next lesson).

## Stage 5 - Human review gate

- Finished slide headings compared with the story map: [ ]
- Heading-strip, visible-copy, and first-use audits completed: [ ]
- Lesson-vision review completed: [ ]
- Human review completed: [ ]
- Credible findings resolved: [ ]
- Presentation rendered and checked: [ ]
- Reviewer decision:

## Decision

- [ ] Slides ready for review
- [x] Story-map status is `complete`
- [x] Human story-map approval is `approved` and recorded (Ondřej Mottl, 2026-10-22)
- [x] PollsLive integration map and exact questions approved and recorded (Ondřej Mottl, 2026-10-22)
- [x] Generated illustration plan (T, G1–G6) approved (Ondřej Mottl, 2026-10-22)
- [ ] Diff contains only Stages 4-5 sources, records, and corresponding outputs
- [ ] Presentation PR ready to merge
- Notes:
