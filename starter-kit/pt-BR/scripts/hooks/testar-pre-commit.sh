#!/bin/sh
# Prova de não vacuidade do pre-commit (Parte 06): planta um marcador de conflito
# num repositório descartável e exige que o hook reprove. Uso: sh scripts/hooks/testar-pre-commit.sh
set -eu
hook=$(cd "$(dirname "$0")" && pwd)/pre-commit
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
cd "$tmp"
git init -q
printf 'a\n<<<<<<< HEAD\nb\n=======\nc\n>>>>>>> outra\n' > plantado.txt
git add plantado.txt
# reprovar não basta: tem de reprovar PELO marcador (sem gitleaks ele também reprovaria)
if saida=$(sh "$hook" 2>&1); then
  echo "FALHOU: o pre-commit aceitou um marcador de conflito plantado"; exit 1
fi
case "$saida" in
  *"marcador de conflito"*"plantado.txt"*) echo "OK: o pre-commit reprovou o marcador plantado" ;;
  *) echo "FALHOU: reprovou por outro motivo: $saida"; exit 1 ;;
esac
