# VLA-MethodLab: descriptive case study

Primary technical sources: [VLA-MethodLab](https://github.com/MA-Gustave/VLA-MethodLab) (research method, experiments and evidence) and [VectorPath-RVV](https://github.com/MA-Gustave/VectorPath-RVV) (optimized implementation). VectorPath builds on the upstream simdjson foundation and preserves applicable licences and attributions.

## Completed frozen A2 candidate (18 October 2026)

The later Test 106 is **not** the October 11 E14/VLS256 campaign. Frozen **VectorPath A2 stable** was qualified on two native RISC-V targets using **18 original public JSON files** and **official simdjson 5.0.4 fallback** as comparator. Confirmation-phase, document-equal geometric mean **DOM** speedup was **1.6007× (+60.07%) Cloud-V** and **1.8946× (+89.46%) EPCC**. Across all strata there were **167,835 measurement rows**. Stable reproduces the former A2, passing the frozen-engine gate; each host reports **340/340 JSONTestSuite cases without discrepancy**.

The distinct 95-file tiny-valid stratum regresses to **0.6665× / 0.8497×** vs fallback; optional NL4 fails the Cloud-V non-regression gate. Historical Test 107 is **`ENGINE PASS` with `HOLD_CI_AND_RELEASE_SIGNOFF`**; related CI #78 later ran on x86/default in a separate repository, with no proven RVV memory-safety certification or frozen-source Git tag. See [[Final-Native-Results-2026-10-18]] for source and verification limits.

## Historical exploratory evidence (11 October 2026)

The [11 October 2026 stage profile](https://github.com/MA-Gustave/VLA-MethodLab/blob/main/docs/results/2026-10-11-stage-profile-8h.md) reports the following **paired geometric-mean throughput ratios** for `E14_packed_disabled` relative to the separately compiled official simdjson v5.0.3 VLS256 baseline:

| Measurement path | E14 / official VLS256 |
| --- | ---: |
| Public DOM parsing | **1.502×** |
| Internal Stage 1 | **1.601×** |
| Internal Stage 2 | **1.298×** |

Environment: one native BPI-F3 system, Linux `riscv64`, RVV VLEN=256, GCC 14.2, eight-hour campaign budget. The run contains **6,887 recorded observations** across four compiled configurations and passed its limited correctness gates (169 valid and 24 intentionally invalid JSON inputs).

The earlier [10 October 2026 three-hour exploration](https://github.com/MA-Gustave/VLA-MethodLab/blob/main/results/runs/2026-10-10-engine-library-3h/analysis.md) recorded 2,469 measurements across 17 configurations/controls and reports **1.473× DOM** for E14 versus the official baseline. The two ratios come from distinct campaigns and must not be pooled or interpreted as independent replication.

## Negative results are essential

For escape-heavy strings, the 8-hour report records **0.417× Stage 1**, a substantial regression despite a **1.317× DOM** ratio for that workload family. For Unicode-escaped strings, Stage 1 is **0.818×**. These outcomes matter to subsequent hypothesis formulation and refute any blanket claim that every stage is faster.

## Interpretation and limits

- The historical modified source checkout was **dirty**: the upstream commit alone cannot recreate the exact implementation measured.
- The **historical E14** corpus includes synthetic and reused content on one native hardware/compiler environment; **later Test 106** adds two host/toolchain native checks on a *different* candidate and baseline, not direct replication of E14.
- Repeated trials are correlated; they are not independent software applications or cross-hardware replication.
- Native correctness smoke checks are not a substitute for comprehensive JSON conformance, fuzzing or memory safety analysis.
- Stage 1, Stage 2, and DOM were timed separately; the reported speedup ratios are **not additive**.
- These observations demonstrate performance variation across algorithms and workloads, **not causal evidence that AI orchestration delivered the speedup**.

**Continue:** [[Evidence-and-Limitations]] · [[JSON-Workload-Metadata]]

## Independent governance

The simdjson AI contribution policy requires meaningful human review; it does not prohibit every use of AI. The two projects maintain independent governance and separate conditional software-rights notices. See [[Governance-and-Rights]]. A broader semantic-software roadmap is intentionally not disclosed here.
