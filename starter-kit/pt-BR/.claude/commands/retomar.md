---
description: Retoma o projeto com contexto mínimo a partir dos arquivos de estado
argument-hint: [foco opcional da sessão]
---
Você está RETOMANDO o trabalho. Objetivo: entender onde paramos
gastando o mínimo de tokens.

1. Leia APENAS docs/estado/STATUS.md e docs/estado/HANDOFF.md
   (se existir). Não leia o repositório.
2. Rode: `git status --short`, `git log --oneline -5` e
   `git branch --show-current`.
3. Rode `docker compose ps` só para ver o estado. NÃO suba nada ainda.
4. Se o HANDOFF indicar um arquivo ou ADR necessário para o próximo
   passo, leia só esse (ou o trecho).
5. Responda em no máximo 12 linhas:
   - Onde paramos (missão / tarefa)
   - Próximo passo exato
   - Decisões pendentes comigo
   - Divergências entre STATUS e o que o git mostra
   - Serviços que precisarei subir
6. PARE e aguarde meu "ok" antes de executar qualquer coisa.

Foco pedido para esta sessão (se houver): $ARGUMENTS
