# VLA-MethodLab case study: measurements as evidence of method

## Source projects

- [VLA-MethodLab](https://github.com/MA-Gustave/VLA-MethodLab) — experimental method, orchestration, candidate patterns, test definitions and recorded evidence.
- [VectorPath-RVV](https://github.com/MA-Gustave/VectorPath-RVV) — RVV-VLA implementation and engine development.
- [Original simdjson](https://github.com/simdjson/simdjson) — upstream foundation; acknowledge its authors and licences.

## What was constructed

The publicly described engine-library experiment extends simdjson 5.0.3 using an RVV Stage 1 implementation, per-document workload profiling, sparse/word-mask/vector extraction choices, escaping and string-specific paths, and an optional Stage 2 prefetch hook. The generic Stage 2 algorithm is not replaced. A native benchmark harness can compile fixed candidates and collect separate Stage 1, Stage 2 and DOM observations.

The pattern catalogue enumerates 15 hypotheses, E00–E14, plus comparison configurations in experiment campaigns. E14 disables selected packed-control/index paths in a workload-aware plan. It must not be described as a general-purpose universal winner.

## Historically reported native results

| Study | Observations | E14 vs official simdjson VLS256 | Boundary |
|---|---:|---|---|
| 10 Oct 2026, 3-hour fixed candidate grid | 2,469 | DOM **1.473×** | Exploration, limited controls |
| 11 Oct 2026, 8-hour stage-profile campaign | 6,887 | DOM **1.502×**, Stage 1 **1.601×**, Stage 2 **1.298×** | Specific corpora/hardware and paired throughput ratios |

Conditions documented by the laboratory: BPI-F3 with RISC-V Vector 1.0, VLEN=256, GCC 14.2; CPU affinity and within-trial median measurements; Stage 1, Stage 2 and DOM observed as separate calls. The official comparator is simdjson VLS256, compiled separately, version 5.0.3, upstream SHA `bf89ddd00ef5fcb6a7f20611ea8853d258b67249`. The historical measurements are *reported by the project*, not replicated independently in this manuscript repository.

## Negative and ambiguous observations matter

A workload rich in string escapes reportedly produced an E14 Stage 1 ratio near **0.417×** relative to the official comparator even when the same workload's DOM ratio differed. This is not inconsistent: the Stage APIs are different measurements and do not add up arithmetically to a DOM call. The lesson is that an aggregate ranking can hide important stage-specific regressions.

## Provenance and validity limits

1. The historical native experiments ran from a modified working tree. Its base upstream SHA does not uniquely identify the modified source. A clean, archived reconstruction of the tested snapshot is needed for strongest reproducibility claims.
2. The documented correctness gates cover a finite set of valid and invalid inputs, including meaningful UTF-8 cases, but do not establish exhaustive JSON compliance or memory safety.
3. Some input families are synthetic, and small/large data may reuse content. Repeated measurements are not independent workload samples.
4. Results are from a limited hardware environment; VLEN-agnostic intent does not establish equal behavior or performance on all vector lengths.
5. Later adaptive and broader protocols (e.g., A1/A2 and multi-corpus prequalification) must be reported as proposed, locally checked or native-tested **according to the evidence available for each run**, never promoted from a plan to a finding.

## Why this belongs in a methods paper

The lab produces a series of named, executable hypotheses, not simply an implementation whose final benchmark happens to be fast. The retained matrix, scripts, reports, source caveats and failures permit study of how a human-directed, AI-assisted experimental process is organized. Evidence of this process is distinct from proof that it is superior to other development methods.

## Read the original study

- [Study report](https://github.com/MA-Gustave/VLA-MethodLab/blob/main/docs/results/2026-10-11-stage-profile-8h.md)
- [Pattern catalogue](https://github.com/MA-Gustave/VLA-MethodLab/blob/main/experiments/PATTERN_LIBRARY.md)
- [Methodology](https://github.com/MA-Gustave/VLA-MethodLab/blob/main/docs/METHODOLOGY.md)
- [Adaptive v2 notes](https://github.com/MA-Gustave/VLA-MethodLab/blob/main/docs/ADAPTIVE_DISPATCH_V2.md)

The original artifacts, including their own disclosures and corrections, take precedence over quotations in this interpretive repository.

## Project governance and future research

The independently governed engine and laboratory remain separate from upstream simdjson. The original software retains its licences, and no new right to integrate qualifying restricted additions is granted by this case study. A broader semantic-software direction is discussed only at a nontechnical level; the roadmap is nonpublic. See [Independent research governance](INDEPENDENT_GOVERNANCE_AND_ROADMAP.md).
