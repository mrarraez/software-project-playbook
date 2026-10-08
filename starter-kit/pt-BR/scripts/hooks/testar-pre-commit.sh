#!/bin/sh
# Prova de não vacuidade do pre-commit (Parte 06): planta defeitos num repositório
# descartável e exige que o hook reprove cada um pelo motivo certo.
# Uso: sh scripts/hooks/testar-pre-commit.sh
set -eu
hook=$(cd "$(dirname "$0")" && pwd)/pre-commit

# prova(): roda o hook num repositório novo onde $1 preparou o defeito; exige reprovação com a mensagem $2
prova() {
  tmp=$(mktemp -d)
  (
    cd "$tmp"
    git init -q
    eval "$1"
    # reprovar não basta: tem de reprovar PELO defeito plantado (sem gitleaks ele também reprovaria)
    if saida=$(sh "$hook" 2>&1); then
      echo "$3"; exit 1
    fi
    case "$saida" in
      *"$2"*) echo "$4" ;;
      *) echo "FALHOU: reprovou por outro motivo: $saida"; exit 1 ;;
    esac
  )
  status=$?
  rm -rf "$tmp"
  return $status
}

prova "printf 'a\n<<<<<<< HEAD\nb\n=======\nc\n>>>>>>> outra\n' > plantado.txt && git add plantado.txt" \
  "marcador de conflito" "FALHOU: o pre-commit aceitou um marcador de conflito plantado" "OK: o pre-commit reprovou o marcador plantado"
prova "mkdir -p .claude/agents && printf '\\\\---\nname: x\ndescription: y\n---\n' > .claude/agents/x.md && git add .claude/agents/x.md" \
  "não começa com" "FALHOU: o pre-commit aceitou um agente com frontmatter inválido" "OK: o pre-commit reprovou o agente com frontmatter inválido"
