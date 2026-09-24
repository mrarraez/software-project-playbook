# Runbook — Restaurar un backup (simulacro mensual, ~20 min)

Prerrequisito: ADR-0002 (frecuencia, retención, dónde queda la copia).

1. Elige el backup más reciente fuera del disco y anota fecha/hora.
2. Levanta una base de datos descartable, separada de la de desarrollo:
   docker run -d --name restore-prueba -e POSTGRES_PASSWORD=prueba \
     -p 127.0.0.1:55433:5432 postgres:16-alpine
3. Restaura (dump en formato custom, generado con pg_dump -Fc):
   PGPASSWORD=prueba pg_restore -h 127.0.0.1 -p 55433 -U postgres \
     -d postgres --create <archivo.dump>
4. Verifica: el conteo de filas de las tablas principales y el
   registro más reciente coinciden con lo esperado.
5. Cronometra del paso 1 al 4 y regístralo en el LOG-DE-DECISIONES:
   fecha | backup usado | tiempo | resultado | problemas.
6. Destruye el entorno: docker rm -f restore-prueba
