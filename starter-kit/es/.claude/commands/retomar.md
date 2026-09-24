---
description: Retoma el proyecto con contexto mínimo a partir de los archivos de estado
argument-hint: [foco opcional de la sesión]
---
Estás RETOMANDO el trabajo. Objetivo: entender dónde quedamos
gastando el mínimo de tokens.

1. Lee SOLO docs/estado/STATUS.md y docs/estado/HANDOFF.md
   (si existe). No leas el repositorio.
2. Ejecuta: `git status --short`, `git log --oneline -5` y
   `git branch --show-current`.
3. Ejecuta `docker compose ps` solo para ver el estado. NO levantes nada todavía.
4. Si el HANDOFF indica un archivo o ADR necesario para el siguiente
   paso, lee solo ese (o el fragmento).
5. Responde en máximo 12 líneas:
   - Dónde quedamos (misión / tarea)
   - Siguiente paso exacto
   - Decisiones pendientes conmigo
   - Divergencias entre STATUS y lo que muestra git
   - Servicios que necesitaré levantar
6. DETENTE y espera mi "ok" antes de ejecutar cualquier cosa.

Foco pedido para esta sesión (si lo hay): $ARGUMENTS
