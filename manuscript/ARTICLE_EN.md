# Beyond Writing Code: AI-Orchestrated Experimental Development and the Automation of Complexity

> **Published preprint (20 October 2026):** Gustave Leblanc, *Beyond Writing Code: Automation-Driven Abstraction Shifts in AI-Orchestrated Experimental Software Development*, Zenodo v1, DOI [10.5281/zenodo.23503438](https://doi.org/10.5281/zenodo.23503438). This Markdown manuscript is an earlier/living research text and is not a byte-identical copy of the deposited PDF; cite the Zenodo record for the published version. The preprint has not been peer reviewed.

**Working manuscript · revised 19 October 2026 with final native evidence from 18 October · Not peer reviewed**  
**Author:** Gustave (public project identity; final academic byline to be confirmed)  
**Project:** Abstract Mechanisms  
**Research artifacts:** [VLA-MethodLab](https://github.com/MA-Gustave/VLA-MethodLab) and [VectorPath-RVV](https://github.com/MA-Gustave/VectorPath-RVV)

## Abstract

See [Abstract](ABSTRACT_EN.md). The objective of this manuscript is to formalize a research method and conceptual claim, *not* to announce a parsing performance record.

## 1. Introduction — shifting the work, not abolishing complexity

Software development includes activities that must be distinguished: specifying a problem, designing an architecture, expressing an implementation, checking correctness, measuring behavior, interpreting evidence, and deciding what to attempt next. Historically, these tasks have moved between people and technical systems. Mechanical calculation, electronic computing, high-level languages, compilation, models, automated testing, program synthesis and generative AI do not form an inevitable ladder. They nevertheless provide examples of operations once handled explicitly being delegated to a new technical layer.

In certain contexts, generative AI makes it practical for a person to describe a system and coordinate a development process without authoring each low-level implementation. That capability raises a question distinct from code-generation quality: **what can a person organize and investigate when the details of implementation are partly managed by an automated system?** It also raises a complementary question: **which burdens reappear in specification, supervision, diagnosis and verification?**

This paper proposes the provisional notion of an *automation-driven abstraction shift*: an observed or hypothesized relocation of the point at which human activity meets the technical complexity of a system. The expression is a proposed analytical label, not a claim that a new universal law has been established or that nobody has previously studied related ideas. Hierarchical organization, human–computer symbiosis, end-user development, synthesis and algorithm selection are established research areas.

The case study is a public, independent experimental laboratory for vector-length-agnostic RISC-V JSON parsing. Its principal significance here is the method of working: the human operator designs an experimental program, an AI assists with candidates and artifacts, compiled implementations are run against real constraints, and recorded results guide subsequent questions. The operator reports not possessing detailed mastery of every low-level optimization candidate; the research question is whether a sufficiently instrumented workflow can make such exploration tractable while preserving validation.

## 2. Conceptual framework: organization, form and abstraction

### 2.1 Aristotle as an analogy, not a computing theory

Aristotle's account of matter and form treats a concrete object as organized matter rather than as an unordered collection. Matter can be *relative*: a brick, already the result of a prior organization of clay, may become a constituent of a wall. The point relevant here is compositionality. A previously organized whole can function as a component at another level of description. This is a philosophical analogy; it is neither a quantitative theory of software complexity nor evidence that Aristotle anticipated artificial intelligence. See *Metaphysics* VII–IX and the Stanford Encyclopedia of Philosophy's entry on form and matter.

### 2.2 Simon's hierarchies and Engelbart's augmenting systems

Herbert Simon's *Architecture of Complexity* (1962) provides a closer modern basis for systems assembled from interacting subsystems. Douglas Engelbart (1962) treats tools, languages, methods and human capabilities as parts of an augmenting system. The relevant principle is not that components disappear, but that a higher-level activity can coordinate previously organized components.

### 2.3 Licklider's symbiosis and the limits of delegation

Licklider (1960) envisaged a collaboration in which people formulate goals, hypotheses and evaluations while machines perform much routine work. Later research explicitly analyzes levels and types of automation (Parasuraman, Sheridan and Wickens, 2000). Bainbridge (1983) documents an opposing effect: automation can leave humans with the least routine and hardest-to-diagnose failures. Brooks (1987) distinguishes essential problem complexity from tool-related complexity. Together, these works suggest that automation *relocates* burdens; it does not guarantee their disappearance.

### 2.4 Levels of representation are not simply levels of intrinsic complexity

A high-level interface can be easier for its operator and simultaneously rely on a much more complicated internal system. Therefore, the phrase *higher level of complexity* must be handled carefully. In this article, *higher-level abstraction* means an interface or representation that manipulates composed systems as units. Complexity may be transferred, compressed in representation, or hidden from view; none of these automatically implies that the total system has become simpler or safer.

## 3. Related work: the boundaries of novelty

Model-driven engineering (Schmidt, 2006), end-user development (Lieberman, Paternò and Wulf, 2006), and program synthesis (Gulwani, Polozov and Singh, 2017) demonstrate that generating executable behavior from higher-level intentions predates modern language models. Rice (1976) formulated algorithm selection as a function of instance characteristics. Empirical autotuning frameworks such as OpenTuner (Ansel et al., 2014) search configuration spaces through measurement.

More recently, ChatDev (Qian et al., 2024) explores communicative development agents; FunSearch (Romera-Paredes et al., 2024) uses language-model-driven program search with an evaluator; and AlphaEvolve (Novikov et al., 2025, preprint) explores coding proposals through evaluations and evolutionary search. These systems are closer technical precedents for automated hypothesis generation and iterative evaluation. The paper therefore does **not** claim to have invented automatic program generation, systematic testing or algorithmic optimization.

The narrower contribution to examine is a **human-directed experimental workflow** in which a non-specialist in some implementation details coordinates a library of candidate strategies, validation tools and retained reports. It remains an empirical question whether that workflow compares favorably with skilled manual development and on which kinds of task.

## 4. Public method: an instrumented research loop

### 4.1 Make the instruments stable

The operator first needs identifiable source versions, reproducible compilation parameters, target-machine information, resource constraints, input sets, test gates and auditable outputs. Changes to any of these can invalidate a comparison. Stable infrastructure is a prerequisite for taking exploratory measurements seriously.

### 4.2 Generate and document optimization patterns

An AI is asked to investigate and propose patterns likely to matter for performance. The resulting library is not a catalogue of demonstrated truths: each entry is an engineering hypothesis with potential interactions and failure modes. The operator may not personally know the instruction-level details of each item. The research task becomes to specify tests and evaluate evidence rather than to trust a description of the pattern.

### 4.3 Combine patterns into concrete candidates

The public RVV-VLA pattern library defines **15 fixed configurations**, E00–E14. They include baseline, density, numeric, text, escaping, UTF-8 and index-extraction hypotheses, along with negative controls. These candidates are compiled separately under fixed flags. It would be inaccurate to characterize the recorded study as an autonomous genetic search or as runtime switching between unrelated compiled binaries. The system has workload-aware plan selection in specific implementations, but the original candidate matrix is declared in advance.

### 4.4 Test broadly, then test hypotheses separately

Broad exploratory campaigns are useful for discovering surprising outcomes, workload interactions, and failures. Exploration, however, does not justify treating the largest observed gain as a general law. Confirmatory studies should freeze the candidate policy, reserve held-out data, repeat under controlled conditions and report uncertainties and regressions alongside benefits. The project includes documented benchmark rules and correctness gates, but not all intended independent replications have been completed.

### 4.5 Retain the failures and build a research memory

AI-generated reports can organize completed runs, compilations, rejections, graphs, test conditions and unresolved questions. Their value is twofold: readable human documentation and context for subsequent AI-assisted work. Reports are not themselves primary evidence. Raw data, hashes, code revisions and independently checkable verification scripts take priority over narrative summaries. A failed campaign should remain visible rather than silently disappearing from the history.

### 4.6 Confidential workflow and the boundary of the paper

Parts of the author's prompts and internal orchestration process remain private. This article discusses public principles and observable experimental artifacts. It therefore does not claim to measure the intrinsic superiority of a hidden procedure. If a future causal claim depends on reproducibility of that exact procedure, further disclosure or an independent protocol will be necessary. The author's responsibility for publication, source attribution and error correction is not delegated to the AI.

## 5. VLA-MethodLab: an empirical case study

The laboratory is based on an experimental modification of simdjson 5.0.3 for RISC-V Vector. It includes Stage 1 structural scanning components, Stage 2 integration with a generic tape builder, multiple candidate engine plans, native benchmarking, a remote orchestration layer and results-verification artifacts. The main scientific interest for this paper is the *existence and traceability of the experimental process*, not a claim that every planned engine is production-ready.

The public documentation reports a native study on a BPI-F3, `riscv64`, RVV 1.0, `VLEN=256`, with GCC 14.2 and an official, separately compiled simdjson VLS256 reference. The 11 October 2026 stage-oriented campaign contains 6,887 observations and, for plan E14 on the tested corpora, paired geometric mean throughput ratios of **1.502× for DOM**, **1.601× for Stage 1** and **1.298× for Stage 2**. These are distinct measurements and not additive components of a DOM call. They cannot be generalized across CPUs, compilers, JSON families and input sizes without further tests.

More interestingly, the same evidence indicates large differences by input type. A strongly escaped-string workload shows a Stage 1 ratio around **0.417×** for E14 relative to its comparator despite aggregate gains elsewhere. This establishes the need to examine trade-offs rather than selecting one winner based on an overall rank. The observed dependence on workload motivates the algorithm-selection question in Section 6.

There are serious limits to the **historical E14 study**. Its source came from a **modified working-tree snapshot**, so the cited upstream SHA alone is insufficient to reconstruct exactly the executed code. The historical smoke gates do not establish exhaustive JSON compliance or memory safety. Repeated benchmark loops are not independent workloads, and the early BPI-F3 corpus included synthetic or reused contents. These qualifications remain attached to the *early campaign*; the later Test 106 has a separately frozen A2 source, two native hosts and additional finite tests, but does not retrospectively reconstruct the October 11 checkout.

### 5.1 Final frozen A2 release-candidate evidence (18 October 2026)

A later, **completed native Test 106** evaluated a distinct **VectorPath-RVV stable** candidate on **Cloud-V (GCC)** and **EPCC (Clang 16)**, totaling **92,435 + 75,400 = 167,835 recorded rows** across all variants and test strata. The release configuration uses **RVV-VLA with A2 adaptive dispatch (16 KiB), packed paths disabled, original Stage 2**; optional `SIMPLE_RUN`/`NL4` escape decoders are not enabled. On **18 pinned public JSON documents**, confirmation-phase DOM throughput relative to **official simdjson v5.0.4 fallback** was **1.6007× (+60.07%) on Cloud-V** and **1.8946× (+89.46%) on EPCC**, measured through paired, **equal-document geometric means**. Stage 1 (2.0376× and 2.5035×) and Stage 2 (1.2727× and 1.4687×) were measured separately. The underlying VectorPath fork derives from simdjson **5.0.3**; the fallback benchmark must not be confused with the earlier 5.0.3 **VLS256** baseline or the fastest upstream implementation.

Test 106 was fundamentally an **internal consolidation/non-regression** check: `VP_STABLE / A2_ORIGINAL` is **1.00001×** on Cloud-V and **0.99959×** on EPCC, and the pairs yield **identical ELF SHA-256 hashes within each host**. The a-priori release-candidate performance criterion (geometric mean ≥0.995× and no public JSON document below 0.980× vs A2 on each host) passed. Each target also evaluated **340 JSONTestSuite cases** with no reported disagreements, including implementation-defined cases treated separately. This finite result is **not** exhaustive compliance or memory-safety certification.

Negative data change the interpretation. On **95 distinct, tiny valid JSONTestSuite files** (2–110 bytes), stable/fallback DOM ratios decline to **0.6665× and 0.8497×**, on Cloud-V and EPCC respectively. Synthetic escape families showed benefits for optional decoder variants, but `NL4` **failed** the Cloud-V public-file gate (worst public-file ratio ~0.9797× vs A2); it remains disabled. The main gain therefore applies to a stated corpus, backend and size regime, **not every workload**.

The read-only **Test 107** audit recorded **`ENGINE PASS` but `HOLD_CI_AND_RELEASE_SIGNOFF`** at that historical point. Subsequent CI #78 succeeded in a **separate related repository**, checking sanitizer/fuzz and sampled Valgrind behavior on **x86/default implementation**, without a proven exact-source match to frozen VectorPath or native RISC-V Valgrind. Its later success does not alter the old audit or certify an immutable tagged release. In this manuscript update, the supplied **18-row per-document CSV** was independently recalculated and five frozen C++ file SHA-256 values cross-checked; **the original two native Test 106 ZIPs were not supplied for re-audit, and no benchmark was rerun**. Full definitions, links, negative findings and source limits are in the [final evidence statement](../docs/FINAL_NATIVE_RESULTS_2026-10-18.md).

**Comparability:** Test 106's final A2-stable 5.0.4-*fallback* ratios must not be subtracted from, or interpreted as independent replication of, the October 11 E14 5.0.3-*VLS256* ratios: engine, baseline, corpus and procedure all differ.

Under these constraints, VLA-MethodLab illustrates a feasible and documented organization of assisted research. It does **not** isolate the causal effect of AI assistance on performance, time spent, cost or reliability.

### Independent governance and distribution boundaries

The upstream [simdjson AI usage policy](https://github.com/simdjson/simdjson/blob/master/AI_USAGE_POLICY.md) permits AI-assisted contributions that have been meaningfully reviewed and understood by an accountable human contributor; it does not ban every use of generative AI. Because this research adopts an AI-orchestrated experimental process and distinct research governance, **VLA-MethodLab** and **VectorPath-RVV** are maintained as independent projects, rather than submissions to upstream simdjson. Their qualifying original additions are subject only to the rights actually established by the projects' licences, provenance and applicable prior grants; this paper does not authorize otherwise-unlicensed incorporation into upstream simdjson. A possible extension into a broader semantic software ecosystem is a confidential longer-term direction, not a published design or demonstrated result. See [governance and rights](../docs/INDEPENDENT_GOVERNANCE_AND_ROADMAP.md).

## 6. Hypothesis: optional JSON workload metadata

Workloads can differ in structural density, numeric proportion, string length, escape frequency, raw multibyte UTF-8, nesting and document size. A parser might estimate these characteristics during a bounded preliminary scan, accept externally generated hints, or combine both. This suggests a research question: **can trusted or untrusted performance hints help choose an execution plan cheaply enough to improve total end-to-end processing?**

For interoperability, the first prototype should use **out-of-band metadata** (a sidecar, application descriptor, or upstream transport field) rather than silently adding a `_meta` object to arbitrary JSON payloads. The JSON specification (RFC 8259) does not establish a standard performance-profile field. Workload hints must never decide whether input is valid JSON. The parser should verify syntax and semantics normally, reject incompatible plans, and fall back safely when hints are missing, misleading or malicious.

A fair experiment would compare: (1) a fixed reference engine; (2) the best fixed engine chosen *only on training data*; (3) internal bounded classification; (4) externally provided hints including creation and transport cost; and (5) an offline oracle as an unattainable comparison bound. Tiny documents, delayed features, and stale or adversarial profiles are essential stress cases. Hold out workloads and machines, and report both speedups and regressions.

The present E00–E14 tests **motivate** this design question but do not evaluate an implementation of external JSON workload metadata. It is a proposal, not a discovered standard or a validated improvement.

## 7. Research evaluation agenda

A research design that could test the methodological thesis should compare three modes of work: expert-led manual development, code-generation assistance without structured experimental memory, and structured human-directed AI orchestration. The task portfolio should cover more than one problem and should control for prior domain expertise and available computing resources. Pre-register success criteria. Measures should include human time, machine time and cost, compilation success, tests passed, regressions, number of variants, false conclusions, recovery from failures and independent reproducibility.

Since a single case study has neither random assignment nor a matched control, it cannot support claims that AI orchestrators are *generally better coders* or that programming is obsolete. It can identify mechanisms, expose difficulties, motivate hypotheses and make the workflow inspectable.

## 8. Discussion: where the next complexity appears

The central conceptual move is not from human intelligence to an all-knowing machine. It is from direct manipulation of code to control over the experiments and systems that produce, evaluate and revise code. That shift may widen participation in certain kinds of technical development, but it also increases the importance of validating artifacts one cannot easily read line by line. The risk is epistemic: confidently generated but incorrect experiments can scale errors as effectively as they scale productive work.

The philosophical analogy with form and material composition captures the fact that organized structures become reusable components. Simon's hierarchies and Licklider's symbiosis offer stronger modern scientific frameworks; program synthesis, autotuning and coding agents provide direct technical predecessors. VLA-MethodLab links these strands through a tangible case that documents both surprising performance behavior and limitations of assisted exploration.

## 9. Conclusion

The defensible conclusion today is that **AI-orchestrated experimental software development can be described, practiced and evaluated through public artifacts even when the human operator delegates some low-level programming**. A broader assertion of effectiveness demands controlled comparisons. Similarly, workload-adaptive JSON processing through optional metadata is a testable future direction rather than a reported result. Automation does not eliminate complexity: it shifts attention toward the design of abstractions, the quality of experiments and the responsibility to interpret evidence.

## References

See [annotated references](../references/REFERENCES.md), [BibTeX](../references/references.bib) and the [evidence ledger](../docs/EVIDENCE_LEDGER.md). The reference list is a verified *starting corpus*, not a substitute for final bibliographic checking against an academic publisher's metadata.
