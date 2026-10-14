# Optimization pattern library

The experimental artifact is a **library of explicitly named candidate strategies**, not just an optimized binary. It makes the search space inspectable, extensible, and refutable.

The publicly documented campaign includes **15 fixed configurations**, `E00`–`E14`, stored in [experiments/patterns.json](https://github.com/MA-Gustave/VLA-MethodLab/blob/main/experiments/patterns.json). Three additional compiled controls used in parts of the comparisons are kept conceptually distinct from those patterns.

## Selected examples

| Candidate | Tested idea |
| --- | --- |
| `E01_adaptive` | Bounded document profiling plus engine composition |
| `E03_numeric` | Numeric-oriented structural/escape parameters |
| `E04_text` | Interior-string fast path |
| `E05_escaped` | Escape-focused parameter changes |
| `E07_utf8` | Distinguish raw multibyte UTF-8 from `\uXXXX` escape sequences |
| `E09_mask_writer` | Word-mask structural extraction |
| `E12_string_fastpath_only` | Isolate the fast path as a controlled experiment |
| `E13_stage2_prefetch` | Experimental prefetch hint, not a new Stage 2 algorithm |
| `E14_packed_disabled` | Test whether disabling packed control/index operations helps |

For exact compiler flags and the remaining candidates, consult the [canonical table](https://github.com/MA-Gustave/VLA-MethodLab/blob/main/experiments/PATTERN_LIBRARY.md).

## How the library can improve

New contributions should specify a mechanism, predicted workloads, build flags, correctness risks, relevant controls and a falsifiable prediction. More patterns are not inherently better: factorial explosion, redundant candidates, and overfitting require explicit controls and evaluation budgets.

## Why this matters to the paper

The operator can reason over **hypothesis-level units** while AI-assisted tools help generate, compile, or examine code-level implementations. This is an illustration of abstraction in research practice, **not evidence that the lower-level code is dispensable**.

**Continue:** [[Experimental-Method]] · [[Evidence-and-Limitations]]
