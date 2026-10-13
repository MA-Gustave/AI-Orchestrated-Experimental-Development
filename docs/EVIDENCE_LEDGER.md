# Evidence ledger

This document separates sources, observations, interpretations and future proposals. It is not a substitute for raw data or independent verification.

| ID | Statement | Evidence type | Primary source | Critical qualification |
|---|---|---|---|---|
| E-01 | RVV-VLA-Lab publicly describes 15 fixed E00–E14 engine candidates. | Source/document evidence | [Pattern library](https://github.com/MA-Gustave/RVV-VLA-Lab/blob/main/experiments/PATTERN_LIBRARY.md) | Fixed plans; not autonomous evolutionary optimization. |
| E-02 | 3-hour campaign reports 2,469 measurements and E14 DOM 1.473× versus official VLS256. | Project-reported benchmark | [Lab README](https://github.com/MA-Gustave/RVV-VLA-Lab) and study data | Limited corpus and method conditions. |
| E-03 | 8-hour campaign reports 6,887 records; E14 DOM 1.502×, Stage 1 1.601×, Stage 2 1.298×. | Project-reported benchmark | [Stage profile](https://github.com/MA-Gustave/RVV-VLA-Lab/blob/main/docs/results/2026-10-11-stage-profile-8h.md) | Paired geometric throughput ratios, not universal or independently replicated here. |
| E-04 | At least one heavily escaped-string workload had a substantial E14 Stage 1 regression. | Project-reported benchmark | [Stage profile](https://github.com/MA-Gustave/RVV-VLA-Lab/blob/main/docs/results/2026-10-11-stage-profile-8h.md) | Stage 1 and DOM have distinct measurement boundaries. |
| E-05 | Historical tests used a dirty working-tree source checkout. | Provenance limitation | [Methodology](https://github.com/MA-Gustave/RVV-VLA-Lab/blob/main/docs/METHODOLOGY.md) | An upstream commit SHA alone is insufficient to reproduce binaries. |
| E-06 | Correctness gates were finite; full conformance is not established. | Test-scope limitation | [Methodology](https://github.com/MA-Gustave/RVV-VLA-Lab/blob/main/docs/METHODOLOGY.md) | Broader fuzzing and boundary checks required. |
| E-07 | Generative AI assisted the operator with pattern exploration, implementation and reports. | Author account plus project artifacts | [Public method](PUBLIC_METHOD.md), source repositories | Not a controlled estimate of causal productivity effects. |
| E-08 | Some organized systems can act as components in higher-level organization. | Conceptual interpretation | Aristotle, Simon (see [references](../references/REFERENCES.md)) | Analogy and theoretical framing, not experiment. |
| E-09 | Out-of-band JSON workload hints could reduce dispatch overhead. | Proposed hypothesis | [Research design](JSON_METADATA_HYPOTHESIS.md) | No established performance advantage yet. |
| E-10 | AI-driven orchestration is superior to expert manual coding. | **Not established** | [Evaluation design](RESEARCH_QUESTIONS.md) | Requires a controlled multi-task study. |

## Source-freeze requirements

Before a formal performance-centered publication, record exact Git commit IDs for the article, lab, backend, benchmark worker, compiler, target kernel, source archive, corpus and generated report. Use a frozen GitHub Release and (optionally) DOI-bearing archive. A date stamp or repository name alone does not authenticate the historical dirty checkout.

## Maintenance rule

For every revision, document *what changed*, *which claim it affects*, *why the source supports the new language*, and any remaining uncertainty. In a conflict, the primary measurement and versioned evidence take precedence over a summary.
