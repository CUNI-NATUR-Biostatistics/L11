# Stage Log

Use this file as the running history for lesson-production decisions and stage transitions.

## Entry format

| Date | Stage | Status | Key change | Record file | Branch / PR | Reviewer |
|---|---|---|---|---|---|---|
| YYYY-MM-DD | Stage X | started/in review/done | One sentence summary | `Workflow/records/...` | `branch-name` / #PR | Name |

## Current lesson log

| Date | Stage | Status | Key change | Record file | Branch / PR | Reviewer |
|---|---|---|---|---|---|---|
| 2026-11-06 | Stage 0 | done | New GLM L11 after the L11/L12 swap; repository created from `_L-template` with all setup items done; scope draft with proposed `osnova_lekci.md` entry (five outcomes), starting-knowledge summary from L01-L10 and standing-practice handling; D1-D6 decided (`glmmTMB()` with a `glm()` Extra, one data story preferred, probabilities without odds in the core, observed-vs-predicted checks, AIC) | `Workflow/records/2026-11-06-stage-0-scope.md` | `lesson/l11-scope-data` / PR not opened | Ondřej Mottl |
| 2026-11-06 | Stage 1 | done | 16 examples from 12 sources; three finalists probed with `glmmTMB`; selected and locked: mistletoe (*Loranthus europaeus*) on 1,015 oak stems in Podyjí NP (Matula et al. 2015, Dryad CC0) (`data/ochmet_duby.csv`, prepared by `R/prepare_mistletoe_data.R`) with an infected 0/1 and a mistletoe count response, DBH and distance to the nearest infected stem as predictors | `Workflow/records/2026-11-06-stage-1-dataset.md` | `lesson/l11-scope-data` / PR not opened | Ondřej Mottl |
| 2026-11-07 | Stage 0 | done | D1 revised: base `glm()` in L11 (Cook's distance and all `lm()` tools work directly; no new package, no `glm()` Extra box); `glmmTMB()` kept for L12 instead of `lme4`; proposed `osnova_lekci.md` entry updated to name `glm()` | `Workflow/records/2026-11-06-stage-0-scope.md` | `lesson/l11-scope-data` / PR not opened | Ondřej Mottl |
