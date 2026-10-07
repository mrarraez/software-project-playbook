#!/bin/sh
# Hook de Claude Code (PreToolUse): se ejecuta antes de cada git commit que hace el agente.
# Falla cerrado: sin gitleaks, el commit se detiene y el mensaje dice qué hacer.
if ! command -v gitleaks >/dev/null 2>&1; then
  echo "gitleaks no encontrado: instálalo (Parte 06) antes de hacer commit." >&2
  exit 2
fi
gitleaks git --pre-commit --staged --redact >&2 || exit 2   # 2 = bloquea el commit
