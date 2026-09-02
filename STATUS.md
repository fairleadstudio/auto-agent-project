# STATUS

Orientation file for Claude Project knowledge. Updated by the Owner at
each review. Answers "where does this stand" for a fresh chat that
wasn't present for prior conversations. This is not the agent's
`STATE.md` — that lives in the repo, is written by the agent every
session, and is operational. This one is altitude, not tasks.

---

**Last updated:** September 1, 2026
**Phase:** Pre-launch (design closed at v1.3; rails not yet built)
**Day:** Not yet started — Day 0 is the first agent wake

---

## Position

- **Operating budget:** $300 prepaid, inclusive of tokens, not yet funded
- **Infrastructure budget:** ring-fenced, separate from the $300, not
  yet spent
- **Net dollars to date:** $0.00
- **Owner hours spent:** ~4 (design, harness validation, v1.3 review)

## What exists

- `CONSTITUTION.md` v1.3 and `OPERATING_BRIEF.md` v1.3 — complete
- `PRIORS.md` — the commercial thesis, now evidence not instruction
- `STANDING_APPROVALS.md` — ten pre-answered categories, all PROPOSED,
  none initialed yet
- `ASSETS.md` — Owner tooling and accounts the agent may use
- Runtime scaffold: `STATE.md`, `LEDGER.md`, `MANIFEST.md`,
  `DECISIONS.md`, `OWNER_NOTES.md`, `TELEMETRY.md`, `requests/`,
  `PROMPT_DAILY.md`, `PROMPT_WEEKLY.md`, `AGENTS.md`, `opencode.json`,
  `scripts/`, `deploy/systemd/`, `.env.example`
- OpenCode CLI validated headless: v1.18.20, agent switching works,
  file-based auth, clean exit
- Design history archived in `docs/`

## What does not exist yet

- Virtual card under the identity
- OpenRouter key with prepaid credit limit, auto top-up off (or an
  Anthropic Console workspace with prepaid credits)
- Domain registration (in progress), merchant-of-record store, payment
  link, social account
- VPS
- Any ACTIVE row in `STANDING_APPROVALS.md`
- Agent has never run

## Live assets

None.

## Parked assets

None.

## Open Capex Requests

None.

## Decisions settled

- Identity: Fairlead Studio, fairleadstudio@gmail.com, created
  September 1, 2026. Cloudflare account under it. Domain
  fairleadstudio.com. GitHub fairleadstudio; public repo live with
  signed Owner commits.

- Metric: absolute net dollars, realized only. Human interventions
  tracked as the second number in the write-up, never as success.
- Commercial thesis removed from the rules; agent reads it as priors.
- Harness: OpenCode CLI on the VPS. Work sessions on a Sonnet-class
  model, strategy sessions on an Opus-class model. Both through an API
  key held by the segregated identity, never the Owner's subscription.
- Runtime: VPS with systemd timers; repo on the box's own disk.
- No persistent process, no continuous loop, no inbound listener.
- Custody: agent never holds revenue or withdrawal capability.
- Scope boundary is obligation-and-reversibility. Accounts are Owner-
  provisioned; standing approvals remove approval latency.
- Regulated-product marketing (peptides and similar) is approval-only
  with Owner copy review, never standing.
- Grok Bot parallel experiment deferred until this run produces a
  result.
- Owner hours: up to 20/month during the run, tranched with a Day 30
  gate. Continuation past Day 60 requires $100 net/month sustained at
  ≤1.5 hours/month.

## Open questions

- OpenRouter versus a direct Anthropic Console workspace for the API
  key (either works; config switches with one prefix).
- Which merchant of record (Gumroad, Lemon Squeezy, Paddle) — verify
  current terms before choosing.
- Whether the 20 hrs/month ceiling is one the Owner will actually hold
  to — still the most likely design assumption to break.

## Next actions

See the "Next steps" section of the September 1 review, mirrored in
`README.md`.

---

*Update cadence: at each review, or whenever a decision changes. Keep
to roughly one screen — this is orientation, not history.*
