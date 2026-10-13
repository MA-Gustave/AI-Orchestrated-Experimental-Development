# Glossary

| Term | Meaning in this project |
|---|---|
| **Abstraction boundary** | The point at which a user interacts with a composed system through a representation rather than manipulating all of its internals. |
| **Automation-driven abstraction shift** | Provisional name for relocating human work toward higher-level specification, orchestration and evaluation as technical tasks become automatable. |
| **Hylomorphism** | Aristotle's theory relating matter and form, used here as a qualified philosophical analogy for composition. |
| **Near-decomposable system** | Hierarchical system with relatively stable interactions among subsystems, in Simon's sense. |
| **Pattern** | Candidate optimization technique or hypothesis, not a performance guarantee. |
| **Engine plan** | Concrete configuration of parser behaviors selected or compiled for an experiment. |
| **Stage 1 / Stage 2** | simdjson phases involving structural indexing and subsequent document-building operations; benchmarks may expose separate internal timings. |
| **DOM** | Document Object Model parsing path, measured separately from internal stage metrics. |
| **RVV** | RISC-V Vector extension. |
| **VLA** | Vector-length agnostic; design not hard-coded to one architectural vector length. |
| **VLS256** | Fixed-width simdjson RISC-V reference implementation used in described comparisons. |
| **Workload profile** | Performance-relevant description of input characteristics, not a correctness assertion. |
| **Sidecar metadata** | Optional description stored outside a JSON payload, preserving its application semantics. |
| **Hold-out set** | Dataset withheld from candidate selection for subsequent confirmation. |
| **Geometric mean ratio** | Multiplicative aggregation of matched performance ratios; does not imply improvement on every input. |
| **Dirty checkout** | Working tree with modifications not identified solely by the base version-control commit. |
| **Research memory** | Versioned record of experimental configurations, successes, failures and interpretations. |
