# Optional JSON workload metadata — research hypothesis

**Hypothesis, not an implemented standard.** Different JSON workloads can favor different implementation strategies. If an application knows stable characteristics of its payloads, passing a cheap external description to a parser might reduce internal classification cost or avoid poor routing decisions.

## Candidate comparisons

| Strategy | Additional assumption |
| --- | --- |
| Fixed general-purpose plan | No workload information |
| Bounded in-parser classifier | Sample or inspect JSON content |
| Out-of-band profile hint | Profile supplied separately by a producer or application |
| Hybrid fallback | Trust hints only as performance suggestions, not correctness guarantees |
| Offline oracle | An upper-bound comparator, **not a deployable engine** |

A profile might describe structural density, string/number distribution, escape density, raw UTF-8 prevalence or document size. An implementation should define what these features mean quantitatively before benchmarking.

## Correctness and interoperability

- The JSON validity rules remain those of [RFC 8259](https://www.rfc-editor.org/rfc/rfc8259); no profile may bypass parsing or UTF-8 validation.
- An arbitrary `_meta` field inside application JSON is **not** an interoperable default; it changes the payload and may alter schemas.
- Incorrect, stale or adversarial hints require a safe fallback and must not change parse results.
- All end-to-end measurements must include the cost of generating, storing, transporting, reading and interpreting the profile.
- The chosen plan depends on the target CPU and implementation, not only document contents.

## Falsifiable test

Hold out unseen corpora; compare both correctness and end-to-end latency for fixed, internal, metadata-driven and hybrid approaches on at least two target environments. Measure tiny documents separately: dispatch overhead may dominate there. Include deliberately misleading profiles.

The existing E00–E14 results motivate this experiment but **do not establish** that external metadata improves throughput.

**Continue:** [[Research-Questions]] · [[Evidence-and-Limitations]]
