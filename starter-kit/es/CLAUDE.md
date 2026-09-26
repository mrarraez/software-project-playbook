# CLAUDE.md — <NOMBRE DEL PROYECTO>
> Mantén este archivo con HASTA 150 LÍNEAS. El detalle va a docs/
> con un puntero aquí.

## Qué es
<1-2 frases: problema, para quién, resultado esperado>

## Stack
<lenguaje/framework/base de datos/versiones>
Puertos: app 3100, Postgres 55432 (nunca puertos por defecto)

## Dónde está cada cosa (leer SOLO cuando haga falta)
- Estado actual / siguiente paso ..... docs/estado/STATUS.md
- Traspaso de sesión .................. docs/estado/HANDOFF.md
- Decisiones (historial) .............. docs/estado/LOG-DE-DECISIONES.md
- Decisiones de arquitectura .......... docs/adr/
- Métricas e hipótesis ................ docs/00-producto/metricas.md
- Plan de misiones .................... docs/01-planificacion/roadmap-misiones.md
- Seguridad ............................ docs/seguridad/
- Specs de las funcionalidades ......... docs/specs/

## Reglas innegociables
1. Nunca hagas commit/push directo a main. Branch por misión: mision/NN-slug.
2. Ningún campo/tabla/endpoint se agrega o quita sin mi
   aprobación explícita.
3. Un cambio de schema o de arquitectura exige una ADR ANTES del código.
4. Secretos solo en .env (fuera del Git) o en un gestor de secretos.
   Nunca en el frontend.
5. Toda decisión tomada en la sesión va a LOG-DE-DECISIONES.md antes
   de cerrar.
6. Nada de borrar archivo/dato sin aprobación. Limpieza = proponer,
   yo apruebo, después se aplica.
7. Validar con evidencia (prueba, comando, salida real).
   "Debería funcionar" no es evidencia.

## Economía de contexto
- Usa subagentes (.claude/agents/) para tareas especializadas;
  devuelven un resumen breve y guardan el detalle en un archivo.
- Grep/Glob antes de Read. Lee fragmentos, no archivos completos.
- Archivo de código: alerta en 300 líneas, revisión obligatoria en 400.
- No leas node_modules, dist, build, coverage, lockfiles, dumps.
- Al final de la sesión: /cerrar. Al volver: /retomar.

## Worktrees
- En un worktree (.claude/worktrees/), no ejecutes docker compose up
  ni down: usa los servicios que ya están arriba en el checkout principal.

## Comandos útiles
- Levantar dependencias: docker compose up -d
- Pruebas: <comando> · Lint: <comando> · Build: <comando>
