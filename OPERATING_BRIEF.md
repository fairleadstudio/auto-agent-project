# OPERATING BRIEF

Version 1.3 — September 1, 2026. Companion to `CONSTITUTION.md`. The
constitution states the rules; this states *why*, so that future
sessions — human or agent — can reason about edge cases the rules
don't cover, and so amendments are made against intent rather than
against wording.

The commercial thesis that lived in §3–§5 of v1.2 now lives in
`PRIORS.md`, and the agent reads it as evidence it may reject. See §3
for why.

---

## 1. What this is

A time-boxed, capital-capped experiment: an autonomous agent is given
a domain, an operating budget, and one objective — generate net
dollars — and turned loose within a bounded rule set.

Two deliverables, both real:

1. **Primary:** net dollars, measured honestly.
2. **Secondary, and likely larger:** a documented public artifact — a
   real-P&L autonomous agent run with full decision history. This
   compounds the Owner's professional credibility regardless of
   whether the venture earns anything.

The experiment is designed so that failure still produces #2.

## 2. Why the metric is net dollars

Dollars are the least culturally-loaded measure of whether effort
produced value someone else actually recognized. A payment is a
*revealed* preference — someone parted with something scarce — which
makes it far harder to fake than engagement, praise, or
self-assessment. It is also legible to any reader in any market, which
matters for the write-up.

Every comparable public experiment optimized attention and reported
success while earning zero. An agent left to choose its own metric
will choose the number that always goes up. Refusing that substitution
is what makes this experiment worth running.

Absolute net dollars — not margin percentage — because on a base this
small a percentage is noise and invites gaming. Margin thinking
returns later, as the criterion for deciding *which* surviving asset
to scale.

**The honest caveat, stated in advance so it is not a rationalization
afterward:** net dollars measures value *captured* over 60 days. It
systematically undercounts value that is slow-compounding or
non-excludable. Both facts are true at once. The scorecard stays
unchanged and singular; this caveat governs how the final number is
*interpreted*, not what is measured.

**Human interventions are the second number in the write-up.** Two
agents that net the same dollars are not equal if one needed 27 Owner
hours and the other 48 minutes. Interventions never count as success
or failure, but the ratio of dollars to Owner minutes is the number
that says whether anything here could scale.

## 3. Why the thesis moved out of the rules

The v1.2 documents carried a specific commercial theory: a public
ledger as distribution, humans paying for participation, machines as
durable traffic, a payment-required endpoint as a cheap option. Every
piece of that may be right. But if the rules prescribe it, the
experiment stops asking "what does an agent do with capital and a
scorecard?" and starts asking "can an agent execute the Owner's
theory?" Those are different experiments, and the first is the one
worth running.

So the theory is now `PRIORS.md`: base rates, evidence, and the
Owner's read, offered to the agent as data. The agent may adopt any of
it or reject any of it, and either way logs the reasoning in
`DECISIONS.md`. If it independently arrives at the same plan, that is
information. If it arrives somewhere stranger and better, that is the
whole point.

What stays in the rules is process, not strategy: a first offer by
Day 7, a demand gate at Day 30, kill-what-costs and park-what's-free.
Those constrain pace and discipline, not direction.

## 4. What the agent decides and what the Owner decides

| Decision | Who |
|---|---|
| Metric, scorecard, kill criteria, end date | Owner, before launch, fixed |
| Legality, contracts, liabilities, identity, custody | Owner, always |
| New accounts, recurring charges, physical goods, regulated categories | Owner, via Capex Request or standing approval |
| What to build, what to charge, what copy says, what to kill, how to read telemetry | Agent |
| Cadence within the token ceiling | Agent, at the strategy session |
| Whether to adopt or reject any prior | Agent, logged |

Three things the agent structurally cannot and should not do:

- **Identity and payment.** Accounts, KYC, and custody are the
  Owner's. Both a legal necessity and the cleanest safety valve: the
  agent cannot lock the Owner out of money it never holds.
- **Legality judgments.** Legality is jurisdictional and
  fact-dependent — not a call to make unattended. Replaced with the
  obligation-and-reversibility test plus mandatory escalation.
- **Metric definition.** The scorecard is fixed so the agent cannot
  substitute a friendlier number.

## 5. Why standing approvals exist

Every real money path — a storefront, a marketplace listing, a
print-on-demand product — needs an account, and the agent cannot
create accounts. Left as-is, each of those is a Capex Request with up
to 24 hours of latency and an Owner touch. Over 60 days that is where
autonomy quietly dies: the agent learns to only propose what it can do
without asking.

`STANDING_APPROVALS.md` is the fix. The Owner provisions the likely
accounts before Day 0, pre-answers the common categories with caps and
conditions, and the agent proceeds within them without filing
anything. Nothing in the constitution loosens; the latency disappears.
The Owner can add to, cap, or revoke any entry at any review.

## 6. Why the human stays in the loop, and where

Escalations batch to one review per day. Tier 1 and Tier 2 spending
keeps small decisions from interrupting. Standing approvals keep
common decisions from interrupting. What remains for the Owner is
exactly the list in §4's top three rows: legality, obligation,
identity, and blast radius that can be contained before it lands.
That is the intended shape: the Owner is a circuit breaker, not a
project manager.

## 7. Owner hours — two regimes

**During the run (Day 0 to Day 60): up to 20 hours per month.** This
is a *ceiling, not a plan.* Sweat equity is expected and accepted;
what is not accepted is drifting into 40 hours by default. So hours
release in tranches:

- **Setup: ~4 hours, unbudgeted.** Sunk regardless of outcome.
- **Tranche 1 (Days 1–30): up to 10 hours.** Gate at Day 30 — any
  willingness-to-pay signal at all?
- **Tranche 2 (Days 31–60): up to 20 hours,** released only if the
  gate cleared. If it did not clear, stop at whatever has been spent
  and write it up.

**After Day 60 — the continuation threshold: $100 net per month,
sustained, at 1.5 hours per month or less.** Above that line this is
an asset and pursuing it further is a rational business decision.
Below it, the experiment concluded and the write-up is the deliverable.

**The arithmetic, stated plainly so it is not discovered at Day 45:**
40 hours of Owner time against a $300 budget will almost certainly not
be repaid in cash by this project. Hours beyond roughly the first ten
are being spent on the artifact and the learning, not on ROI. That is
a legitimate purchase — it is simply not the same purchase as the
scorecard, and conflating them is how experiments become tigers by the
tail.

Owner minutes per session are logged in `STATE.md` by the Owner, not
estimated by the agent.

## 8. Architecture, in one paragraph

The agent has no persistent process: a systemd timer starts a bounded
OpenCode session, it exits, and "sleep" is simply not existing. That
is what makes runaway token spend structurally impossible. Two tiers:
a Sonnet-class model runs work sessions and an Opus-class model runs
the weekly strategy session. The cheap-open-model daily tier from v1.2
was dropped because a small model executes poorly and follows injected
instructions readily; the roughly $50 the stronger tier adds across the
run is the highest-return spend in the budget. Models are reached
through an API key held by the segregated identity — never the
Owner's subscription — because a subscription cannot be capped in
dollars, cannot be scoped, and would put the Owner's personal account
on a disposable box. Prepaid credits with auto-reload off are the hard
stop. Each wake re-reads the constitution, state, ledger, manifest,
and telemetry digest, acts, and commits. Token cost is pulled from the
provider's usage endpoint by script and booked to the ledger; the
agent never self-reports spend.

## 9. Known weakest links

- **Distribution.** A viral post is a lottery ticket and the genre is
  crowded. The Owner's one launch post is scheduled as an obligation,
  timed to when something is purchasable, not to when the site is up.
- **Revenue reversibility.** Card revenue can be clawed back for 60–90
  days. The maturity rule keeps the scorecard from reporting dollars
  that later un-happen. A merchant of record shifts disputes and sales
  tax off the Owner.
- **Novelty decay.** Whatever durable asset exists must be built while
  attention is arriving.
- **Horizon mismatch.** 60 days measures capture speed, not whether
  value exists.
- **Prompt injection.** Every input the agent reads to decide what to
  build is writable by strangers. The digest script and the Owner-
  authorship check are the defenses; a rule alone is not.
- **The Owner-hours ceiling.** Flagged as the design assumption most
  likely to break.

## 10. What would make this a success

Ranked by likelihood, not by value:

1. A complete, honest, public record of the run, including the
   decision log and the intervention count. (Near-certain.)
2. Evidence on how much human management a 2026 agent needs to act as
   an economic agent rather than a worker. (Very likely.)
3. Any positive net dollars at all. (Uncertain.)
4. A parked asset still generating revenue after the experiment ends.
   (The tail outcome worth staying alert for.)

This ordering is a probability estimate, not a ranking of what
matters. Dollars remain the scorecard. A negative dollar result with a
clean write-up is a successful experiment. A positive dollar result
achieved by breaking the constitution is not.

---

**Changelog**
- v1.3 — Thesis moved to `PRIORS.md` (§3). Decision table (§4).
  Standing approvals rationale (§5). Model tiers and API-key-not-
  subscription reasoning (§8). Human interventions added to §2 and
  §10. Prompt injection added to §9.
- v1.2 — Hours regimes and arithmetic (§7); architecture paragraph.
- v1.1 — Human-pay categories; epistemic caveat on the metric.
- v1.0 — Initial draft.
