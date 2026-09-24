# Playbook de Projetos de Software · Starter Kit

Agentes, comandos e templates prontos para o Claude Code, do livro
**Playbook de Projetos de Software: do zero ao deploy com Claude Code**, de Miguel Rodrigo Arraez.

O livro explica o porquê de cada arquivo. Este repositório entrega os arquivos.

## O que vem no kit

| Pasta | Conteúdo |
|---|---|
| `starter-kit/.claude/agents/` | 12 agentes com contexto limpo: gerente-projeto, arquiteto, engenheiros backend e frontend, ui-ux, dba-dados, qa-testes, seguranca, devops-containers, revisor-codigo, curador-yagni e analista-metricas |
| `starter-kit/.claude/commands/` | `/retomar`, `/encerrar`, `/checkpoint`, `/faxina`, `/auditoria-seguranca` e `/nova-adr` |
| `starter-kit/.claude/settings.json` | Regras de negação que protegem e economizam tokens |
| `starter-kit/docs/estado/` | STATUS, HANDOFF e LOG-DE-DECISOES: a memória do projeto |
| `starter-kit/docs/` | Templates de ADR, métricas, roadmap, riscos, os 12 riscos de segurança e o runbook de restauração |
| `starter-kit/scripts/hooks/pre-push` | Bloqueia push direto na main, sem plano pago |
| `starter-kit/compose.yaml` | Dependências em container, com portas próprias e só em localhost |

## Começando um projeto novo

```bash
git clone https://github.com/mrarraez/playbook-starter-kit ../playbook-kit
git init -b main
git commit --allow-empty -m "chore: commit inicial"
git remote add origin <url do seu repositório privado>
git push -u origin main   # o único push na main, antes de o hook existir
cp -r ../playbook-kit/starter-kit/. .
cp scripts/hooks/pre-push .git/hooks/ && chmod +x .git/hooks/pre-push
cp .env.example .env      # e preencha com valores reais
docker compose up -d
git checkout -b missao/01-fundacao
git add . && git commit -m "chore: fundação do projeto (estrutura, agentes, comandos)"
```

Depois disso, abra o Claude Code e rode `/retomar`.

## Licença

Os arquivos deste repositório estão sob a [Licença MIT](LICENSE): use, copie, modifique e
distribua à vontade, inclusive em projetos comerciais, mantendo o aviso de copyright.
O texto do livro não faz parte desta licença.

Claude e Claude Code são marcas da Anthropic. Este é um projeto independente, sem vínculo ou endosso da Anthropic.
