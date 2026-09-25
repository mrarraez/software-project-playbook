# Os 12 riscos

Referência do agente `seguranca` e do comando `/auditoria-seguranca`.
Fonte: Playbook de Projetos de Software, Parte 06.

## Entrada

| # | Risco | Em uma frase |
|---|---|---|
| R01 | Entradas sem validação | O servidor confia no formato e no conteúdo que o cliente envia |
| R02 | SQL injection | Consulta montada por concatenação de texto em vez de parâmetros |
| R03 | XSS | Conteúdo de usuário, ou gerado pela IA, renderizado como HTML ativo |
| R04 | Prompt injection | A IA obedece a instruções escondidas em conteúdo externo que ela lê |
| R05 | SSRF | O servidor busca uma URL indicada pelo usuário e alcança a rede interna |
## Acesso

| # | Risco | Em uma frase |
|---|---|---|
| R06 | IDOR / BOLA | Trocar um ID na URL dá acesso ao recurso de outra pessoa |
| R07 | Rotas administrativas e enumeração | Painéis expostos e identificadores previsíveis revelam o que não deviam |
| R08 | Senhas e autenticação | Armazenamento ou política fraca; o certo é hash lento, como argon2 ou bcrypt |
## Abuso

| # | Risco | Em uma frase |
|---|---|---|
| R09 | Rate limit e DoS | Sem limite de requisições, um script derruba o serviço ou força senhas |
| R10 | Bots e automação | Scripts abusando de cadastro, login ou formulários |
## Vazamento

| # | Risco | Em uma frase |
|---|---|---|
| R11 | Segredos no frontend | Chave de API ou token embutido no código que vai para o navegador |
| R12 | Erros, logs e cabeçalhos que vazam | Stack trace para o cliente, segredo ou dado pessoal gravado em log, versão do servidor anunciada no cabeçalho |

## Gatilhos: mexeu aqui, revise aquilo

| Você mexeu em… | Riscos a revisar |
|---|---|
| Variável de ambiente nova, chave de API, build do frontend | R11 |
| Rota ou endpoint novo | R01 · R06 · R07 · R12 |
| SQL manual, query crua, ordenação dinâmica | R02 |
| IA lendo conteúdo externo ou chamando ferramentas | R04 · R03 (saída da IA renderizada) |
| Renderização de conteúdo de usuário ou de Markdown | R03 |
| Qualquer recurso com dono (projeto, relatório, arquivo) | R06 |
| Importar URL, webhook, buscar imagem remota | R05 |
| Cadastro, login, recuperação de senha | R08 · R09 · R10 · R12 |
| Deploy, proxy, CDN, múltiplas instâncias | R07 · R09 |
| Tratamento de erro e logs | R12 |
| Servidor web, proxy, runtime, banco ou imagem base | R12 · versão fora de suporte |
