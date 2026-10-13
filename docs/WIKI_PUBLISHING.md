# Publish the accompanying GitHub Wiki

**Important:** GitHub Wikis are backed by a separate Git repository, named `OWNER/REPO.wiki.git`. A `wiki/` directory in the main repository does **not** automatically become the live Wiki. This project's `wiki/` folder is the reviewed source version of every page.

## One-time initialization (GitHub browser)

1. Create the main repository at `MA-Gustave/AI-Orchestrated-Experimental-Development` and upload/push its files.
2. In the main repository's **Settings**, ensure **Wikis** is enabled (where your GitHub plan and repository settings expose that option).
3. Open the repository's **Wiki** tab and create its first page, titled `Home`, with a short placeholder. This initializes the separate wiki Git repository.
4. On your authenticated workstation, from the root of the main repository, run:

```powershell
pwsh -File ./scripts/publish-wiki.ps1
```

For a bash-compatible shell, use `bash ./scripts/publish-wiki.sh`.

The script clones the wiki to a temporary directory, copies the Markdown pages and prepares a commit with any changes. It does not send credentials, does not create or modify the main project's branches, and does not publish changes if nothing changed. You must be authenticated with GitHub on your machine to push.

## Page naming and links

The wiki contains `Home.md`, `_Sidebar.md`, `Research-Thesis.md`, `Conceptual-Framework.md`, `Experimental-Method.md`, `RVV-VLA-Case-Study.md`, `JSON-Workload-Metadata.md`, `Evidence-and-Limitations.md`, `Reading-List.md`, and `Contributing.md`. GitHub uses filenames as titles; links such as `[[Conceptual-Framework]]` navigate between pages in the live wiki.

## Updating a wiki page

Edit the source copy in the main repo's `wiki/` directory, review it in a regular pull request, then re-run the publishing script. Keep the main-repo version authoritative so that wiki edits remain part of the versioned manuscript documentation.

## Verify after publishing

Visit `https://github.com/MA-Gustave/AI-Orchestrated-Experimental-Development/wiki`. Verify the sidebar, all internal page links, outbound research source links, and the absence of private data.

See [GitHub Docs: Adding or editing wiki pages](https://docs.github.com/en/communities/documenting-your-project-with-wikis/adding-or-editing-wiki-pages).
