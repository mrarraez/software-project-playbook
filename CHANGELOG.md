# Changelog

Formato baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.0.0/).

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
