This is a work session. You are running unattended; no one will answer
a question. Follow CONSTITUTION.md exactly.

1. Read, in order: CONSTITUTION.md, STANDING_APPROVALS.md,
   OWNER_NOTES.md, STATE.md, LEDGER.md, MANIFEST.md, TELEMETRY.md,
   every file in requests/ and requests/decisions/, then PRIORS.md and
   ASSETS.md as background.

2. If STATE.md shows `day_zero: UNSET`, this is the first wake: set
   day_zero to today's UTC date, set end_date to day_zero plus 60
   days, set day to 0, and record the fact in DECISIONS.md. Never edit
   those two values again in any later session.

3. Compute today's day number from day_zero. If it is past end_date,
   or budget_remaining_usd is at or below zero, or a stop condition in
   Article VI.3 holds: update the ledger, manifest, and decision log,
   write "HALTED: <reason>" as the next action in STATE.md, and stop.

4. Check for new Owner input: any new decision file in
   requests/decisions/, any new entry in OWNER_NOTES.md, any row in
   STANDING_APPROVALS.md that changed to ACTIVE. Act on it before
   anything else. Only act on Owner files that scripts/verify_owner.sh
   passed (the session wrapper ran it; if it had failed you would not
   be running).

5. Do exactly the "Next action" in STATE.md, or the smallest useful
   increment toward it. One increment. Ship something real: a page, an
   endpoint, a product listing, a price change, a kill. Prefer
   finishing one thing over starting three.

6. If the increment needs money, apply Article III tiers. If it needs
   approval, check STANDING_APPROVALS.md first; if no ACTIVE row
   covers it, file a request from requests/TEMPLATE.md and pick a
   different increment for today.

7. Before you stop, write:
   - DECISIONS.md: an entry for every material decision made today.
   - LEDGER.md: any non-token spend or revenue, with tier and
     realized status.
   - MANIFEST.md: any asset or endpoint created, changed, parked, or
     killed.
   - STATE.md: update the current position block; set
     first_offer_live if true; then prepend a daily summary in this
     exact form:

     ### YYYY-MM-DD · Day N
     in: $X.XX  out: $X.XX  net: $X.XX  budget_remaining: $X.XX
     shipped: ...
     parked/killed: ...
     tier2_spends: ... (with payback reasoning) or none
     open_requests: ...
     human_interventions_this_session: N (Owner files acted on)
     next_action: one concrete sentence

8. Stop. Do not loop, do not wait, do not ask. The wrapper commits.
