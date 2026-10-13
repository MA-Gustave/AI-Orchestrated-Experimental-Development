#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
repo="MA-Gustave/AI-Orchestrated-Experimental-Development"
workdir="$(mktemp -d)"
trap 'rm -rf "$workdir"' EXIT
printf 'Cloning GitHub Wiki for %s (the first Home page must exist)...\n' "$repo"
git clone "https://github.com/${repo}.wiki.git" "$workdir/wiki"
find "$workdir/wiki" -maxdepth 1 -type f \( -name '*.md' -o -name '*.markdown' \) -delete
cp wiki/*.md "$workdir/wiki/"
cd "$workdir/wiki"
if [ -z "$(git status --porcelain)" ]; then
  echo 'Wiki already up to date.'
else
  git add -A
  git commit -m 'Publish reviewed English research wiki pages'
  git push origin HEAD
  echo 'Wiki published.'
fi
