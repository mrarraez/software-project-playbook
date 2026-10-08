#!/bin/sh
# Prueba de no vacuidad del pre-commit (Parte 06): planta defectos en un repositorio
# desechable y exige que el hook rechace cada uno por el motivo correcto.
# Uso: sh scripts/hooks/probar-pre-commit.sh
set -eu
hook=$(cd "$(dirname "$0")" && pwd)/pre-commit

# prova(): roda o hook num repositório novo onde $1 preparou o defeito; exige reprovação com a mensagem $2
prova() {
  tmp=$(mktemp -d)
  (
    cd "$tmp"
    git init -q
    eval "$1"
    # rechazar no basta: debe rechazar POR el defecto plantado (sin gitleaks también rechazaría)
    if saida=$(sh "$hook" 2>&1); then
      echo "$3"; exit 1
    fi
    case "$saida" in
      *"$2"*) echo "$4" ;;
      *) echo "FALLÓ: rechazó por otro motivo: $saida"; exit 1 ;;
    esac
  )
  status=$?
  rm -rf "$tmp"
  return $status
}

prova "printf 'a\n<<<<<<< HEAD\nb\n=======\nc\n>>>>>>> outra\n' > plantado.txt && git add plantado.txt" \
  "marcador de conflicto" "FALLÓ: el pre-commit aceptó un marcador de conflicto plantado" "OK: el pre-commit rechazó el marcador plantado"
prova "mkdir -p .claude/agents && printf '\\\\---\nname: x\ndescription: y\n---\n' > .claude/agents/x.md && git add .claude/agents/x.md" \
  "no empieza con" "FALLÓ: el pre-commit aceptó un agente con frontmatter inválido" "OK: el pre-commit rechazó el agente con frontmatter inválido"
