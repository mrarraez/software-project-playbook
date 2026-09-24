---
description: Cierra la sesión guardando el estado en un archivo y liberando recursos
---
Vamos a CERRAR la sesión. Nada puede perderse cuando yo ejecute /clear o /exit.

1. No dejes nada a medias: si hay una migración, commit o escritura
   en curso, termínala o revierte con seguridad. Avísame.
2. Sobrescribe docs/estado/STATUS.md (máx. 40 líneas): fecha, misión
   actual, % completado, hecho hoy, qué falta, bloqueos, riesgos nuevos.
3. Agrega en docs/estado/LOG-DE-DECISIONES.md cada decisión de esta
   sesión: fecha | decisión | quién decidió | motivo | ¿reversible?
4. Sobrescribe docs/estado/HANDOFF.md: siguiente paso EXACTO, comandos
   a ejecutar, archivos para abrir, trampas conocidas.
5. Commit en la branch actual (NUNCA main):
   `chore(estado): cierre AAAA-MM-DD`. No hagas push sin que yo lo pida.
6. Libera recursos: detén dev servers y watchers que hayas iniciado;
   ejecuta `docker compose stop` (NUNCA `down -v`).
7. Confirma en hasta 8 líneas qué se guardó y qué quedó ejecutándose
   (si algo), y escribe al final:
   "Estado guardado. Puedes ejecutar /clear (o /exit)."
