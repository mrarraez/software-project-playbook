# Política mínima de uso de IA — <NOME DO PROJETO>
**Versão:** 1 · **Data:** AAAA-MM-DD · **Dono:** <nome>
**Revisar:** a cada troca de plano, ferramenta ou modelo; no mínimo a cada 6 meses
Alinhada aos princípios da política de IA da organização, se houver: <link>.
Não é parecer jurídico nem garantia de conformidade legal.

## 1. Ferramenta e plano
Ferramenta: Claude Code · Plano: <Pro/Max | Team/Enterprise | API>
Contas autorizadas: <quem>
O plano define as regras de treino e de retenção
(documentação oficial, página "Data usage").

## 2. O que pode e o que não pode ir para o modelo
| Pode | Não pode |
|---|---|
| Código e docs deste repositório | Segredos: `.env`, chaves, tokens |
| Dados sintéticos ou anonimizados | Dado pessoal real, sem base legal registrada (LGPD) |
| Logs sem dado pessoal | Material de terceiros sob sigilo, sem autorização escrita |

Tudo o que o agente lê vai para o modelo: arquivo aberto,
saída de comando, página buscada.
Dado pessoal que vai ao modelo em geral sai do país: registre qual
mecanismo legal ampara a transferência internacional (LGPD, arts. 33
a 36), por exemplo cláusulas do contrato com o fornecedor, e confirme
com o jurídico.
Dado real de cliente não entra no ambiente de desenvolvimento, nem
"só desta vez, para depurar". Anonimização é condição de entrada,
não limpeza posterior; prova de conserto usa dados fictícios de estresse.
(Opcional) Nada de fora em tempo de execução: fontes, ícones e
bibliotecas servidos pela própria aplicação, com CSP só na própria origem.

## 3. Privacidade e retenção (conferido em AAAA-MM-DD)
- Treino com os dados: <desligado em claude.ai/settings/data-privacy-controls |
  plano comercial: não treina, salvo adesão a programa de parceria>
- Retenção no provedor: <30 dias | 5 anos, se o treino estiver ligado |
  retenção zero (Enterprise elegível)>
- Cópia local: transcrições em `~/.claude/projects/` por 30 dias;
  `cleanupPeriodDays` no settings.json: <valor>
- `/feedback`, `/bug` e `/share` enviam a conversa, com código,
  guardada por 5 anos: <permitido | DISABLE_FEEDBACK_COMMAND=1>
- Telemetria: <padrão | DISABLE_TELEMETRY=1 |
  CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1>

## 4. Responsabilidade humana
Quem aprova o merge responde pelo código, escrito por pessoa ou por agente.
Nada gerado entra sem DoD, evidência real e revisão do diff.
O agente não aprova o próprio trabalho.

## 5. Propriedade intelectual e licenças
- A quem pertence a saída: <trecho dos termos do plano + link>.
  A proteção por direito autoral de código gerado por IA varia
  por país: dúvida vai para o jurídico.
- Código gerado passa pela auditoria de licenças junto com as
  dependências (L11). Trecho longo que lembra projeto conhecido:
  reescrever ou atribuir.
- Skills, agentes e MCPs de terceiros: só com licença declarada
  e o checklist anticaos.

## 6. Modelo e versão
Os apelidos (`haiku`, `sonnet`, `opus`, `fable`) passam para a versão nova sozinhos.
- Sessão principal: `"model": "<id completo>"` no settings.json
- Apelidos dos agentes, no `env` do settings.json:
  ANTHROPIC_DEFAULT_SONNET_MODEL=<id> · ANTHROPIC_DEFAULT_OPUS_MODEL=<id>
  · ANTHROPIC_DEFAULT_HAIKU_MODEL=<id> · ANTHROPIC_DEFAULT_FABLE_MODEL=<id>
Trocar de modelo, versão ou plano é mudança controlada: ADR curta,
missão de teste com a suíte e a matriz de risco rodando, registro no LOG.

## 7. Incidente envolvendo agente
Exemplos: apagou ou alterou dado sem pedido; rodou comando fora dos
limites; obedeceu instrução escondida (R04); mandou segredo ao modelo.
1. Parar a sessão e revogar o que o agente alcançou (chave, token, acesso)
2. Preservar a evidência: transcrição, diff, comandos executados
3. Avaliar o alcance e restaurar pelo runbook de backup
4. Comunicar: dono do projeto. Com dado pessoal e risco ou dano
   relevante: ANPD e titulares em até 3 dias úteis (Res. CD/ANPD 15/2024)
5. Post-mortem sem culpa: a causa vira regra no CLAUDE.md,
   negação no settings.json, teste ou ADR
