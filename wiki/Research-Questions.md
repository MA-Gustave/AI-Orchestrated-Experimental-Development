# Research questions and evaluation plan

This wiki separates an observed project from hypotheses that could be tested prospectively.

## RQ1 — Research capacity

**Question:** Does AI-assisted orchestration change how many distinct valid hypotheses an operator can implement and evaluate under a fixed effort budget?

**Needed evidence:** a preregistered, task-matched study measuring elapsed time, operator interventions, valid candidates, correctness failures, cost of inference and compute, and quality of conclusions. VLA-MethodLab alone does not answer this question.

## RQ2 — Memory and negative evidence

**Question:** Does a persistent pattern library with structured reports reduce rediscovery and avoid repeating invalid experiments?

**Needed evidence:** compare research sessions with and without structured evidence retrieval; record repeated hypotheses and validation errors.

## RQ3 — Specialized engine selection

**Question:** Do reliable workload features justify changing Stage 1 execution plans?

**Needed evidence:** held-out JSON workloads with input statistics, a fixed baseline, bounded classifier, and reporting of family-level regressions.

## RQ4 — External metadata

**Question:** Is a supplied workload profile cheaper and more robust than internal profiling once full system overhead is included?

**Needed evidence:** producer-side costs, transit costs, profile trust checks, data validity checks, misclassification and CPU-portability effects.

## RQ5 — Reproducibility

**Question:** Can an independent team reproduce the recorded native performance ranking from fully pinned source and data artifacts?

**Needed evidence:** exact code snapshots, build scripts, corpus hashes, native environment details and a separate hardware or compiler result.

**Continue:** [[Publication-and-Citation]] · [[Contributing]]
