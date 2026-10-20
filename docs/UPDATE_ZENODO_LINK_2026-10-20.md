# Applying the Zenodo citation update

These changes were prepared against the supplied **19 October 2026** repository archive and the uploaded Wiki ZIP. Verify against the latest GitHub revision before replacing files.

1. Copy/commit the updated main-repository files (README, CHANGELOG, `CITATION.cff`, `docs/PUBLISHED_PREPRINT_2026-10-20.md`, the added note to `manuscript/ARTICLE_EN.md`, and `wiki/*.md`).
2. The **live GitHub Wiki is stored in a separate Git repository**. Publish the matching `wiki/*.md` pages to `https://github.com/MA-Gustave/AI-Orchestrated-Experimental-Development.wiki.git` using the documented wiki publishing script or by committing in that wiki repo. Updating `wiki/` in the main repo alone does not change the live Wiki.
3. Inspect the public [preprint](https://doi.org/10.5281/zenodo.23503438) and confirm the citation displays as intended on GitHub.
4. If desired, correct the **Repository URL** in the Zenodo metadata: the public record currently points to the GitHub profile repository `MA-Gustave/MA-Gustave`, not directly to the [paper repository](https://github.com/MA-Gustave/AI-Orchestrated-Experimental-Development). This metadata issue does not change the DOI.

No remote commit or wiki publication was carried out in this preparation.
