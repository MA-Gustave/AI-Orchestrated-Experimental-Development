# Evidence and limitations

The project treats **evidence classification** as part of the research method. Not every statement in the manuscript has the same evidentiary status.

| Classification | What it means | Example |
| --- | --- | --- |
| Recorded observation | Traceable to reports or released measurement files | E14 DOM geometric-mean ratio in the eight-hour study |
| Method description | Public account of procedures and source-code artifacts | Fixed E00–E14 hypotheses and native campaign orchestration |
| Conceptual interpretation | Philosophical and engineering analogy | Automation can shift the human-facing abstraction boundary |
| Untested hypothesis | A prospective mechanism that needs controlled tests | External workload hints improve end-to-end JSON parsing |

## Known limitations

1. **Historical E14 provenance gap:** the 11 October dirty source tree cannot be reconstructed merely from an upstream SHA; this does **not** negate the separately frozen Test 106 A2 candidate, nor does it permit retroactive source reconstruction.
2. **Finite correctness coverage:** Test 106 reported 340/340 JSONTestSuite cases without discrepancies **on both native hosts**; this does not establish complete conformance or native RVV memory safety.
3. **Platform scope:** Test 106 tested two native RISC-V hosts with different compilers (Cloud-V GCC and EPCC Clang 16), not a factorial multi-VLEN or independent productivity study. The earlier E14 study used one BPI-F3 target.
4. **Sampling and baseline:** 18 pinned public documents compared against **official 5.0.4 fallback**, not every upstream implementation; synthetic and tiny workloads must remain separate. Repeated trials are correlated.
5. **Negative observations:** workload-specific regressions must appear alongside headline improvements.
6. **No comparative productivity experiment:** the case study contains no controlled time/cost or human-expertise comparison between AI-orchestrated and conventional workflows.
7. **Undemonstrated metadata benefit:** payload profiling via external metadata has not been evaluated as a deployed architecture.
8. **Explicit negative result:** 95 tiny valid JSONs have stable/fallback ratios of 0.6665× / 0.8497×, and opt-in NL4 fails the Cloud-V per-file regression gate.
9. **Audit vs release authorization:** historical Test 107 says `ENGINE PASS` **and** `HOLD_CI_AND_RELEASE_SIGNOFF`; later related x86 CI #78 cannot change that archived decision or certify native RVV Valgrind.
10. **Local verification scope:** AI-Orch recomputed only a supplied **18-row derivative CSV** and checked five frozen C++ SHA-256 hashes; it did not receive original Test 106 raw ZIPs or run native benchmarks.

## Evidence audit

See [[Final-Native-Results-2026-10-18]], the main project's [Evidence Ledger](https://github.com/MA-Gustave/AI-Orchestrated-Experimental-Development/blob/main/docs/EVIDENCE_LEDGER.md) and the Lab's [methodology](https://github.com/MA-Gustave/VLA-MethodLab/blob/main/docs/METHODOLOGY.md). Prefer the underlying raw data and verification scripts when available.

**Continue:** [[Research-Questions]] · [[Contributing]]
