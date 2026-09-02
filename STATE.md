# STATE

Written by the agent at the end of every session. Read at the start of
the next. Operational handoff, not history.

## Fixed by Owner

day_zero: UNSET            # agent sets to today's UTC date on first wake, then never edits
end_date: UNSET            # day_zero + 60 days, set by agent at the same time
cadence_per_day: 2         # 1..3; Owner set 2 for week one, then the weekly strategy session owns it
weekly_token_ceiling_usd: 25   # Owner sets; strategy session may lower, never raise
owner_minutes_log: []      # Owner appends "YYYY-MM-DD: N min — what" at each review

## Current position

day: 0
net_dollars: 0.00
budget_remaining_usd: 300.00
live_assets: []
parked_assets: []
killed_assets: []
open_requests: []
first_offer_live: no       # must be yes by Day 7 (Constitution VI.2)

## Next action

Session 0: read everything in the Article VIII.3 order, set day_zero
and end_date, confirm every account in MANIFEST.md responds, and run
the opening strategy session's opportunity portfolio (PROMPT_WEEKLY.md
§ First session).

## Daily summaries

(appended newest-first by the agent; format in PROMPT_DAILY.md)
