#requires -Version 7.0
$ErrorActionPreference = 'Stop'
$repo = 'MA-Gustave/AI-Orchestrated-Experimental-Development'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$temporary = Join-Path ([System.IO.Path]::GetTempPath()) ('aoed-wiki-' + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $temporary | Out-Null
try {
    Write-Host 'The GitHub Wiki must be enabled and its first Home page created in the web UI.'
    git clone "https://github.com/$repo.wiki.git" (Join-Path $temporary 'wiki')
    if ($LASTEXITCODE -ne 0) { throw 'Unable to clone wiki. Confirm that the first wiki page exists and GitHub authentication works.' }
    $wiki = Join-Path $temporary 'wiki'
    Get-ChildItem $wiki -File | Where-Object { $_.Extension -in '.md','.markdown' } | Remove-Item -Force
    Copy-Item (Join-Path $root 'wiki/*.md') $wiki
    Push-Location $wiki
    try {
        git add -A
        if ($LASTEXITCODE -ne 0) { throw 'git add failed' }
        $changes = git status --porcelain
        if ($LASTEXITCODE -ne 0) { throw 'git status failed' }
        if ($changes) {
            git commit -m 'Publish reviewed English research wiki pages'
            if ($LASTEXITCODE -ne 0) { throw 'git commit failed. Configure your Git author identity.' }
            git push origin HEAD
            if ($LASTEXITCODE -ne 0) { throw 'git push failed. Check write permissions and GitHub authentication.' }
            Write-Host 'Wiki published.'
        } else { Write-Host 'Wiki already up to date.' }
    } finally { Pop-Location }
} finally {
    Remove-Item $temporary -Recurse -Force -ErrorAction SilentlyContinue
}
