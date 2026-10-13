# Publication scripts

`publish-wiki.ps1` (PowerShell 7) and `publish-wiki.sh` (bash) publish the English wiki from the versioned `wiki/` directory into GitHub's separately hosted `.wiki.git` repository.

**Precondition:** the parent repository must exist with the Wiki enabled and an initial page created through GitHub's Wiki tab. Both scripts require a functioning authenticated Git command-line setup and an author identity for commits. Their only remote push destination is the wiki Git repository, not simdjson or RVV-VLA-Lab.

Run from the main repository root: `pwsh -File ./scripts/publish-wiki.ps1` or `bash ./scripts/publish-wiki.sh`.

See [wiki publishing instructions](../docs/WIKI_PUBLISHING.md).
