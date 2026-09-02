# MANIFEST

Every account, credential, service, endpoint, and asset the agent
touches. Updated in the same session as any change. Drift between
this file and reality is a kill trigger (Constitution II.3).

Credentials are named, never written. "Location" means the environment
variable name or the Owner's password manager entry.

## Identity

Operator name: Fairlead Studio. Identity email: fairleadstudio@gmail.com
(Owner-held; recovery points at the Owner's primary email; 2FA on the
Owner's phone; the agent never holds it). Plus-address every service:
fairleadstudio+cloudflare@gmail.com, +openrouter@, +github@.

## Accounts (Owner-provisioned)

| Service | Purpose | Identity | Credential location | Provisioned | Status |
|---|---|---|---|---|---|
| OpenRouter | model access, prepaid, auto top-up off | segregated | OPENROUTER_API_KEY (env, VPS) | pending | — |
| GitHub | repo remote, public ledger | segregated | deploy key on VPS | pending | — |
| Cloudflare | DNS, registrar, hosting, Workers, analytics | fairleadstudio@gmail.com | CF_API_TOKEN (env, VPS, scoped) | 2026-09-01 | account created; API token not yet issued |
| Domain | fairleadstudio.com via Cloudflare Registrar | fairleadstudio@gmail.com | Owner only | 2026-09-01 | registered; no DNS records or site yet |
| Merchant of record | store, payment link, payouts | segregated | MOR_API_KEY (env, VPS, read + create-product scope only) | pending | — |
| Social account | weekly automated posts | segregated | Owner only until enabled | pending | — |

## Endpoints and assets (agent-created)

| Name | URL / path | Type | Created | Status (live / parked / killed) | Ongoing cost |
|---|---|---|---|---|---|
| | | | | | |
