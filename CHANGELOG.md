# Changelog

Formato baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.0.0/).

## [1.13.0] — 2026-10-08

### Alterado
- Acompanha o livro v23 (auditoria editorial de 08/10, 73 itens aprovados).
- CI: todas as Actions fixadas pelo SHA completo, com a versão em comentário (checkout v7.0.1, setup-node v7.1.0, gitleaks-action v3.0.0).
- Dockerfiles da API e do web copiam os manifestos e rodam `npm ci` antes do `COPY . .` (o cache de dependências não se perde a cada mudança de código).
- `/encerrar`, `/retomar`, `/faxina` e agentes alinhados ao que o livro descreve (rotação de diários, leitura de estado, testes antes e depois de remover código); `revisor-codigo` e `seguranca` sem `Edit`.
- Política de uso de IA e runbooks com os textos revisados nas três línguas.
- README-KIT e README: bootstrap e links apontam para `v1.13.0`.

## [1.12.0] — 2026-10-08

### Alterado
- Termos técnicos ficam em inglês também no PT e no ES (livro v22): smoke test, gate, trigger, template, header, restore drill, fail closed, frontmatter, edge cases, container registry; no ES, branch e container.
- Renomeados: `infra/fumaca.sh` (pt-BR) e `infra/prueba-humo.sh` (es) → `infra/smoke-test.sh`, como no en; agente es `devops-contenedores` → `devops-containers`; `docs/ejemplos/ADR-0001-contenerizacion.md` → `ADR-0001-containerizacion.md`; marcador `<rama-sin-barra>` → `<branch-sin-barra>` em `/cerrar`. Os runbooks de deploy e rollback citam o nome novo.
- Agentes, comandos e workflows trazidos dos blocos do livro v22 (paridade 81/81); README: bootstrap e links apontam para `v1.12.0`.

**Atualizando de 1.11.x:** renomeie `infra/fumaca.sh` (ou `infra/prueba-humo.sh`) para `infra/smoke-test.sh` e, no es, `.claude/agents/devops-contenedores.md` para `devops-containers.md`.

## [1.11.0] — 2026-10-08

### Adicionado
- `scripts/hooks/pre-commit` confere o cabeçalho de todo agente em `.claude/agents/` que entra no commit (livro v20, Parte 03): primeira linha `---`, cabeçalho fechado, `name:` e `description:`; nome de ferramenta desconhecido gera aviso. Agente com cabeçalho inválido não dá erro no Claude Code, simplesmente some.
- O teste de não vacuidade (`testar-pre-commit.sh` · `test-pre-commit.sh` · `probar-pre-commit.sh`) planta também um agente com `\---` e exige a recusa pelo motivo certo.

### Alterado
- README: bootstrap e links apontam para `v1.11.0`.

**EN:** Book v20. The Git `pre-commit` hook now checks every agent header in `.claude/agents/` (first line `---`, closed header, `name:` and `description:`; unknown tool names warn), because an agent with an invalid header silently disappears. The non-vacuity test also plants an agent with `\---`. Links point to `v1.11.0`.
**ES:** Libro v20. El hook de Git `pre-commit` ahora revisa el encabezado de cada agente en `.claude/agents/` (primera línea `---`, encabezado cerrado, `name:` y `description:`; herramienta desconocida genera aviso), porque un agente con encabezado inválido desaparece en silencio. La prueba de no vacuidad también planta un agente con `\---`. Los enlaces apuntan a `v1.11.0`.

## [1.10.1] — 2026-10-07

### Corrigido
- Revisão gramatical (livro v19): pt-BR "anticaos", "não root" e "não vacuidade" pelo Acordo Ortográfico (política de IA, agente devops-containers, teste do pre-commit); es "en hasta N" → "en un máximo de N" (agentes, `/cerrar`, `/guardar-estado`, Definition of Ready). Bootstrap e links do README apontam para `v1.10.1`.

**EN:** Grammar pass (book v19): Portuguese hyphenation fixes and the Spanish calque "en hasta N" replaced in agents, commands and the Definition of Ready. No behavior change.
**ES:** Revisión gramatical (libro v19): ortografía en pt-BR y "en hasta N" → "en un máximo de N" en agentes, comandos y la Definition of Ready. Sin cambios de comportamiento.

## [1.10.0] — 2026-10-07

### Adicionado
- `scripts/hooks/pre-commit` (hook do Git): barra marcador de conflito esquecido num merge e segredo nos arquivos preparados, em todo commit, inclusive os feitos à mão. Falha fechada: sem o gitleaks, o commit para com a mensagem de instalação. `scripts/hooks/testar-pre-commit.sh` (en: `test-pre-commit.sh`; es: `probar-pre-commit.sh`) planta um marcador num repositório descartável e exige que o hook reprove pelo motivo certo.
- Hook `UserPromptSubmit` no `.claude/settings.json`, com `scripts/hooks/lembrar-encerrar.sh` (en: `remind-wrap-up.sh`; es: `recordar-cierre.sh`): quando a mensagem soa como despedida, lembra o Claude de sugerir o `/encerrar`. Só lembra, nunca bloqueia.
- `docs/01-planejamento/dor.md` (en: `docs/01-planning/definition-of-ready.md`; es: `docs/01-planificacion/definicion-de-listo.md`) com a Definition of Ready da Parte 08.
- CLAUDE.md: seção "Máquina" (o que precisa estar instalado, com o comando) e as regras 8 (resposta inteira no fim) e 9 (revisão YAGNI só no fechamento de missão ou a pedido).
- Política mínima de uso de IA: dado real de cliente nunca entra no ambiente de desenvolvimento; opcional, nada de fora em tempo de execução.
- Modelo de pull request: item novo da DoD, telas principais conferidas no estado padrão do usuário e com dados difíceis.

### Alterado
- `scripts/hooks/antes-do-commit.sh` (en: `before-commit.sh`; es: `antes-del-commit.sh`) passa a falhar fechado: sem o gitleaks, o commit do agente para (antes, não bloqueava nada).
- `/encerrar`: trabalho que não deve ser commitado agora vira patch em `.backup/wip-AAAAMMDD/`, citado no HANDOFF; `.backup/` entrou no `.gitignore`.
- README: os hooks novos e a DoR na tabela do kit; bootstrap e links apontam para a tag `v1.10.0`.

**EN:** Book v18. New Git `pre-commit` hook (conflict markers + gitleaks, fails closed) with `test-pre-commit.sh` as a non-vacuity proof; `UserPromptSubmit` hook with `remind-wrap-up.sh`; `docs/01-planning/definition-of-ready.md`; CLAUDE.md "Machine" section and rules 8–9; AI-use policy forbids real customer data in development; new DoD item in the PR template. `before-commit.sh` now fails closed; `/wrap-up` saves uncommitted work as a patch in `.backup/`; links point to `v1.10.0`.
**ES:** Libro v18. Hook de Git `pre-commit` nuevo (marcadores de conflicto + gitleaks, falla cerrado) con `probar-pre-commit.sh` como prueba de no vacuidad; hook `UserPromptSubmit` con `recordar-cierre.sh`; `docs/01-planificacion/definicion-de-listo.md`; sección "Máquina" y reglas 8–9 en CLAUDE.md; la política de uso de IA prohíbe datos reales de clientes en desarrollo; ítem nuevo de la DoD en la plantilla de PR. `antes-del-commit.sh` ahora falla cerrado; `/cerrar` guarda el trabajo sin commit como parche en `.backup/`; los enlaces apuntan a `v1.10.0`.

## [1.9.0] — 2026-09-27

### Adicionado
- Primeiro deploy numa VPS (livro v17, Parte 05, "No ar, numa VPS"): serviço `proxy` (Caddy 2.11, HTTPS automático) no perfil `app` do `compose.yaml`, única porta pública (80, 443 e 443/udp), com o volume `caddydata` para os certificados.
- `infra/Caddyfile` (`/api/*` para a API, o resto para o frontend), `infra/backup.sh` (dump `pg_dump -Fc` com retenção local de 14 dias, para o cron) e `infra/fumaca.sh` (en: `smoke-test.sh`; es: `prueba-humo.sh`), o teste de fumaça que roda de fora do servidor e manda para o rollback se falhar.
- Runbooks `docs/runbooks/deploy.md`, `rollback.md` e `incidente.md` (en: `incident.md`); o de incidente é a sequência da Parte 06.
- `.env.example` com `DOMINIO` (en: `DOMAIN`) e `VERSAO` (en/es: `VERSION`) comentados, para o servidor.

### Alterado
- CI: o shellcheck também passa pelos scripts de `infra/`.
- README: `infra/` e os runbooks novos na tabela do kit e na parte 05.
- Bootstrap e links apontam para a tag `v1.9.0`.

**EN:** First deploy on a VPS (book v17, Part 05, "Live, on a VPS"): `proxy` service (Caddy 2.11, automatic HTTPS) in the `app` profile as the only public port; `infra/Caddyfile`, `infra/backup.sh` (14-day local retention, for cron) and `infra/smoke-test.sh`; `deploy.md`, `rollback.md` and `incident.md` runbooks; `DOMAIN` and `VERSION` in `.env.example`; shellcheck covers `infra/`; links point to `v1.9.0`.
**ES:** Primer deploy en una VPS (libro v17, Parte 05, "En producción, en una VPS"): servicio `proxy` (Caddy 2.11, HTTPS automático) en el perfil `app` como único puerto público; `infra/Caddyfile`, `infra/backup.sh` (retención local de 14 días, para el cron) e `infra/prueba-humo.sh`; runbooks `deploy.md`, `rollback.md` e `incidente.md`; `DOMINIO` y `VERSION` en `.env.example`; el shellcheck cubre `infra/`; los enlaces apuntan a `v1.9.0`.

## [1.8.0] — 2026-09-27

### Adicionado
- Hooks do Claude Code no `.claude/settings.json`: `SessionStart` coloca o HANDOFF no contexto em toda sessão, e `PreToolUse` roda o gitleaks antes de todo `git commit` do agente, pelo script `scripts/hooks/antes-do-commit.sh` (en: `before-commit.sh`; es: `antes-del-commit.sh`). Sem gitleaks instalado, o hook não bloqueia nada.
- `.github/pull_request_template.md` com a Definition of Done da Parte 08 e a conferência dos checks do CI.
- `docs/exemplos/` (en: `docs/examples/`; es: `docs/ejemplos/`) com a SPEC-0001 e a ADR-0001 preenchidas com o Agenda, o projeto fictício do livro.
- Workflow `release-zips.yml`: cada release publicada ganha um zip por idioma.
- README: seção "Do livro ao kit", com a parte do livro que explica cada pasta.

### Alterado
- CI: o shellcheck passa por todos os scripts de `scripts/hooks/`.
- Bootstrap e links apontam para a tag `v1.8.0`.

**EN:** Claude Code hooks in `settings.json` (HANDOFF on every session start; gitleaks before every agent commit via `scripts/hooks/before-commit.sh`); PR template with Part 08's Definition of Done; filled-in SPEC-0001 and ADR-0001 examples in `docs/examples/`; one zip per language on every release; "From the book to the kit" section in the README; links point to `v1.8.0`.
**ES:** Hooks de Claude Code en `settings.json` (el HANDOFF al iniciar cada sesión; gitleaks antes de cada commit del agente, con `scripts/hooks/antes-del-commit.sh`); plantilla de PR con la Definition of Done de la Parte 08; SPEC-0001 y ADR-0001 de ejemplo en `docs/ejemplos/`; un zip por idioma en cada release; sección "Del libro al kit" en el README; los enlaces apuntan a `v1.8.0`.

## [1.7.0] — 2026-09-26

### Alterado
- Node 24 (LTS) no lugar do Node 22 nos Dockerfiles e no `ci.yml`: o Node 22 perde suporte em 30/04/2027.
- `release-images.yml` fixa cada action pelo SHA completo do commit, com a versão num comentário, como o livro recomenda para workflow com permissão de escrita.
- Política de uso de IA: dado pessoal enviado ao modelo pede base de transferência internacional (LGPD arts. 33 a 36; GDPR/RGPD cap. V).
- Revisão de texto dos agentes e comandos (livro v14): arquiteto com "não fazer nada" e sem "retrofit"; `/encerrar` "(se houver)". en: `dummy data` e `release blockers` padronizados, `/wrap-up` "unless I ask". es: "rama" no lugar de "branch", "referencia" no lugar de "puntero", "estado semanal", "base de datos desechable" e outros ajustes de espanhol neutro.
- Bootstrap e links apontam para a tag `v1.7.0`.

**EN:** Node 24 instead of Node 22; `release-images.yml` pins actions by full commit SHA; AI use policy notes the international transfer basis (GDPR Chapter V); wording fixes in agents and commands (book v14); links point to `v1.7.0`.
**ES:** Node 24 en lugar de Node 22; `release-images.yml` fija las actions por SHA completo; la política de uso de IA menciona la base de la transferencia internacional (RGPD, capítulo V); ajustes de español neutro en agentes y comandos (libro v14); los enlaces apuntan a `v1.7.0`.

## [1.6.0] — 2026-09-26

### Alterado
- `/checkpoint` passa a se chamar `/salvar-estado` (en: `/save-state`; es: `/guardar-estado`). No Claude Code atual, `/checkpoint` é apelido nativo do `/rewind`, que desfaz alterações, e um comando do projeto não vence o apelido. Quem usa a versão anterior: renomeie `.claude/commands/checkpoint.md` (livro v13, Parte 04).
- Passo "Comunicar" da política de uso de IA com gatilho e prazo: ANPD e titulares em até 3 dias úteis quando houver risco ou dano relevante (Res. CD/ANPD 15/2024); en e es citam o prazo de 72 h do GDPR/RGPD, e es cita os 15 días hábiles da SIC.
- Política de uso de IA: apelido `fable` e variável `ANTHROPIC_DEFAULT_FABLE_MODEL`.
- Agente `curador-yagni` (en: `yagni-curator`): o excedente do LOG vai por mês para `docs/_arquivo/log/AAAA-MM.md`, em vez de resumo trimestral.
- en e es: identificadores em inglês ou espanhol no código (`VERSION` no `compose.yaml`, job `images`/`imagenes` no `release-images.yml`, job `verify` no `ci.yml` em inglês).
- Bootstrap e links apontam para a tag `v1.6.0`.

**EN:** `/checkpoint` is now `/save-state` (`/checkpoint` is a built-in alias for `/rewind`); AI use policy gets incident deadlines (GDPR 72 h) and the `fable` alias; `yagni-curator` archives LOG overflow by month; English identifiers in code (`VERSION`, `images`, `verify`); links point to `v1.6.0`.
**ES:** `/checkpoint` pasa a ser `/guardar-estado` (`/checkpoint` es un alias nativo de `/rewind`); la política de uso de IA incluye plazos de incidente (RGPD 72 h, SIC 15 días hábiles) y el alias `fable`; `curador-yagni` archiva por mes el excedente del LOG; `VERSION` e `imagenes` en el código; los enlaces apuntan a `v1.6.0`.

## [1.5.0] — 2026-09-26

### Adicionado
- `docs/governanca/politica-uso-ia.md` (en: `docs/governance/ai-use-policy.md`; es: `docs/gobernanza/politica-uso-ia.md`): política mínima de uso de IA do projeto, em uma página (livro v12, Parte 10). Cobre o que pode ir para o modelo, privacidade e retenção do Claude Code, responsabilidade humana pelo código gerado, propriedade intelectual e licenças, troca de modelo como mudança controlada e incidente envolvendo agente.

### Alterado
- Bootstrap e links apontam para a tag `v1.5.0`.

**EN:** new `docs/governance/ai-use-policy.md`, a one-page minimal AI use policy for the project (book v12, Part 10); links point to `v1.5.0`.
**ES:** nuevo `docs/gobernanza/politica-uso-ia.md`, una política mínima de uso de IA del proyecto en una página (libro v12, Parte 10); los enlaces apuntan a `v1.5.0`.

## [1.4.0] — 2026-09-26

### Alterado
- `/encerrar` (en: `/wrap-up`; es: `/cerrar`) rotaciona o LOG a cada encerramento: entradas fora da missão atual e da anterior vão para `docs/_arquivo/log/AAAA-MM.md` (livro v10, Parte 07, seção "Foto e diário").
- `/faxina` (en: `/cleanup`; es: `/limpieza`), passo 5: a rotação por mês vale para todo diário (LOG, CHANGELOG, riscos, mudanças, status semanal), e o teto de 300 linhas passa a ser alarme, não gatilho. Substitui o resumo trimestral `log-AAAA-TN.md`.
- Cabeçalho do template `LOG-DE-DECISOES.md` (en: `DECISION-LOG.md`; es: `LOG-DE-DECISIONES.md`) com a regra nova.
- Bootstrap e links apontam para a tag `v1.4.0`.

**EN:** `/wrap-up` now rotates the LOG on every session close (entries outside the current and previous mission go to `docs/_archive/log/YYYY-MM.md`); `/cleanup` applies the monthly rotation to every diary and treats the 300-line limit as an alarm; new LOG template header; links point to `v1.4.0`.
**ES:** `/cerrar` ahora rota el LOG en cada cierre (las entradas fuera de la misión actual y de la anterior van a `docs/_archivo/log/AAAA-MM.md`); `/limpieza` aplica la rotación mensual a todo diario y trata el techo de 300 líneas como alarma; nuevo encabezado del template del LOG; los enlaces apuntan a `v1.4.0`.

## [1.3.0] — 2026-09-25

### Adicionado
- Worktrees para agentes em paralelo (livro v8, Parte 03, seção "Subagente ou worktree"): `worktree.baseRef: "head"` no `.claude/settings.json`, `.worktreeinclude` com o `.env` e `.claude/worktrees/` no `.gitignore`.
- `isolation: worktree` só nos agentes que editam código em paralelo: `engenheiro-backend` e `engenheiro-frontend` (en: `backend-engineer`, `frontend-engineer`; es: `ingeniero-backend`, `ingeniero-frontend`).
- CLAUDE.md: seção "Worktrees" com a regra de não subir o Docker Compose de dentro de um worktree.

## [1.2.2] — 2026-09-25

### Alterado
- R12 passa a ser "Erros, logs e cabeçalhos que vazam", com gatilho novo para servidor web, proxy, runtime, banco e imagem base.
- Agente `seguranca` e `/auditoria-seguranca` conferem em toda rodada os cabeçalhos da app local (`curl -sI`: versão exposta e cabeçalhos de segurança ausentes) e as versões de runtime, banco e imagem base contra o fim de suporte (endoflife.date).
- Espanhol: exemplos concretos de lei de proteção de dados no `dba-datos`.
- Bootstrap e links apontam para a tag `v1.2.2`.

**EN:** R12 now covers headers; the security agent and `/security-audit` check local response headers and end-of-support versions every round.
**ES:** R12 ahora cubre cabeceras; el agente seguridad y `/auditoria-seguridad` revisan las cabeceras locales y el fin de soporte en cada ronda; ejemplos concretos de ley de datos en `dba-datos`.

## [1.2.1] — 2026-09-24

### Segurança
- `.dockerignore` nos 3 idiomas: `.env`, `.git` e `node_modules` não entram mais no build das imagens.
- `ci.yml` (template e CI do repositório) com `permissions: contents: read`.
- CI do repositório com actions fixadas por SHA; o livro recomenda o mesmo no `release-images.yml`.
- `settings.json` nega também `.env` em subpastas.

### Alterado
- README-KIT em pt-BR com pré-requisitos e bootstrap em 1 minuto, como en/es.
- Senha de exemplo do CI em inglês e espanhol (`test`, `prueba`).
- Bootstrap e links apontam para a tag `v1.2.1`.

**EN:** security patch: `.dockerignore`, read-only CI permissions, SHA-pinned actions, broader `.env` deny rule; fuller pt-BR README-KIT.
**ES:** parche de seguridad: `.dockerignore`, permisos de solo lectura en el CI, actions fijadas por SHA, regla más amplia para `.env`; README-KIT pt-BR completo.

## [1.2.0] — 2026-09-24

### Adicionado
- `.github/workflows/ci.yml` (CI mínimo da Parte 08) e `.github/workflows/release-images.yml` (constrói e publica
  as imagens `api` e `web` no GitHub Container Registry a cada tag) nos três idiomas.

### Alterado
- Bootstrap e links apontam para a tag `v1.2.0`.
- `/encerrar` também para navegadores de teste e lembra de reiniciar a máquina ao fechar uma missão.
- `qa-testes` automatiza sempre com navegador headless.

**EN:** adds the minimal CI and an image-publishing workflow (GHCR, on every tag) in all three languages.
**ES:** añade el CI mínimo y un workflow que publica las imágenes en GHCR en cada tag, en los tres idiomas.

## [1.1.0] — 2026-09-24

**pt-BR:** Kit publicado em três idiomas (pt-BR, en, es), em `starter-kit/<idioma>`. Novos
exemplos da edição 1.1 do livro: `docs/specs`, `apps/api` e `apps/web` com Dockerfiles, `compose.yaml`
com perfil `app`, `eslint.config.js` com limite de 300 linhas por arquivo. Limites de 300/400 linhas
aplicados no `/faxina` e no `revisor-codigo`. Correção do frontmatter YAML do `curador-yagni`. Hook
`pre-push` reescrito com `read -r` (shellcheck limpo). Repositório renomeado de `playbook-starter-kit`
para `software-project-playbook`.

**en:** Kit published in three languages (pt-BR, en, es) under `starter-kit/<language>`. New examples
from book edition 1.1: `docs/specs`, `apps/api` and `apps/web` with Dockerfiles, `compose.yaml` with an
`app` profile, `eslint.config.js` with a 300-line-per-file limit. 300/400-line limits enforced in
`/cleanup` and `code-reviewer`. Fixed the `yagni-curator` YAML frontmatter. `pre-push` hook rewritten
with `read -r` (shellcheck clean). Repository renamed from `playbook-starter-kit` to
`software-project-playbook`.

**es:** Kit publicado en tres idiomas (pt-BR, en, es), en `starter-kit/<idioma>`. Nuevos ejemplos de la
edición 1.1 del libro: `docs/specs`, `apps/api` y `apps/web` con Dockerfiles, `compose.yaml` con perfil
`app`, `eslint.config.js` con límite de 300 líneas por archivo. Límites de 300/400 líneas aplicados en
`/limpieza` y en `revisor-codigo`. Corrección del frontmatter YAML de `curador-yagni`. Hook `pre-push`
reescrito con `read -r` (shellcheck limpio). Repositorio renombrado de `playbook-starter-kit` a
`software-project-playbook`.

## [1.0] — 2026-09-23

**pt-BR:** Primeira publicação: kit em português em `starter-kit/`.

**en:** First release: kit in Portuguese under `starter-kit/`.

**es:** Primera publicación: kit en portugués en `starter-kit/`.
