# Publication pathway

This repository is a working research manuscript, not a peer-reviewed article or an archived release.

## Publication layers

1. **GitHub:** versioned manuscript and public provenance. Commits are useful historical records, not irrefutable evidence of original authorship.
2. **Software Heritage:** durable software-source archive and content identifiers (SWHIDs).
3. **Zenodo:** archive a fixed release or manuscript and obtain a DOI for scholarly citation. ORCID is useful but not a prerequisite to create every Zenodo deposit.
4. **Preprint server:** if suitable for the manuscript's scholarly quality and category, submit a clearly labeled preprint (e.g., arXiv). A preprint is not peer review.
5. **Conference or journal:** choose a venue matching the *primary contribution*: human–AI software engineering and methodology, with systems/performance as a case study, or an explicitly performance-centered version with additional results.

## Before selecting a venue

- Check its current scope, deadlines, anonymous-submission policy, page limit, preprint policy and rules for generative AI disclosure.
- Confirm whether the chosen venue expects methodological evaluation, controlled human-subjects experimentation or independently reproducible artifacts.
- Do not infer that acceptance of this conceptual paper establishes the metadata hypothesis or validates undocumented performance improvements.

## Archival versioning

Publish a named tag, record its Git SHA, check citations and references, and make the archive correspond to the exact manuscript version. If a DOI is created, cross-reference its immutable version rather than placing a placeholder DOI in a supposedly final citation.

## Independent validation priorities

1. Reconstruct an exact clean source snapshot for published benchmark claims.
2. Run broad parsing correctness and differential tests.
3. Repeat E14 comparisons on held-out datasets and another RVV device.
4. Compare AI-orchestrated methodology with a clearly specified alternative and record human/compute costs.
