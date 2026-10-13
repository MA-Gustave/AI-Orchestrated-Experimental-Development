# Abstract — working paper

The history of computing can be interpreted as a succession of shifts in the distribution of technical work: mechanisms execute calculations, compilers translate source languages, and high-level systems let people reason about increasingly complex arrangements without manipulating each constituent operation directly. Generative AI may extend this tendency into software implementation and experimental development. This paper explores that possibility through an independently directed case study of RISC-V Vector (RVV) JSON parsing.

The reported workflow combines a revisable library of optimization patterns, AI-assisted candidate design, fixed experimental configurations, native testing, and reports that preserve successful and unsuccessful observations for later cycles. The case study, RVV-VLA-Lab, includes 15 E00–E14 engine plans and published native benchmark records. Their value here is not a record speedup but the ability to observe how a human operator directs specialized research while delegating parts of implementation and analysis. The paper distinguishes this practice from fully autonomous search and from established algorithm-selection and autotuning literature.

A further, prospective hypothesis considers optional workload metadata for JSON documents, allowing parsing implementations to use externally supplied performance hints without changing validity rules. No reported campaign establishes that such metadata improves end-to-end performance. More generally, the study demonstrates a documented working arrangement, not the universal superiority of AI-driven development. It argues that automation relocates complexity toward specification, evaluation, exception handling, and accountability rather than eliminating it.

**Keywords:** abstraction; human–AI collaboration; experimental software engineering; program synthesis; autotuning; RISC-V Vector; JSON parsing; evidence provenance.

**Status:** draft, not peer reviewed. Author name and institutional metadata to be finalized before submission.
