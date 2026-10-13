# Evidence and limitations

The research separates **measured observation**, **conceptual interpretation**, **operator report**, and **untested hypothesis**. A project's public README is a primary source for its own experiments, but not independent scientific validation of them.

## Key limits to disclose

- The historical native benchmark source was a modified checkout: its upstream SHA does not identify the exact measured code alone.
- Basic valid/invalid JSON smoke tests do not establish full conformance or memory safety.
- One CPU/compilation environment does not establish cross-platform behavior.
- Exploratory wins can reflect selection bias. Negative workload cases must remain visible.
- Stage 1, Stage 2 and DOM timings are independent measurement paths; do not add reported ratios.
- Current evidence cannot establish that AI orchestration caused a given performance gain or saved development time.
- No tested implementation establishes benefits from external JSON workload profiles yet.

The main repository hosts an [Evidence Ledger](https://github.com/MA-Gustave/AI-Orchestrated-Experimental-Development/blob/main/docs/EVIDENCE_LEDGER.md) with links to each technical source and claim type.

**Next:** [[Reading-List]] · [[Contributing]].
