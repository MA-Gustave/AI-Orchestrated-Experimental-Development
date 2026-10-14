# Evidence and limitations

The project treats **evidence classification** as part of the research method. Not every statement in the manuscript has the same evidentiary status.

| Classification | What it means | Example |
| --- | --- | --- |
| Recorded observation | Traceable to reports or released measurement files | E14 DOM geometric-mean ratio in the eight-hour study |
| Method description | Public account of procedures and source-code artifacts | Fixed E00–E14 hypotheses and native campaign orchestration |
| Conceptual interpretation | Philosophical and engineering analogy | Automation can shift the human-facing abstraction boundary |
| Untested hypothesis | A prospective mechanism that needs controlled tests | External workload hints improve end-to-end JSON parsing |

## Known limitations

1. **Provenance gap:** a historical dirty source tree cannot be reconstructed merely from an upstream SHA.
2. **Correctness coverage:** successful basic valid/invalid smoke tests do not establish complete conformance or memory safety.
3. **Single hardware environment:** reported native performance depends on one CPU family, VLEN and compiler.
4. **Benchmark sampling:** artificial corpora, repeated inputs and correlated trials constrain generalization.
5. **Negative observations:** workload-specific regressions must appear alongside headline improvements.
6. **No comparative productivity experiment:** the case study contains no controlled time/cost or human-expertise comparison between AI-orchestrated and conventional workflows.
7. **Undemonstrated metadata benefit:** payload profiling via external metadata has not been evaluated as a deployed architecture.

## Evidence audit

Use the main project's [Evidence Ledger](https://github.com/MA-Gustave/AI-Orchestrated-Experimental-Development/blob/main/docs/EVIDENCE_LEDGER.md) and the Lab's [methodology](https://github.com/MA-Gustave/VLA-MethodLab/blob/main/docs/METHODOLOGY.md). Prefer the underlying raw data and verification scripts when available.

**Continue:** [[Research-Questions]] · [[Contributing]]
