---
description: Encerra a sessão salvando o estado em arquivo e liberando recursos
---
Vamos ENCERRAR a sessão. Nada pode se perder quando eu rodar /clear ou /exit.

1. Não deixe nada pela metade: se houver migração, commit ou escrita
   em andamento, conclua ou reverta com segurança. Me avise.
2. Sobrescreva docs/estado/STATUS.md (máx. 40 linhas): data, missão
   atual, % concluído, feito hoje, o que falta, bloqueios, riscos novos.
3. Acrescente em docs/estado/LOG-DE-DECISOES.md cada decisão desta
   sessão: data | decisão | quem decidiu | motivo | reversível?
4. Sobrescreva docs/estado/HANDOFF.md: próximo passo EXATO, comandos
   a rodar, arquivos a abrir, pegadinhas conhecidas.
5. Commit na branch atual (NUNCA main):
   `chore(estado): encerramento AAAA-MM-DD`. Não faça push sem eu pedir.
6. Libere recursos: pare dev servers e watchers que você iniciou;
   rode `docker compose stop` (NUNCA `down -v`).
7. Confirme em até 8 linhas o que foi salvo e o que ficou rodando
   (se algo), e escreva por último:
   "Estado salvo. Pode rodar /clear (ou /exit)."
