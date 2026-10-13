#requires -Version 7.0
$ErrorActionPreference = 'Stop'
$repo = 'MA-Gustave/AI-Orchestrated-Experimental-Development'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
Push-Location $root
try {
    foreach ($tool in @('git', 'gh')) {
        if (-not (Get-Command $tool -ErrorAction SilentlyContinue)) { throw "$tool is required. See docs/PUBLISH_TO_GITHUB.md" }
    }
    gh auth status
    if ($LASTEXITCODE -ne 0) { throw 'Sign into GitHub CLI first: gh auth login' }

    gh repo view $repo --json nameWithOwner --jq '.nameWithOwner' 2>$null
    if ($LASTEXITCODE -eq 0) {
        throw "The repository $repo already exists. Inspect it and use the manual Git instructions; no automatic overwrite was attempted."
    }

    if (-not (Test-Path '.git')) {
        git init -b main
        if ($LASTEXITCODE -ne 0) { throw 'git init failed' }
    }
    $head = git rev-parse --verify HEAD 2>$null
    if ($LASTEXITCODE -ne 0) {
        git add .
        if ($LASTEXITCODE -ne 0) { throw 'git add failed' }
        git commit -m 'Initial English research manuscript, brand, and wiki sources'
        if ($LASTEXITCODE -ne 0) { throw 'git commit failed. Configure user.name and user.email.' }
    }
    gh repo create $repo --public --source . --remote origin --push
    if ($LASTEXITCODE -ne 0) { throw 'Repository creation or push failed; check permissions and do not force-push.' }
    Write-Host "Published https://github.com/$repo"
    Write-Host 'Next: enable GitHub Wiki, create a Home page, then run scripts/publish-wiki.ps1'
} finally { Pop-Location }
