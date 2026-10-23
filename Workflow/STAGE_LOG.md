# Stage Log

Use this file as the running history for lesson-production decisions and stage transitions.

## Entry format

| Date | Stage | Status | Key change | Record file | Branch / PR | Reviewer |
|---|---|---|---|---|---|---|
| YYYY-MM-DD | Stage X | started/in review/done | One sentence summary | `Workflow/records/...` | `branch-name` / #PR | Name |

## Current lesson log

| Date | Stage | Status | Key change | Record file | Branch / PR | Reviewer |
|---|---|---|---|---|---|---|
| 2026-10-21 | Stage 0 | done | Scope locked: hierarchy, unit of independent replication and pseudoreplication, then random-intercept mixed models fitted with `glmmTMB`; revised `osnova_lekci.md` entry with five outcomes; random slope as an Extra; no null-world simulation; L05 individual crab data eligible in a full Stage 1 search | `Workflow/records/2026-10-21-stage-0-scope.md` | `lesson/l11-scope-data` / #1 merged | Ondřej Mottl |
| 2026-10-21 | Stage 1 | done | Fifteen-example search across nine source families; Ward et al. (2023) froglets from 16 drying tanks locked (CC0, Zenodo mirror of Dryad), with reproducible acquisition, provenance, README and release metadata; L05 crabs kept as a callback | `Workflow/records/2026-10-21-stage-1-dataset.md` | `lesson/l11-scope-data` / #1 merged | Ondřej Mottl |
| 2026-10-21 | Stage 2 | in progress (story map approved by Ondřej Mottl) | 51-row learning-materials story map in six parts (the experiment and its table, how many independent answers, tank as a fixed factor, random intercept, fixed or random, planning one's own study) with a five-step study-design thread and knowledge-state ledger, checked against a numerical rerun on the froglet data; seven open choices decided by the author; image prompts S1-S4 in `Learning_materials/images/GENERATED_IMAGES.md` | `Workflow/records/2026-10-21-stage-2-learning-materials.md` | `lesson/l11-skripta` / PR not opened | Ondřej Mottl |
| 2026-10-22 | Stage 2 | done | `skripta.qmd` drafted in six parts, independently reviewed (lesson vision, glossary coverage) and revised | `Workflow/records/2026-10-21-stage-2-learning-materials.md` | `lesson/l11-skripta` / PR not opened | Ondřej Mottl |
| 2026-10-22 | Stage 3 | done | Written materials approved after two human review batches (violin plot, crab/knotweed bridge, full fixed-factor summary, package choice, model checks, standalone R² sections, conclusion) | `Workflow/records/2026-10-21-stage-2-learning-materials.md` | `lesson/l11-skripta` / #2 merged | Ondřej Mottl |
| 2026-10-22 | Stage 4 | in progress (story map revision 2, PollsLive questions and illustration plan approved by Ondřej Mottl; deck drafted with 67 slides, independent review round 1 resolved; PDF and full-canvas check blocked by DeckTape) | Presentation story map in six parts (66 slides before the proposed cuts, 61 after) with knowledge-state ledger, the five-step study-design thread, five random-intercept visuals chosen from two rounds of web research and a mock-up, L10 PollsLive retrieval proposal (key C–B–A), illustration plan (title image, G1–G6, four reused from the skripta); treatment colours switched to the `_brand` steel blue and terracotta in the skripta too | `Workflow/records/2026-10-22-stage-4-presentation.md` | `lesson/l11-presentation` / PR not opened | Ondřej Mottl |
