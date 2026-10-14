# Automation and abstraction

## The relevant progression

This project does not assert a single linear history of computation. It identifies recurring transitions in *what must be controlled explicitly*:

| Transition | Human-facing level | Delegated technical work |
| --- | --- | --- |
| Mechanized/electronic calculation | Operations and procedures | Repeated arithmetic and physical switching |
| Compilers | Source-level program descriptions | Translation into machine instructions |
| Model-driven engineering | Models, constraints, and transformations | Portions of implementation generation |
| Program synthesis and AI coding | Intent, examples, specifications, reviews | Candidate program construction |
| Experimental orchestration | Hypotheses, criteria, decisions | Building variants, collecting evidence, drafting analyses |

The last step is the project's subject, **not a completed transition across all software engineering**.

## Why verification grows in importance

A higher-level interface can hide implementation details while leaving correctness and security obligations intact. In scientific software, the operator must still address:

- the provenance of code and datasets;
- equivalence of measurements and fair comparison;
- failures, regressions, and statistical dependence;
- the risk of inaccurate AI-generated summaries;
- the scope of the conclusions.

Useful related work includes [model-driven engineering](https://doi.org/10.1109/MC.2006.58), [program synthesis](https://doi.org/10.1561/2500000010), [OpenTuner](https://doi.org/10.1145/2628071.2628092), [FunSearch](https://doi.org/10.1038/s41586-023-06924-6), and [AlphaEvolve](https://arxiv.org/abs/2506.13131).

**Continue:** [[Experimental-Method]] · [[Glossary]]
