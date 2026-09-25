# Los 12 riesgos

Referencia del agente `seguridad` y del comando `/auditoria-seguridad`.
Fuente: Playbook de Proyectos de Software, Parte 06.

## Entrada

| # | Riesgo | En una frase |
|---|---|---|
| R01 | Entradas sin validación | El servidor confía en el formato y el contenido que envía el cliente |
| R02 | Inyección SQL | Consulta armada por concatenación de texto en vez de parámetros |
| R03 | XSS | Contenido de usuario, o generado por la IA, renderizado como HTML activo |
| R04 | Inyección de prompts (prompt injection) | La IA obedece instrucciones escondidas en contenido externo que lee |
| R05 | SSRF | El servidor busca una URL indicada por el usuario y alcanza la red interna |

## Acceso

| # | Riesgo | En una frase |
|---|---|---|
| R06 | IDOR / BOLA | Cambiar un ID en la URL da acceso al recurso de otra persona |
| R07 | Rutas administrativas y enumeración | Paneles expuestos e identificadores previsibles revelan lo que no deberían |
| R08 | Contraseñas y autenticación | Almacenamiento o política débil; lo correcto es un hash lento, como argon2 o bcrypt |

## Abuso

| # | Riesgo | En una frase |
|---|---|---|
| R09 | Rate limit y DoS | Sin límite de solicitudes, un script tumba el servicio o fuerza contraseñas |
| R10 | Bots y automatización | Scripts que abusan del registro, login o formularios |

## Fuga

| # | Riesgo | En una frase |
|---|---|---|
| R11 | Secretos en el frontend | Clave de API o token embebido en el código que va al navegador |
| R12 | Errores, logs y cabeceras que filtran datos | Stack trace al cliente, secreto o dato personal grabado en el log, versión del servidor anunciada en la cabecera |

## Disparadores: si tocas esto, revisa aquello

| Tocaste… | Riesgos a revisar |
|---|---|
| Variable de entorno nueva, clave de API, build del frontend | R11 |
| Ruta o endpoint nuevo | R01 · R06 · R07 · R12 |
| SQL manual, query cruda, ordenamiento dinámico | R02 |
| IA leyendo contenido externo o llamando herramientas | R04 · R03 (salida de la IA renderizada) |
| Renderización de contenido de usuario o de Markdown | R03 |
| Cualquier recurso con dueño (proyecto, informe, archivo) | R06 |
| Importar URL, webhook, buscar imagen remota | R05 |
| Registro, login, recuperación de contraseña | R08 · R09 · R10 · R12 |
| Deploy, proxy, CDN, múltiples instancias | R07 · R09 |
| Manejo de errores y logs | R12 |
| Servidor web, proxy, runtime, base de datos o imagen base | R12 · versión sin soporte |
