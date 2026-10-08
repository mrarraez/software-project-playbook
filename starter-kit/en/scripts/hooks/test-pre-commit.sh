#!/bin/sh
# Non-vacuity proof for the pre-commit hook (Part 06): plants defects in a throwaway
# repository and requires the hook to reject each one for the right reason.
# Usage: sh scripts/hooks/test-pre-commit.sh
set -eu
hook=$(cd "$(dirname "$0")" && pwd)/pre-commit

# prova(): roda o hook num repositório novo onde $1 preparou o defeito; exige reprovação com a mensagem $2
prova() {
  tmp=$(mktemp -d)
  (
    cd "$tmp"
    git init -q
    eval "$1"
    # rejecting is not enough: it must reject BECAUSE of the planted defect (without gitleaks it would also reject)
    if saida=$(sh "$hook" 2>&1); then
      echo "$3"; exit 1
    fi
    case "$saida" in
      *"$2"*) echo "$4" ;;
      *) echo "FAILED: rejected for another reason: $saida"; exit 1 ;;
    esac
  )
  status=$?
  rm -rf "$tmp"
  return $status
}

prova "printf 'a\n<<<<<<< HEAD\nb\n=======\nc\n>>>>>>> outra\n' > plantado.txt && git add plantado.txt" \
  "conflict marker" "FAILED: pre-commit accepted a planted conflict marker" "OK: pre-commit rejected the planted marker"
prova "mkdir -p .claude/agents && printf '\\\\---\nname: x\ndescription: y\n---\n' > .claude/agents/x.md && git add .claude/agents/x.md" \
  "does not start with" "FAILED: pre-commit accepted an agent with an invalid header" "OK: pre-commit rejected the agent with an invalid header"
