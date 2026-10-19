# Final native evidence — Test 106 and historical Test 107 (18 October 2026)

**Working research wiki.** The frozen VectorPath-RVV A2 stable release candidate was measured on **Cloud-V (GCC)** and **EPCC (Clang 16)** in a completed native **Test 106**. This is neither a new benchmark nor a blanket approval to ship.

| Metric | Cloud-V | EPCC |
|---|---:|---:|
| Stable vs official **simdjson 5.0.4 fallback**, DOM | **1.6007× (+60.07%)** | **1.8946× (+89.46%)** |
| Stable vs original A2, DOM | 1.00001× | 0.99959× |
| Measurement rows, all Test 106 strata | 92,435 | 75,400 |
| JSONTestSuite cases (no disagreements reported) | 340/340 | 340/340 |
| Engine release-candidate non-regression gate | PASS | PASS |

**Conditions:** 18 pinned public JSON documents, confirmation phase, paired geometric throughput ratios with equal document weights, same-host comparisons. The **167,835 combined rows** are repeated observations, not independent JSON documents. Stable is RVV-VLA / A2 level 2 / 16 KiB / packed off / original Stage 2; the fork is **simdjson 5.0.3-derived** whereas the comparator is **v5.0.4 fallback**.

**Negative data:** stable/fallback drops to **0.6665× Cloud-V / 0.8497× EPCC** on a separate population of **95 tiny valid JSON files**. The opt-in `NL4` decoder fails the Cloud-V public non-regression rule and stays disabled. The identical old-A2/stable ELF SHA-256 **within each host** supports frozen equivalence, not generalized safety.

**Historical audit:** Test 107 is `ENGINE PASS`, **`HOLD_CI_AND_RELEASE_SIGNOFF`**. A later related-repository x86/default CI #78 success does not retroactively alter that audit, certify native RVV Valgrind behavior, match the exact frozen source, or establish a final immutable Git tag.

**Verification boundary:** The AI-Orch update locally recomputes the 18-row derivative summary and checks five C++ SHA-256 hashes against the supplied frozen source. It does **not** contain or re-audit the two original native Test 106 ZIPs. No new native run was executed.

**Do not compare directly** with the **11 October E14** 1.502× DOM result vs **official simdjson 5.0.3 VLS256** on BPI-F3: the tested configuration, baseline, workload and methodology differ.

See the repository [full final evidence](https://github.com/MA-Gustave/AI-Orchestrated-Experimental-Development/blob/main/docs/FINAL_NATIVE_RESULTS_2026-10-18.md), [per-document CSV](https://github.com/MA-Gustave/AI-Orchestrated-Experimental-Development/blob/main/evidence/TEST106_Public_18JSON_PerDocument_Results_EN.csv), and [VectorPath Test 106 publication report](https://github.com/MA-Gustave/VectorPath-RVV/blob/main/docs/release/TEST106_PUBLICATION_REPORT_EN.md).

**Continue:*- [[RVV-VLA-Case-Study]] · [[Evidence-and-Limitations]]
