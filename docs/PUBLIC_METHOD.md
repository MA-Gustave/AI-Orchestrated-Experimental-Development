# Public method: an AI-assisted experimental research loop

## Purpose and boundary

This document describes the reproducible *shape* of the workflow without revealing private prompts, personal orchestration tactics or credentials. Its output is an auditable research process, not a guarantee that an AI model's suggestions are correct.

## Phase 0 — Stabilize infrastructure

Establish software baselines, compiler flags, target architecture, deterministic corpora, access controls, source snapshots and verification scripts. Record the remote CPU and vector-length characteristics; define memory, storage and execution limits. Avoid comparing measurements from different harnesses as though they shared identical conditions.

**Output:** environment manifest and an identifiable source tree.

## Phase 1 — Collect hypotheses as patterns

Ask the AI to research possible performance-related strategies. Each pattern requires an identifier, a concise mechanism, affected stage, expected benefit, expected risk and proposed control. The operator need not understand every machine instruction, but the hypothesis must be stated so its implementation and effect can be tested.

**Output:** a versioned, revisable pattern catalogue.

## Phase 2 — Build a finite experimental matrix

Compose selected patterns into candidate configurations. In the published RVV-VLA corpus, E00–E14 are 15 **predeclared, fixed** candidates. Changes in `SIMDJSON_RVV_FORCE_PLAN` or other flags require separate builds, with the same flags applied to the library and benchmark. Their selection is not an evolving optimizer automatically choosing combinations from observed wins.

**Output:** candidate IDs, compile flags, checksums and a frozen matrix.

## Phase 3 — Validate before measuring

Use native compilation and correctness gates before throughput comparisons. Invalid JSON must remain invalid; escaping, control characters, actual multibyte UTF-8, chunk boundaries, short documents and streaming behavior require attention. A smoke test is not proof of complete JSON conformance.

**Output:** pass/fail records with diagnostic logs; failed candidates are not ranked as successful.

## Phase 4 — Explore broad workloads

Test diverse input families and sizes, including numerical, structural, text-heavy, escaped and raw UTF-8 cases. Monitor throughput and regression patterns; retain low and high outliers. Exploratory scans generate hypotheses; their highest results are not unbiased estimates of future performance.

**Output:** measurements linked to phase, corpus, iteration count, trial, software ID and target hardware.

## Phase 5 — Generate reports and preserve experimental memory

AI-assisted reports can explain patterns, compare multiple runs and propose further experiments. Retain the raw measurements, metadata and verification scripts as the canonical evidence. A narrative produced by a language model requires fact checking before it is promoted into a research claim.

**Output:** readable technical report, raw data, negative results, unresolved questions.

## Phase 6 — Re-test on held-out cases

Before making a performance claim, freeze the proposed selection policy; test on workloads not used to choose it; compare against separately compiled baselines. Include input profiling and dispatch overhead in total parsing cost. Ideally replicate on another RISC-V device and compiler.

**Output:** confirmatory evidence with conditions and confidence limits.

## Human and automation responsibilities

| Human responsibilities | AI / tool-assisted responsibilities |
|---|---|
| Define objective and acceptable risks | Propose patterns and generate candidate code |
| Approve experiments and machine usage | Build scripts, run approved jobs, collect logs |
| Decide what counts as valid evidence | Summarize measurements and possible explanations |
| Audit attribution, correctness and security | Help assemble documentation and comparison tables |
| Interpret limitations and publish | Prepare draft artifacts subject to verification |

This is not a claim that the operator never reviews code, or that an AI may autonomously deploy unsafe changes. Work must remain recoverable, monitored and attributable.

## Extension point

Other researchers can improve the pattern library, develop more accurate workload classifiers, supply held-out datasets, validate hardware portability or study the actual cost of this method compared with conventional expert-led development.
