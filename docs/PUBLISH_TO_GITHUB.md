# Publish this research repository on GitHub

**Intended destination:** `https://github.com/MA-Gustave/AI-Orchestrated-Experimental-Development`.

This distribution is an archive of a **working research manuscript** with its brand assets and wiki pages. It is not yet a hosted GitHub repository. GitHub must be authenticated from the publishing computer; do not embed a token in the archive.

## Windows PowerShell 7 — shortest workflow

1. Extract the archive and open PowerShell in its `AI-Orchestrated-Experimental-Development` folder.
2. Install [Git](https://git-scm.com/) and [GitHub CLI](https://cli.github.com/) if they are not available.
3. Sign in once using `gh auth login`.
4. Check `git config --global user.name` and `git config --global user.email` are set to your desired commit identity.
5. Run:

```powershell
pwsh -File ./scripts/publish-main.ps1
```

The script initializes and pushes the research repository (only), using the exact requested GitHub owner/name. It does not alter the other RVV-VLA repositories.

## Manual alternative

Create an **empty** public repository named `AI-Orchestrated-Experimental-Development` under `MA-Gustave` at [github.com/new](https://github.com/new); do not initialize it with a different README or license. From this folder:

```bash
git init -b main
git add .
git commit -m "Initial English research manuscript, brand, and wiki sources"
git remote add origin https://github.com/MA-Gustave/AI-Orchestrated-Experimental-Development.git
git push -u origin main
```

If the repository already exists, **inspect its contents before attempting any push**. Do not force-push or overwrite other people's commits.

## GitHub Wiki (separate repository)

After the main repository has been pushed:

1. Enable **Wikis** in the main repository's GitHub settings, if necessary.
2. Create a first wiki page called `Home` using the GitHub Wiki tab.
3. Run `pwsh -File ./scripts/publish-wiki.ps1`, or `bash ./scripts/publish-wiki.sh`.
4. Confirm the pages at [the repository Wiki](https://github.com/MA-Gustave/AI-Orchestrated-Experimental-Development/wiki).

See [full wiki instructions](WIKI_PUBLISHING.md).

## Recommended settings after publication

- Description: `A research manuscript on automation-driven abstraction shifts and AI-orchestrated experimental software development, with an RVV-VLA case study.`
- Topics: `research`, `software-engineering`, `human-ai-collaboration`, `abstraction`, `autotuning`, `risc-v`, `json-parsing`.
- Enable Issues and Wiki.
- Keep the project explicitly labeled *working draft* until submitted or archived.
- Decide the **licence for original writing and artwork** before adding a license file. Do not relabel third-party code or images.
