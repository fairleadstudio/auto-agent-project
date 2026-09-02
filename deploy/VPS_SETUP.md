# VPS setup checklist

Cheapest Hetzner or DigitalOcean box, 2 GB, Ubuntu LTS. Repo on the
box's own disk. Nothing on it but the items below. Everything here is
done by the Owner, once, from the segregated identity.

1. **Harden.** Non-root user `agent`, SSH key only, password auth off,
   `ufw` allow 22 only, unattended-upgrades on.
2. **Tools.** `git`, `python3`, `curl`, and OpenCode CLI pinned to the
   validated version (`opencode --version` should print 1.18.20 or the
   version re-validated on the Mac). Set `autoupdate: false` is already
   in `opencode.json`.
3. **Repo.** `git clone <remote> /home/agent/repo` using a deploy key
   with write access. Set the agent's git identity on the box:
   `git config user.name "auto-agent"` and
   `git config user.email "agent@<identity-domain>"`.
4. **Owner signing.** On the Owner's Mac, enable SSH commit signing
   (`git config gpg.format ssh`, `git config user.signingkey
   ~/.ssh/<key>.pub`, `git config commit.gpgsign true`). On the box,
   create `/home/agent/.config/git/allowed_signers` with one line:
   `<owner-email> <key-type> <owner-public-key>`. Set
   `OWNER_ALLOWED_SIGNERS` in `.env` to that path. Every Owner edit to
   a protected file must be a signed commit or the wrapper refuses to
   run.
5. **Secrets.** `cp .env.example .env`, fill it, `chmod 600 .env`.
   Never commit it.
6. **Provider auth for OpenCode.** OpenCode reads OpenRouter from its
   own auth store; run `opencode auth login` once as `agent` and paste
   the same key, or export `OPENROUTER_API_KEY` in the service
   environment (the `.env` is loaded by `EnvironmentFile`). Verify:
   `cd /home/agent/repo && opencode run --agent build "Reply with only
   your model ID"` prints a Sonnet 5 id, and `--agent strategy` prints
   an Opus 5 id.
7. **Timers.** `sudo cp deploy/systemd/* /etc/systemd/system/`,
   `sudo systemctl daemon-reload`, then
   `sudo systemctl enable --now agent-daily.timer agent-daily-2.timer
   agent-daily-3.timer agent-weekly.timer`. Slots 2 and 3 exit
   immediately unless `cadence_per_day` in `STATE.md` allows them.
8. **Dry run.** Fund OpenRouter with $2, set the key limit to $2, run
   `scripts/run_session.sh daily` by hand as `agent`, read the log,
   read the commit. Confirm `LEDGER.md` got a token row from
   `ledger_costs.py`. Then raise the key limit to the operating budget.
9. **Revocation drill.** Before Day 0, prove in under five minutes that
   you can: disable the OpenRouter key, revoke the deploy key, revoke
   the Cloudflare token, and stop the timers
   (`sudo systemctl disable --now 'agent-*'`). If any step fails, do
   not launch.
10. **Day 0.** Run `scripts/run_session.sh weekly` by hand once to
    produce the opportunity portfolio, read `DECISIONS.md`, and let
    the timers take over.

## Identity setup notes (from the August 25 design session)

- The Owner holds the inbox; the agent never gets inbox credentials,
  recovery settings, or the 2FA device. Recovery points at the Owner's
  primary email.
- Host the inbox independently of the project domain (Gmail, Fastmail,
  Proton). An address at the project domain is a circular dependency:
  if the agent breaks MX records the identity goes with it.
- Plus-addressing for every service (`name+cloudflare@`, `+openrouter@`,
  `+github@`) so a leak is attributable to one account.
- Name the operator, not the product: short, pronounceable, no
  numbers or hyphens, no "AI" in the name, no reference to the domain.
  Say it aloud as "hello, this is <name>" and check the matching .com
  is not held by a real company.
- Cloudflare stays on the free tier. A paid plan is a recurring charge
  and forfeits the hard stop.
- Terms of service and a liability disclaimer go on the site before
  the first dollar. Standing approval row 1 already requires it.
