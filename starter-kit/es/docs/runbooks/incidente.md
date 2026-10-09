# Runbook — Incidente de seguridad (secreto filtrado)

Fuente: Playbook de Proyectos de Software, Parte 06, "Cuando el secreto se filtra".
El orden no es una sugerencia. Sobre todo el paso 1 antes del paso 4.

1. **Revocar y rotar.** Genera la clave nueva e invalida la antigua. Borrar el archivo o el commit no deshace la filtración.
2. **Contener.** Bloquear accesos, pausar integraciones, poner en mantenimiento si hace falta.
3. **Evaluar el alcance.** Logs de uso de la clave, datos accedidos, ventana de exposición.
4. **Limpiar el historial, si hace falta.** `git filter-repo`, y solo después de rotar.
5. **Comunicar.** Patrocinador. Si hubo datos personales afectados, sigue el plazo de la ley aplicable. RGPD (UE y España): la autoridad de control (en España, la AEPD) en 72 horas, salvo que sea improbable que la violación suponga un riesgo para los derechos de las personas, y los titulares sin dilación indebida cuando el riesgo sea alto. Colombia (Ley 1581 de 2012): reporte a la SIC en el Registro Nacional de Bases de Datos en 15 días hábiles desde que se detecta. Argentina (Ley 25.326), México (LFPDPPP) y Brasil (LGPD): consulta el plazo de la autoridad local.
6. **Post-mortem sin culpa.** Línea de tiempo, causa raíz, acción preventiva que se vuelve regla, prueba o ADR.
