# CLAUDE.md — <NOME DO PROJETO>
> Mantenha este arquivo com ATÉ 150 LINHAS. Detalhe vai para docs/
> com ponteiro aqui.

## O que é
<1-2 frases: problema, para quem, resultado esperado>

## Stack
<linguagem/framework/banco/versões>
Portas: app 3100, Postgres 55432 (nunca portas padrão)

## Onde está cada coisa (leia SÓ quando precisar)
- Estado atual / próximo passo ...... docs/estado/STATUS.md
- Passagem de sessão ................ docs/estado/HANDOFF.md
- Decisões (histórico) .............. docs/estado/LOG-DE-DECISOES.md
- Decisões de arquitetura ........... docs/adr/
- Métricas e hipóteses .............. docs/00-produto/metricas.md
- Plano de missões .................. docs/01-planejamento/roadmap-missoes.md
- Segurança ......................... docs/seguranca/
- Specs das funcionalidades ......... docs/specs/

## Regras inegociáveis
1. Nunca commit/push direto na main. Branch por missão: missao/NN-slug.
2. Nenhum campo/tabela/endpoint é adicionado ou removido sem minha
   aprovação explícita.
3. Mudança de schema ou de arquitetura exige ADR ANTES do código.
4. Segredos só em .env (fora do Git) ou gerenciador de segredos.
   Nunca no frontend.
5. Toda decisão tomada na sessão vai para LOG-DE-DECISOES.md antes
   de encerrar.
6. Nada de apagar arquivo/dado sem aprovação. Faxina = propor,
   eu aprovo, depois aplicar.
7. Validar com evidência (teste, comando, saída real).
   "Deve funcionar" não é evidência.

## Economia de contexto
- Use subagentes (.claude/agents/) para tarefas especializadas;
  eles devolvem resumo curto e gravam o detalhe em arquivo.
- Grep/Glob antes de Read. Leia trechos, não arquivos inteiros.
- Arquivo de código: alerta em 300 linhas, revisão obrigatória em 400.
- Não leia node_modules, dist, build, coverage, lockfiles, dumps.
- Ao fim da sessão: /encerrar. Ao voltar: /retomar.

## Comandos úteis
- Subir dependências: docker compose up -d
- Testes: <comando> · Lint: <comando> · Build: <comando>
