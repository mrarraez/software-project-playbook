#!/bin/sh
# Hook do Claude Code (UserPromptSubmit): quando a mensagem soa como despedida,
# lembra o Claude de sugerir o /encerrar. Só lembra, nunca bloqueia.
entrada=$(cat)
if printf '%s' "$entrada" | grep -qiE '"prompt": *"[^"]*(tchau|até amanhã|ate amanha|até mais|ate mais|boa noite|vou dormir|por hoje é só|por hoje e so|encerrar o dia)'; then
  echo "Lembrete do hook: o usuário parece estar se despedindo. Antes de responder, sugira rodar /encerrar para gravar STATUS, LOG e HANDOFF."
fi
exit 0
