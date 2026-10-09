---
description: Rutina YAGNI - encuentra y propone limpieza y compactación de código y documentos
---
Modo AUDITORÍA. No borres, muevas ni edites nada antes de mi "aprobado".
Delega al subagente curador-yagni; informe en
docs/_archivo/limpieza-AAAA-MM-DD.md.

Alcance:
1. Código: exports, archivos y dependencias sin usar (knip, depcheck
   o vulture, según el stack); feature flags muertas; TODOs con más
   de 30 días.
2. Documentos: borradores, duplicados, docs superados por una ADR más nueva,
   archivos no referenciados.
3. Tamaño: CLAUDE.md > 150 líneas; LOG-DE-DECISIONES.md > 300 líneas;
   STATUS.md > 40 líneas; HANDOFF.md > 20 líneas; archivos de código
   > 300 líneas (candidatos a división) y > 400 (revisión obligatoria).
4. Para cada ítem: MANTENER / COMPACTAR / ARCHIVAR (docs/_archivo/) /
   ELIMINAR + motivo en 1 línea.
5. Diarios (LOG, CHANGELOG, riesgos, cambios, estado semanal): las
   entradas fuera de la misión actual y de la anterior van a
   docs/_archivo/<nombre>/AAAA-MM.md (mes de la entrada); en el archivo
   queda 1 línea de referencia.
6. Aplica el test YAGNI al código especulativo (¿existe un requisito hoy?
   ¿se usará en las próximas 2 misiones? ¿es caro agregarlo después?).
7. Ejecuta la suite de pruebas antes y después de aplicar cualquier
   eliminación de código: el código "sin usar" puede llamarse por
   reflexión o inyección de dependencias.

Devuélveme solo: tabla resumida (máx. 20 líneas) + ruta del
informe + diff propuesto.
