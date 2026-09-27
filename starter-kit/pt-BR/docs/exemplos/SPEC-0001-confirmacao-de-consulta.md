# SPEC-0001 — Confirmação de consulta por mensagem de texto

**Status:** APROVADA · **Missão:** M02 · **Data:** 2026-10-05

> Exemplo preenchido do Agenda, o projeto fictício do Diário de bordo do livro.
> Use como modelo de preenchimento e apague a pasta `docs/exemplos/` quando começar o seu projeto.

## Objetivo

Reduzir as faltas nas três clínicas: o paciente recebe a confirmação da consulta por mensagem de texto e
responde SIM ou NÃO. Métrica afetada: taxa de faltas (docs/00-produto/metricas.md).

## Requisitos

| ID | Requisito | Critério de aceite (com caso negativo) |
|---|---|---|
| REQ-001 | Enviar a confirmação por mensagem de texto 24 h antes da consulta | Dado consulta amanhã às 10h, Quando o agendador roda hoje às 10h, Então o paciente recebe data, hora e clínica. Dado paciente sem telefone cadastrado, Então nada é enviado e a recepção vê o alerta "sem telefone" |
| REQ-002 | Nunca enviar a confirmação por e-mail | Dado paciente com e-mail e telefone, Quando a confirmação sai, Então só a mensagem de texto é enviada e nenhum e-mail aparece no log de envios |
| REQ-003 | Resposta NÃO libera o horário | Dado resposta NÃO, Então o horário volta para a agenda em até 1 minuto e a recepção é avisada. Dado resposta fora do padrão ("talvez"), Então o horário continua reservado e a recepção vê a resposta |

## Fora de escopo

- Lembrete 2 horas antes da consulta (entra no roadmap se a taxa de faltas não cair)
- Remarcação pelo próprio paciente

## Lacunas (o que ainda não se sabe)

| Lacuna | Quem decide | Até quando |
|---|---|---|
| Provedor de envio de mensagens (vira ADR-0003) | Lucas | 3º dia da M02 |
| Texto exato da mensagem | Rita | 3º dia da M02 |

## Tarefas (até 1 dia cada)

- [ ] T1 — Agendador diário que seleciona as consultas de amanhã (REQ-001)
- [ ] T2 — Envio pelo provedor, com a credencial só no `.env` (REQ-001)
- [ ] T3 — Teste que prova que nenhum e-mail sai, nem com e-mail cadastrado (REQ-002)
- [ ] T4 — Processar a resposta e liberar o horário no NÃO (REQ-003)
- [ ] T5 — Alerta "sem telefone" na tela da recepção (REQ-001)
- [ ] T6 — Testes sobem o servidor com a credencial do provedor vazia, sem chamada real (REQ-001)

## Referências

Fonte de REQ-001 a REQ-003: entrevista com a Rita em 2026-09-28, com as notas conferidas com ela antes da
aprovação (o resumo feito pelo agente tinha invertido o REQ-002; ver o Diário de bordo da Parte 01).
ADR-0001 (containerização) · métrica em docs/00-produto/metricas.md
