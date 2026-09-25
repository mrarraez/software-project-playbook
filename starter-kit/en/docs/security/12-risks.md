# The 12 risks

Reference for the `security` agent and the `/security-audit` command.
Source: Software Project Playbook, Part 06.

## Input

| # | Risk | In one sentence |
|---|---|---|
| R01 | Unvalidated input | The server trusts the format and content the client sends |
| R02 | SQL injection | Query built by string concatenation instead of parameters |
| R03 | XSS | User content, or AI-generated content, rendered as active HTML |
| R04 | Prompt injection | The AI obeys instructions hidden in external content it reads |
| R05 | SSRF | The server fetches a URL indicated by the user and reaches the internal network |

## Access

| # | Risk | In one sentence |
|---|---|---|
| R06 | IDOR / BOLA | Swapping an ID in the URL grants access to another person's resource |
| R07 | Admin routes and enumeration | Exposed panels and predictable identifiers reveal what they shouldn't |
| R08 | Passwords and authentication | Weak storage or policy; the right approach is a slow hash, like argon2 or bcrypt |

## Abuse

| # | Risk | In one sentence |
|---|---|---|
| R09 | Rate limiting and DoS | Without a request limit, a script takes down the service or brute-forces passwords |
| R10 | Bots and automation | Scripts abusing signup, login, or forms |

## Leakage

| # | Risk | In one sentence |
|---|---|---|
| R11 | Secrets in the frontend | API key or token embedded in the code shipped to the browser |
| R12 | Leaky errors, logs and headers | Stack trace sent to the client, secret or personal data logged, server version announced in a header |

## Triggers: touch this, review that

| You touched… | Risks to review |
|---|---|
| New environment variable, API key, frontend build | R11 |
| New route or endpoint | R01 · R06 · R07 · R12 |
| Manual SQL, raw query, dynamic ordering | R02 |
| AI reading external content or calling tools | R04 · R03 (rendered AI output) |
| Rendering of user content or Markdown | R03 |
| Any resource with an owner (project, report, file) | R06 |
| Importing a URL, webhook, fetching a remote image | R05 |
| Signup, login, password recovery | R08 · R09 · R10 · R12 |
| Deploy, proxy, CDN, multiple instances | R07 · R09 |
| Error handling and logs | R12 |
| Web server, proxy, runtime, database or base image | R12 · version out of support |
