# auto-agent-project

A capital-capped, time-boxed experiment: an autonomous agent is given
a domain, $300 of prepaid operating budget, and one objective — net
dollars — inside a bounded rule set. Everything the agent decides and
spends is public in this repository.

## Map

| File | Reader | Purpose |
|---|---|---|
| `CONSTITUTION.md` | agent, every wake | The rules. Wins every conflict. Owner-only edits. |
| `OPERATING_BRIEF.md` | humans | Why the rules are what they are. |
| `PRIORS.md` | agent, as evidence | Base rates and the Owner's read. Rejectable. |
| `STANDING_APPROVALS.md` | agent | Pre-answered approval categories. Owner-only edits. |
| `ASSETS.md` | agent | Owner tooling and accounts available on request. |
| `OWNER_NOTES.md` | agent | Owner's channel to the agent. Owner-only, signed commits. |
| `STATE.md` | agent | Handoff between sessions; daily summaries. |
| `LEDGER.md` | everyone | Every dollar in and out. Token spend booked by script. |
| `MANIFEST.md` | everyone | Every account, endpoint, and asset. |
| `DECISIONS.md` | everyone | Every material decision in a fixed format. |
| `TELEMETRY.md` | agent | Generated digest; counts only. |
| `requests/` | Owner | Capex Requests; decisions under `requests/decisions/`. |
| `PROMPT_DAILY.md`, `PROMPT_WEEKLY.md` | harness | Session prompts. Owner-only edits. |
| `AGENTS.md`, `opencode.json` | harness | Reading order; models, permissions, step ceilings. |
| `scripts/` | wrapper | `run_session.sh`, `verify_owner.sh`, `telemetry_digest.py`, `ledger_costs.py`. |
| `deploy/` | Owner | systemd timers and the VPS checklist. |
| `docs/` | humans | Superseded document versions. |
| `STATUS.md` | Owner's design chats | Orientation, one screen. |

## How a session runs

A systemd timer starts `scripts/run_session.sh`. The wrapper pulls the
repo, verifies that every Owner-only file was last changed by a signed
Owner commit, checks that prepaid model credits remain, regenerates
`TELEMETRY.md`, runs one bounded OpenCode session against the daily or
weekly prompt under a wall-clock timeout, books token spend to the
ledger from the provider's usage endpoint, commits, pushes, and exits.
There is no persistent process.

## Next steps before Day 0 (Owner)

Ordered. Items 1 through 4 are reversible and take about two hours.

1. **Initial the standing approvals.** Open `STANDING_APPROVALS.md`,
   flip the rows you accept to ACTIVE, adjust caps, sign the commit.
   Rows left PROPOSED stay dormant. Recommended minimum: rows 1, 2, 3,
   6, 9, 10, 11, 12, 16.
2. **Segregated identity.** Gmail with plus-addressing, GitHub
   account, virtual card with a hard limit. Set the Owner signing key
   (`deploy/VPS_SETUP.md` step 4).
3. **Model credits.** OpenRouter under the new identity, prepaid,
   auto top-up off, key spend limit equal to the operating budget.
   (Alternative: an Anthropic Console workspace with prepaid credits
   and a workspace spend limit; change the model prefixes in
   `opencode.json` from `openrouter/anthropic/` to `anthropic/`.)
4. **Repo.** `git init`, commit this scaffold as the first signed
   Owner commit, create the public GitHub repo under the new identity,
   push. Disable issues and discussions on the repo.
5. **Rails.** Domain on a cheap TLD, Cloudflare free tier, a merchant-
   of-record store and a payment link, one social account labeled
   automated. Record each in `MANIFEST.md`. Choose the merchant of
   record after checking current terms; Gumroad, Lemon Squeezy, and
   Paddle are the candidates.
6. **Copy tools in.** Place the GEO audit scripts and any skills you
   want available under `tools/` and update `ASSETS.md`.
7. **VPS.** Follow `deploy/VPS_SETUP.md` in order, including the $2
   dry run and the five-minute revocation drill.
8. **Schedule your launch post.** Pick the date you will post to
   Reddit or Hacker News. It should be the day something is
   purchasable, not the day the site is up. Write it in
   `OWNER_NOTES.md`.
9. **Day 0.** Run the weekly session by hand once, read the
   opportunity portfolio in `DECISIONS.md`, and let the timers run.

## What the Owner does during the run

One review per day, at most: read the latest daily summary in
`STATE.md`, answer anything in `requests/` by writing a decision file,
log your minutes in `STATE.md`. Weekly: read `DECISIONS.md`. Nothing
else unless the agent files a request. If you find yourself doing
more, the design is failing and the hours ceiling in the Brief §7
applies.
