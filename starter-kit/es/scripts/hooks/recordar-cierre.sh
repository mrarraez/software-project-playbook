#!/bin/sh
# Hook de Claude Code (UserPromptSubmit): cuando el mensaje suena a despedida,
# le recuerda a Claude que sugiera /cerrar. Solo recuerda, nunca bloquea.
entrada=$(cat)
if printf '%s' "$entrada" | grep -qiE '"prompt": *"[^"]*(chau|chao|adi(ó|o)s|hasta ma(ñ|n)ana|buenas noches|me voy a dormir|por hoy es todo)'; then
  echo "Recordatorio del hook: el usuario parece estar despidiéndose. Antes de responder, sugiere ejecutar /cerrar para guardar STATUS, LOG y HANDOFF."
fi
exit 0
