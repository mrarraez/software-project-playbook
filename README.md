# Software Project Playbook · Starter Kit

🇧🇷 [Português](#português) · 🇺🇸 [English](#english) · 🇪🇸 [Español](#español)

---

## Português

Agentes, comandos e templates prontos para o Claude Code, do livro
**Playbook de Projetos de Software: do zero ao deploy com Claude Code**, de Miguel Rodrigo Arraez.

O livro explica o porquê de cada arquivo. Este repositório entrega os arquivos, em três idiomas:
`starter-kit/pt-BR`, `starter-kit/en` e `starter-kit/es`.

### O que vem no kit (pt-BR)

| Pasta | Conteúdo |
|---|---|
| `starter-kit/pt-BR/.claude/agents/` | 12 agentes com contexto limpo: gerente-projeto, arquiteto, engenheiros backend e frontend, ui-ux, dba-dados, qa-testes, seguranca, devops-containers, revisor-codigo, curador-yagni e analista-metricas |
| `starter-kit/pt-BR/.claude/commands/` | `/retomar`, `/encerrar`, `/salvar-estado`, `/faxina`, `/auditoria-seguranca` e `/nova-adr` |
| `starter-kit/pt-BR/.claude/settings.json` | Regras de negação que protegem e economizam tokens, e três hooks: o HANDOFF entra sozinho em toda sessão, o gitleaks roda antes de todo commit do agente, e uma despedida na conversa lembra o `/encerrar` |
| `starter-kit/pt-BR/docs/estado/` | STATUS, HANDOFF e LOG-DE-DECISOES: a memória do projeto |
| `starter-kit/pt-BR/docs/` | Templates de ADR, specs, métricas, roadmap, riscos, os 12 riscos de segurança e os runbooks de restauração, deploy, rollback e incidente |
| `starter-kit/pt-BR/docs/exemplos/` | SPEC-0001 e ADR-0001 preenchidas com o Agenda, o projeto fictício do livro |
| `starter-kit/pt-BR/apps/api/Dockerfile`, `starter-kit/pt-BR/apps/web/Dockerfile` | Imagens slim multi-stage de exemplo para API e Web |
| `starter-kit/pt-BR/compose.yaml` | Dependências em container, com perfil `app`, portas próprias e só em localhost; o proxy Caddy com HTTPS é a única porta pública |
| `starter-kit/pt-BR/infra/` | Caddyfile, backup agendado e teste de fumaça do primeiro deploy numa VPS |
| `starter-kit/pt-BR/eslint.config.js` | Limite de 300 linhas por arquivo |
| `starter-kit/pt-BR/.github/workflows/` | CI mínimo e publicação das imagens no GHCR a cada tag |
| `starter-kit/pt-BR/.github/pull_request_template.md` | Definition of Done da Parte 08 em todo pull request; a Definition of Ready fica em `docs/01-planejamento/dor.md` |
| `starter-kit/pt-BR/scripts/hooks/` | `pre-push` bloqueia push direto na main, sem plano pago; `pre-commit` barra marcador de conflito e segredo em todo commit, e `testar-pre-commit.sh` prova que ele reprova; `antes-do-commit.sh` barra segredo antes do commit do agente; `lembrar-encerrar.sh` lembra o `/encerrar` |

### Do livro ao kit (pt-BR)

| Parte do livro | Onde está no kit |
|---|---|
| 01 · Planejamento Data-Driven | `docs/00-produto/`, `docs/01-planejamento/`, `docs/specs/` |
| 02 · Estrutura de Pastas & Repositório | `CLAUDE.md` e a árvore de pastas |
| 03 · Time de Agentes com Contexto Limpo | `.claude/agents/` |
| 04 · Sessão, Contexto & Tokens | `.claude/commands/`, `.claude/settings.json`, `docs/estado/` |
| 05 · Containerização Consciente | `compose.yaml`, `apps/*/Dockerfile`, `infra/`, `docs/adr/` |
| 06 · Segurança Contínua | `docs/seguranca/`, `scripts/hooks/`, `/auditoria-seguranca` |
| 07 · YAGNI & Faxina | `/faxina`, `eslint.config.js` |
| 08 · Qualidade, Release & Operação | `.github/`, `docs/runbooks/` |
| 10 · Checklists de Bolso & Templates | `docs/estado/`, `docs/adr/`, `docs/specs/`, `docs/exemplos/`, `docs/governanca/` |

Cada release também traz um zip por idioma, para baixar só a sua pasta sem clonar o repositório.

### Bootstrap em 1 minuto (pt-BR)

```bash
git clone --branch v1.10.0 https://github.com/mrarraez/software-project-playbook ../playbook-kit
git init -b main
git commit --allow-empty -m "chore: commit inicial"
git remote add origin <url do seu repositório privado>
git push -u origin main   # o único push na main, antes de o hook existir
cp -r ../playbook-kit/starter-kit/pt-BR/. .
cp scripts/hooks/pre-push .git/hooks/ && chmod +x .git/hooks/pre-push
cp .env.example .env      # e preencha com valores reais
docker compose up -d
git checkout -b missao/01-fundacao
git add . && git commit -m "chore: fundação do projeto (estrutura, agentes, comandos)"
```

Depois disso, abra o Claude Code e rode `/retomar`.

### Licença (pt-BR)

Os arquivos deste repositório estão sob a [Licença MIT](LICENSE): use, copie, modifique e
distribua à vontade, inclusive em projetos comerciais, mantendo o aviso de copyright.
O texto do livro não faz parte desta licença.

Claude e Claude Code são marcas da Anthropic. Este é um projeto independente, sem vínculo ou endosso da Anthropic.

---

## English

Ready-to-use agents, commands and templates for Claude Code, from the book
**Software Project Playbook: from zero to deploy with Claude Code**, by Miguel Rodrigo Arraez.

The book explains the why behind each file. This repository delivers the files, in three languages:
`starter-kit/pt-BR`, `starter-kit/en` and `starter-kit/es`.

### What's in the kit (en)

| Folder | Contents |
|---|---|
| `starter-kit/en/.claude/agents/` | 12 agents with clean context: project-manager, architect, backend and frontend engineers, ui-ux, database-engineer, qa-tester, security, devops-containers, code-reviewer, yagni-curator and metrics-analyst |
| `starter-kit/en/.claude/commands/` | `/resume-work`, `/wrap-up`, `/save-state`, `/cleanup`, `/security-audit` and `/new-adr` |
| `starter-kit/en/.claude/settings.json` | Deny rules that protect and save tokens, plus three hooks: HANDOFF arrives on its own in every session, gitleaks runs before every commit the agent makes, and saying goodbye in the chat brings up `/wrap-up` |
| `starter-kit/en/docs/state/` | STATUS, HANDOFF and DECISION-LOG: the project's memory |
| `starter-kit/en/docs/` | ADR and spec templates, metrics, roadmap, risks, the 12 security risks and the restore, deploy, rollback and incident runbooks |
| `starter-kit/en/docs/examples/` | SPEC-0001 and ADR-0001 filled in with Agenda, the book's fictional project |
| `starter-kit/en/apps/api/Dockerfile`, `starter-kit/en/apps/web/Dockerfile` | Sample slim multi-stage images for API and Web |
| `starter-kit/en/compose.yaml` | Containerized dependencies, with an `app` profile, dedicated ports and localhost-only bindings; the Caddy proxy with HTTPS is the only public port |
| `starter-kit/en/infra/` | Caddyfile, scheduled backup and smoke test for the first deploy on a VPS |
| `starter-kit/en/eslint.config.js` | 300-line-per-file limit |
| `starter-kit/en/.github/workflows/` | Minimal CI and image publishing to GHCR on every tag |
| `starter-kit/en/.github/pull_request_template.md` | Part 08's Definition of Done on every pull request; the Definition of Ready is in `docs/01-planning/definition-of-ready.md` |
| `starter-kit/en/scripts/hooks/` | `pre-push` blocks direct pushes to main, no paid plan required; `pre-commit` stops conflict markers and secrets on every commit, and `test-pre-commit.sh` proves it rejects them; `before-commit.sh` stops secrets before the agent's commit; `remind-wrap-up.sh` brings up `/wrap-up` |

### From the book to the kit (en)

| Part of the book | Where it lives in the kit |
|---|---|
| 01 · Data-Driven Planning | `docs/00-product/`, `docs/01-planning/`, `docs/specs/` |
| 02 · Folder Structure & Repository | `CLAUDE.md` and the folder tree |
| 03 · A Team of Agents with a Clean Context | `.claude/agents/` |
| 04 · Session, Context & Tokens | `.claude/commands/`, `.claude/settings.json`, `docs/state/` |
| 05 · Deliberate Containerization | `compose.yaml`, `apps/*/Dockerfile`, `infra/`, `docs/adr/` |
| 06 · Continuous Security | `docs/security/`, `scripts/hooks/`, `/security-audit` |
| 07 · YAGNI & Cleanup | `/cleanup`, `eslint.config.js` |
| 08 · Quality, Release & Operations | `.github/`, `docs/runbooks/` |
| 10 · Pocket Checklists & Templates | `docs/state/`, `docs/adr/`, `docs/specs/`, `docs/examples/`, `docs/governance/` |

Every release also ships one zip per language, so you can download just your folder without cloning the repository.

### 1-minute bootstrap (en)

```bash
git clone --branch v1.10.0 https://github.com/mrarraez/software-project-playbook ../playbook-kit
git init -b main
git commit --allow-empty -m "chore: initial commit"
git remote add origin <url of your private repository>
git push -u origin main   # the only push to main, before the hook exists
cp -r ../playbook-kit/starter-kit/en/. .
cp scripts/hooks/pre-push .git/hooks/ && chmod +x .git/hooks/pre-push
cp .env.example .env      # and fill it in with real values
docker compose up -d
git checkout -b mission/01-foundation
git add . && git commit -m "chore: project foundation (structure, agents, commands)"
```

After that, open Claude Code and run `/resume-work`.

### License (en)

The files in this repository are under the [MIT License](LICENSE): use, copy, modify and
distribute freely, including in commercial projects, as long as you keep the copyright notice.
The book's text is not part of this license.

Claude and Claude Code are trademarks of Anthropic. This is an independent project, with no affiliation with or endorsement from Anthropic.

---

## Español

Agentes, comandos y plantillas listos para Claude Code, del libro
**Playbook de Proyectos de Software: de cero al deploy con Claude Code**, de Miguel Rodrigo Arraez.

El libro explica el porqué de cada archivo. Este repositorio entrega los archivos, en tres idiomas:
`starter-kit/pt-BR`, `starter-kit/en` y `starter-kit/es`.

### Qué trae el kit (es)

| Carpeta | Contenido |
|---|---|
| `starter-kit/es/.claude/agents/` | 12 agentes con contexto limpio: gerente-proyecto, arquitecto, ingenieros backend y frontend, ui-ux, dba-datos, qa-pruebas, seguridad, devops-contenedores, revisor-codigo, curador-yagni y analista-metricas |
| `starter-kit/es/.claude/commands/` | `/retomar`, `/cerrar`, `/guardar-estado`, `/limpieza`, `/auditoria-seguridad` y `/nueva-adr` |
| `starter-kit/es/.claude/settings.json` | Reglas de denegación que protegen y ahorran tokens, y tres hooks: el HANDOFF llega solo en cada sesión, gitleaks se ejecuta antes de cada commit del agente, y una despedida en la conversación recuerda el `/cerrar` |
| `starter-kit/es/docs/estado/` | STATUS, HANDOFF y LOG-DE-DECISIONES: la memoria del proyecto |
| `starter-kit/es/docs/` | Plantillas de ADR y specs, métricas, roadmap, riesgos, los 12 riesgos de seguridad y los runbooks de restauración, deploy, rollback e incidente |
| `starter-kit/es/docs/ejemplos/` | SPEC-0001 y ADR-0001 completas con Agenda, el proyecto ficticio del libro |
| `starter-kit/es/apps/api/Dockerfile`, `starter-kit/es/apps/web/Dockerfile` | Imágenes slim multi-stage de ejemplo para API y Web |
| `starter-kit/es/compose.yaml` | Dependencias en contenedor, con perfil `app`, puertos propios y solo en localhost; el proxy Caddy con HTTPS es el único puerto público |
| `starter-kit/es/infra/` | Caddyfile, backup programado y prueba de humo del primer deploy en una VPS |
| `starter-kit/es/eslint.config.js` | Límite de 300 líneas por archivo |
| `starter-kit/es/.github/workflows/` | CI mínimo y publicación de imágenes en GHCR en cada tag |
| `starter-kit/es/.github/pull_request_template.md` | La Definition of Done de la Parte 08 en cada pull request; la Definition of Ready está en `docs/01-planificacion/definicion-de-listo.md` |
| `starter-kit/es/scripts/hooks/` | `pre-push` bloquea el push directo a main, sin plan pago; `pre-commit` frena marcadores de conflicto y secretos en cada commit, y `probar-pre-commit.sh` prueba que los rechaza; `antes-del-commit.sh` frena secretos antes del commit del agente; `recordar-cierre.sh` recuerda el `/cerrar` |

### Del libro al kit (es)

| Parte del libro | Dónde está en el kit |
|---|---|
| 01 · Planificación Data-Driven | `docs/00-producto/`, `docs/01-planificacion/`, `docs/specs/` |
| 02 · Estructura de Carpetas & Repositorio | `CLAUDE.md` y el árbol de carpetas |
| 03 · Equipo de Agentes con Contexto Limpio | `.claude/agents/` |
| 04 · Sesión, Contexto & Tokens | `.claude/commands/`, `.claude/settings.json`, `docs/estado/` |
| 05 · Contenerización Consciente | `compose.yaml`, `apps/*/Dockerfile`, `infra/`, `docs/adr/` |
| 06 · Seguridad Continua | `docs/seguridad/`, `scripts/hooks/`, `/auditoria-seguridad` |
| 07 · YAGNI & Limpieza | `/limpieza`, `eslint.config.js` |
| 08 · Calidad, Release & Operación | `.github/`, `docs/runbooks/` |
| 10 · Checklists de Bolsillo & Plantillas | `docs/estado/`, `docs/adr/`, `docs/specs/`, `docs/ejemplos/`, `docs/gobernanza/` |

Cada release trae también un zip por idioma, para descargar solo tu carpeta sin clonar el repositorio.

### Bootstrap en 1 minuto (es)

```bash
git clone --branch v1.10.0 https://github.com/mrarraez/software-project-playbook ../playbook-kit
git init -b main
git commit --allow-empty -m "chore: commit inicial"
git remote add origin <url de tu repositorio privado>
git push -u origin main   # el único push a main, antes de que exista el hook
cp -r ../playbook-kit/starter-kit/es/. .
cp scripts/hooks/pre-push .git/hooks/ && chmod +x .git/hooks/pre-push
cp .env.example .env      # y complétalo con valores reales
docker compose up -d
git checkout -b mision/01-fundacion
git add . && git commit -m "chore: fundación del proyecto (estructura, agentes, comandos)"
```

Después de eso, abre Claude Code y ejecuta `/retomar`.

### Licencia (es)

Los archivos de este repositorio están bajo la [Licencia MIT](LICENSE): úsalos, cópialos, modifícalos y
distribúyelos con libertad, incluso en proyectos comerciales, manteniendo el aviso de copyright.
El texto del libro no forma parte de esta licencia.

Claude y Claude Code son marcas de Anthropic. Este es un proyecto independiente, sin vínculo ni respaldo de Anthropic.
