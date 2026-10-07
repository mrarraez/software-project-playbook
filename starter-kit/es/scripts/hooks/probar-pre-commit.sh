#!/bin/sh
# Prueba de no vacuidad del pre-commit (Parte 06): planta un marcador de conflicto
# en un repositorio desechable y exige que el hook falle. Uso: sh scripts/hooks/probar-pre-commit.sh
set -eu
hook=$(cd "$(dirname "$0")" && pwd)/pre-commit
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
cd "$tmp"
git init -q
printf 'a\n<<<<<<< HEAD\nb\n=======\nc\n>>>>>>> otra\n' > plantado.txt
git add plantado.txt
# fallar no basta: tiene que fallar POR el marcador (sin gitleaks también fallaría)
if salida=$(sh "$hook" 2>&1); then
  echo "FALLÓ: el pre-commit aceptó un marcador de conflicto plantado"; exit 1
fi
case "$salida" in
  *"marcador de conflicto"*"plantado.txt"*) echo "OK: el pre-commit rechazó el marcador plantado" ;;
  *) echo "FALLÓ: rechazó por otro motivo: $salida"; exit 1 ;;
esac
