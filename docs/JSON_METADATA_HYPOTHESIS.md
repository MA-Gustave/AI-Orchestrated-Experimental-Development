# Research hypothesis: optional workload profiles for JSON engines

**Status:** speculative design and proposed evaluation. **Not a JSON standard. Not demonstrated by the published RVV-VLA benchmarks.**

## Motivation

JSON documents differ in byte size, structural density, escaped strings, raw UTF-8, number frequency, nesting and other features. Different specialized parsing strategies may respond differently to these characteristics. A fixed implementation, a bounded internal pre-scan and a pre-existing external profile have different overheads and error modes.

## Proposed interface

The first prototype should be an **optional, out-of-band descriptor** (a sidecar, metadata in an application transport, or a precomputed schema-level hint), not an unannounced `_meta` property inserted into business JSON. A payload must retain its application-defined meaning; RFC 8259 does not specify performance metadata.

See [example JSON workload profile](../examples/json-workload-profile.example.json). Values are illustrative only. The `preferred_plan` is a hint, not a command to execute an unsafe algorithm.

## Possible architectures

| Mode | Benefit | Risk |
|---|---|---|
| Fixed engine | No classification step | Poor match to heterogeneous workloads |
| Internal bounded profiling | No external contract | Classifier cost, early-sample bias |
| External profile | Possible reduced classification cost | Upstream profiling cost, stale or untrusted hint |
| Hybrid | Graceful fallback | More code paths and complexity |

## Correctness and security invariants

- The JSON parser, not the profile, determines JSON validity.
- Unknown, stale or contradictory profiles must safely fall back to a supported engine.
- Workload hints must not disable UTF-8 validation, control-character checks, boundary handling or required error behavior.
- Profiles must not be able to select an incompatible or uncompiled implementation.
- Resource costs must be bounded; the system must accept missing metadata without rejecting otherwise-valid JSON.
- A profile version and optional digest should prevent accidental association with the wrong payload.

## Proposed experiment

1. Split workloads into development, validation and previously unseen held-out sets before tuning.
2. Measure engine-fixed baselines and bounded internal classification against an official comparator.
3. Generate sidecar metadata and account for *all* creation, storage, transmission and dispatch overhead relevant to the deployment scenario.
4. Compare the external-hint approach to internal profiling and to a training-only chosen fixed engine.
5. Display an offline 'oracle' best-plan selection as an unattainable upper reference, **not** a deployable result.
6. Evaluate document sizes from tiny to large, misplaced features, adversarial hints, UTF-8, escaping and input invalidity.
7. Replicate on multiple vector lengths, with GCC and Clang when available.

## Suggested metrics

- End-to-end latency and throughput, per document and per workload family.
- Absolute dispatch and profiling overhead, including metadata supply cost.
- Incorrect plan selections by performance impact, without treating validity classification as negotiable.
- Geometric mean of paired performance ratios plus workload-level dispersion and worst regressions.
- Correctness, build failures, reproducibility, memory use and hardware compatibility.

## Falsification conditions

If the metadata cost exceeds the saved internal classification cost, if profile drift yields frequent regressions, or if deployment contracts cannot guarantee useful feature signals, the proposal may provide no advantage. Negative findings would still clarify where profile-aware specialization is and is not justified.
