#!/bin/sh
# Non-vacuity proof for the pre-commit hook (Part 06): plants a conflict marker
# in a throwaway repository and requires the hook to fail. Usage: sh scripts/hooks/test-pre-commit.sh
set -eu
hook=$(cd "$(dirname "$0")" && pwd)/pre-commit
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
cd "$tmp"
git init -q
printf 'a\n<<<<<<< HEAD\nb\n=======\nc\n>>>>>>> other\n' > planted.txt
git add planted.txt
# failing is not enough: it must fail BECAUSE of the marker (without gitleaks it would fail too)
if output=$(sh "$hook" 2>&1); then
  echo "FAILED: pre-commit accepted a planted conflict marker"; exit 1
fi
case "$output" in
  *"conflict marker"*"planted.txt"*) echo "OK: pre-commit rejected the planted marker" ;;
  *) echo "FAILED: rejected for another reason: $output"; exit 1 ;;
esac
