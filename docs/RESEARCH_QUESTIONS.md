# Research questions and falsifiable predictions

## RQ1 — Does structured AI orchestration improve exploratory coverage?

**Hypothesis:** with similar human-time budgets, a versioned pattern library and experimental memory allow a human–AI team to investigate more *valid* configurations than unstructured code prompting. **Falsification:** no reliable increase in validated coverage, or gains disappear when setup and verification time are included.

**Study:** compare expert-guided manual exploration, ordinary AI code assistance, and a structured AI-orchestrated lab on several tasks. Randomize task assignments or use a counterbalanced design; pre-register a primary outcome and control for prior expertise.

## RQ2 — What happens to the location of human effort?

**Hypothesis:** less time is spent authoring low-level code, while more time may be spent on experiment design, input selection and validation. **Falsification:** manual implementation time does not decline, or higher-level supervisory costs erase any benefit.

**Measures:** time logs, interventions, code edits, failure recovery, review burden, independent reproduction, compute expense, quality and test validity.

## RQ3 — Are negative experimental results useful as future research memory?

**Hypothesis:** retaining failed and regressive configurations reduces duplicated experiments and improves later proposal quality. **Falsification:** no measurable difference against a condition where only positive results are preserved.

**Design caution:** partition data chronologically and do not use the same benchmarks for both selection and confirmation.

## RQ4 — Are workload-aware JSON parsing policies worthwhile?

**Hypothesis:** certain workload classes favor certain Stage 1 plans enough to justify bounded classification or externally supplied hints. **Falsification:** the overhead outweighs the conditional speedup or generalization fails on held-out documents and hardware.

**Primary comparison:** fixed reference, trained fixed plan, bounded internal dispatch, out-of-band metadata and oracle bound. Report every class, negative cases and total cost.

## RQ5 — What can be verified without exposing confidential workflow instructions?

**Hypothesis:** disclosed source, benchmark artifacts and protocol are enough to substantiate software-performance observations even when specific author prompts are private. **Boundary:** this does **not** support causal attribution of outcomes to the secret prompt design itself.

**Study:** independent teams attempt replication using only public artifacts. Record whether differences arise from missing build provenance, incomplete instructions or hardware mismatch.

## Methodological non-goals

- No assertion that AI code is categorically better than expert human code.
- No assertion that programming as a profession is obsolete.
- No claim of a fully autonomous optimization loop where experiments remain human-approved.
- No proposal that JSON metadata may override syntax or validation rules.
