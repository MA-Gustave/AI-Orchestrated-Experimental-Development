# Final native evidence — VectorPath-RVV / VLA-MethodLab (18 October 2026)

**Research update prepared 19 October 2026.** This is an interpretation and cross-check of **completed native Test 106** and the **historical read-only Test 107 audit**, not a newly executed native experiment or an independent third-party replication. The working manuscript remains **not peer reviewed**.

## What is final, and what is not

- **Final for the frozen experimental release candidate:** the selected VectorPath-RVV A2 stable configuration and its completed Test 106 native performance and finite conformance gates on Cloud-V and EPCC.
- **Historical Test 107 verdict:** `ENGINE PASS`, **`HOLD_CI_AND_RELEASE_SIGNOFF` / `SHIP HOLD`** at audit time. Later related-repository CI #78 success is subsequent, scoped evidence and does **not** retroactively change that report or automatically authorize distribution.
- **Not established by these archives:** a signed maintainer release decision, an immutable Git tag for these frozen bytes, exact identity between the CI #78 repository and the frozen VectorPath tree, native RVV Valgrind coverage, or any controlled causal productivity benefit from AI assistance.

## Experiment and primary results

The **VectorPath stable** binary uses the RVV-VLA backend, adaptive dispatch **A2 level 2** at **16,384 bytes**, packed paths **off** and the **original Stage 2** decoder. `SIMPLE_RUN` and `NL4` are research-only, not enabled in the stable release. This engine is derived from **simdjson 5.0.3**; the external comparison is against **official simdjson 5.0.4 *fallback*** (not its fastest architecture-specific backend, and not the earlier 5.0.3 VLS256 baseline).

**Primary population:** 18 pinned original public JSON documents (10,075–3,327,831 bytes), Test 106 **confirmation phase** only. For each document, throughput ratios are paired within measured groups; geometric means are then taken with **equal weight per document**. The two hosts are analyzed **separately**.

| Recorded result | Cloud-V (`bpf3-16G-2`, GCC) | EPCC (`rvc02`, Clang 16) |
|---|---:|---:|
| `VP_STABLE / OFFICIAL_504`, DOM | **1.6007× (+60.07%)** | **1.8946× (+89.46%)** |
| `VP_STABLE / OFFICIAL_504`, Stage 1 | 2.0376× | 2.5035× |
| `VP_STABLE / OFFICIAL_504`, Stage 2 | 1.2727× | 1.4687× |
| `VP_STABLE / A2_ORIGINAL`, DOM | **1.00001× (+0.001%)** | **0.99959× (−0.041%)** |
| Worst per-file stable/A2 DOM | 0.9976× | 0.9970× |
| Test 106 rows, all strata/variants | **92,435** | **75,400** |
| Completed rounds | 136 | 111 |
| JSONTestSuite tested cases | **340/340**, no reported disagreements | **340/340**, no reported disagreements |
| Stable-vs-A2 ELF SHA-256 on same host | equal | equal |
| Frozen stable native engine acceptance gate | **PASS** | **PASS** |

**Total recorded measurement rows: 167,835**; the total is **not** a count of independent JSON workloads, users or applications. All 18 public-file stable/fallback ratios exceed 1.0× in both archives. Stage measurements have separate boundaries and must not be added or multiplied to infer DOM.

## Decision rule and negative findings

The previously specified shipping **performance gate** demands stable/A2 document-equal DOM mean **≥0.995×**, with **no public document below 0.980×**, **on each host**. Stable passes, and the old A2 and new stable have **identical ELF hashes within each machine**. `SIMPLE_RUN` satisfies the numerical gate but does not show a consistent cross-host general-purpose improvement. `NL4` **fails on Cloud-V** (overall ~0.9937× and `twitterescaped.json` ~0.9797× vs A2), so neither optional decoder is a release default.

A separate population of **95 valid, very small JSONTestSuite files** (2–110 bytes, median 8 bytes) produced stable/fallback DOM ratios **0.6665× on Cloud-V** and **0.8497× on EPCC**. This is an observed performance regression for tiny inputs, **not a correctness failure**. Dense synthetic escape workloads sometimes benefit from optional Stage 2 optimizations, but these results must not be mixed into the 18-document headline.

JSONTestSuite comprises **95 valid (`y_`), 188 invalid (`n_`), 35 implementation-defined (`i_`) and 22 transformation** cases per host: 340 in all. The report documents zero cross-variant mismatches and zero declared-verdict mismatches. This does **not** establish exhaustive conformance, RISC-V memory safety or universal JSON speedup.

## Provenance and audit boundaries

- The public report, per-document CSV and frozen-source manifest are **supplied project artifacts**. This repository **recomputed** the equal-document geometric means from the **18-row supplied summary CSV** and checked the **five tested C++ SHA-256 hashes** in the supplied frozen VectorPath tree. It **did not** independently rerun native benchmarks or re-audit both original raw archives.
- Local copy of the 18-row source table: [`../evidence/TEST106_Public_18JSON_PerDocument_Results_EN.csv`](../evidence/TEST106_Public_18JSON_PerDocument_Results_EN.csv), SHA-256 `23e538a714d1820d2b6d4711a7569c2999975db5cc8ff5a268686c75eb858283`. It is **derived per-document data**, not the full 167,835-row raw data.
- Pinned public corpus: `simdjson-data` commit `4197c425e857f0ec38e89822fdd0bd9ea21f4daf`; baseline simdjson 5.0.4 commit `3b0b2b53aaffb46208817821dce2cd47a5e6bb2a` (reported in Test 106).
- Pinned Test 106 candidate patch SHA-256: `513dbf6ea2241d469ade18a354e18a77303d66ce9d6794fb8595ee59e01f0388`. The frozen-source manifest matches the five source files in the supplied VectorPath snapshot.
- Original **Cloud-V native evidence ZIP**, SHA-256 `cb0808f0fdc95d2cda99039af78abe8b91349c1d74832254c21df52ac2258168`; original **EPCC native evidence ZIP**, SHA-256 `d670d27d0811c97dae1427921ed19e397046d01c15de830fa447a95d9bd0b25a`. **These two original ZIPs were not provided with this AI-Orch update**, so their archive hashes are *quoted from the provided release manifest*, **not verified against those original archive bytes**.
- Frozen source is a **distribution tree, not a Git tag or commit**. The historical working-tree provenance issue for the *earlier 11 October* E14 campaign remains specific to that campaign; the newer Test 106 frozen-source checks do not repair its missing dirty checkout retrospectively.

## CI #78 is additional, not equivalent proof

The separately maintained [`MA-Gustave/Simdjson-rvv-vla` CI run #78](https://github.com/MA-Gustave/Simdjson-rvv-vla/actions/runs/39155386567), GitHub Actions run `39155386567`, was reported successful on `81c6b1c150a73925894c5f5863d2892cc0a1ec4c` **after** the historical local audit had recorded a hold. It includes x86/default-implementation sanitizer/fuzz and sampled Valgrind replay; the entire Valgrind artifact was **not** examined by the source report. No exact-source match to the frozen VectorPath distribution nor native RVV Valgrind result is established. Do not describe this as a post-hoc `Test 107 PASS` or an unconditional green release gate.

## Relationship to the historical E00–E14 research

The **11 October 2026** BPI-F3 exploration (6,887 rows; E14 vs official **simdjson 5.0.3 VLS256**: 1.502× DOM, 1.601× Stage 1, 1.298× Stage 2) is retained as **historical evidence for the pattern-library research method**. The final **18 October** A2-stable result uses a **different binary, corpus, baseline, target environments and protocol**. These are not a before/after speedup comparison and are not independent replications of the same estimand.

## Primary documents

1. [Test 106 — English final native performance report](https://github.com/MA-Gustave/VectorPath-RVV/blob/main/docs/release/TEST106_PUBLICATION_REPORT_EN.md) and [its 18-document CSV](https://github.com/MA-Gustave/VLA-MethodLab/blob/main/results/releases/test106/TEST106_Public_18JSON_PerDocument_Results_EN.csv).
2. [Test 107 — historical formal release audit](https://github.com/MA-Gustave/VLA-MethodLab/blob/main/results/releases/test107/TEST107_FORMAL_RELEASE_AUDIT_EN.md).
3. [VectorPath frozen-source manifest](https://github.com/MA-Gustave/VectorPath-RVV/blob/main/docs/release/FROZEN_SOURCE_MANIFEST.json) and [release start guide](https://github.com/MA-Gustave/VectorPath-RVV/blob/main/RELEASE_START_HERE.md).
4. [MethodLab wiki — Test 106](https://github.com/MA-Gustave/VLA-MethodLab/wiki/Test-106-Release-Validation) and [Test 107](https://github.com/MA-Gustave/VLA-MethodLab/wiki/Test-107-Formal-Audit).

**Interpretive finding:** the evidence demonstrates a qualified frozen *engine candidate*, a documented multi-stage experimental process and bounded native performance behavior. It does **not** demonstrate that AI assistance caused the performance gains, nor establish the superiority of AI orchestration over expert alternatives.
