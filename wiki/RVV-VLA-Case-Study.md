# RVV-VLA-Lab case study

[RVV-VLA-Lab](https://github.com/MA-Gustave/RVV-VLA-Lab) provides the native benchmark, pattern matrix, experiment orchestration and reports. [Simdjson-rvv-vla](https://github.com/MA-Gustave/Simdjson-rvv-vla) documents the related backend development. Both depend on original simdjson technology that must be acknowledged separately.

## Historically reported results

| E14 versus official simdjson VLS256 | Ratio |
|---|---:|
| DOM throughput, 11 October 2026 study | **1.502×** |
| Stage 1 throughput | **1.601×** |
| Stage 2 throughput | **1.298×** |

The study reports 6,887 observations on one BPI-F3 RISC-V Vector system (VLEN=256) with GCC 14.2. Other recorded workloads exhibit regressions, including a Stage 1 ratio around 0.417× for heavily escaped strings.

**Limits:** source came from a modified working tree; finite correctness coverage; partially synthetic corpora; no universal portability claim. These values are distinct performance measurements, not additive speedup components, and have not been independently reproduced in this wiki.

Read: [Case Study](https://github.com/MA-Gustave/AI-Orchestrated-Experimental-Development/blob/main/docs/RVV_VLA_CASE_STUDY.md) and [Lab methodology](https://github.com/MA-Gustave/RVV-VLA-Lab/blob/main/docs/METHODOLOGY.md).

**Next:** [[JSON-Workload-Metadata]] · [[Evidence-and-Limitations]].
