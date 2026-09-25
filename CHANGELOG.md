# Changelog

Formato baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.0.0/).

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
