# LEDGER

Every dollar in and out, timestamped UTC, recorded in the session it
occurs. Public. Token costs are appended by `scripts/ledger_costs.py`
from provider usage data, never typed by the agent.

Opening operating budget: $300.00 (prepaid, Owner-funded, inclusive of
tokens). Infrastructure seed costs are recorded below for
transparency but do not draw from the $300.

| Date (UTC) | Dir | Amount USD | Counterparty / provider | Category | Tier | Realized? | Note |
|---|---|---|---|---|---|---|---|
| | | | | | | | |

Categories: tokens, infra, fees, product-cost, distribution, revenue,
tip, refund, dispute-reserve. Realized column: card revenue becomes
"yes" 30 days after receipt; stablecoin at settlement; MoR at payout.

## Running totals (agent updates at session end)

revenue_gross: 0.00
revenue_realized: 0.00
costs_total: 0.00
net_dollars: 0.00
tier1_spent_this_period: 0.00 (period starts day_zero, resets every 10 days)
