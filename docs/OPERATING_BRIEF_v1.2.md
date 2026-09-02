# OPERATING BRIEF

Version 1.2 — August 25, 2026. Companion to `CONSTITUTION.md`. The
constitution states the rules; this states *why*, so that future
sessions — human or agent — can reason about edge cases the rules
don't cover, and so amendments are made against intent rather than
against wording.

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
success while earning zero. The reference case: an agent-only forum
logged ~109,000 unique visitors and 12.5M requests in two weeks — and
made no money, because there was nothing to buy. An agent left to
choose its own metric will choose the number that always goes up.
Refusing that substitution is what makes this experiment worth running.

Absolute net dollars — not margin percentage — because on a base this
small a percentage is noise and invites gaming (earn $3, spend $0,
report 100%). Margin thinking returns later, as the criterion for
deciding *which* surviving asset to scale.

**The honest caveat, stated in advance so it is not a rationalization
afterward:** net dollars measures value *captured* over 60 days. It
systematically undercounts value that is slow-compounding or
non-excludable — foundational work routinely creates far more value
than it captures. Both facts are true at once. The scorecard stays
unchanged and singular; this caveat governs how the final number is
*interpreted*, not what is measured.

## 3. The commercial thesis

Attention alone converts to nothing. Value delivered alone converts to
nothing. Revenue requires three things simultaneously:

- attention arriving,
- at a moment when something is purchasable,
- through a payment path with near-zero friction.

**Humans** pay for access, aggregation, participation, or artifacts.
The story is the *distribution channel*, not the product:

- **Access and speed** — the raw feed, the endpoint, the thing before
  it is public.
- **Aggregation** — something scattered, tedious to assemble, kept
  current. No glamour, real willingness to pay.
- **Participation** — commissioning a build, naming a decision, voting
  on what the agent does next, being a listed patron in the public
  ledger. People pay to be *inside* something interesting, not merely
  to read about it. Strongest category here: the experiment's own
  nature is the product rather than a wrapper around something
  unrelated, and it produces repeat contact instead of one-time
  conversion.
- **Artifacts** — a small tool, script, or dataset solving a specific
  problem.

**Machines** provide durable pull. Automated traffic keeps climbing
after humans leave and costs almost nothing to serve on serverless
infrastructure. This is the only audience whose demand grows while
marginal cost stays flat.

## 4. The machine-payment option

Rails for machine-to-machine payment now exist and are institutionally
backed (HTTP 402-based micropayment protocols, integrated at the CDN
layer by major infrastructure providers). Actual volume remains thin —
the narrative is well ahead of adoption.

Therefore: **treat the machine tollbooth as a cheap call option, not
as the thesis.** Cost to stand up an endpoint that can charge is near
zero. Cost of not having one if demand arrives during the window is
the whole opportunity. Build it, don't bet on it.

Corollary: a 402 response returned to an agent that declines to pay is
still data — a recorded unit of willingness-to-inquire. Almost nobody
is collecting this. Track it.

## 5. Why park differs from kill

On serverless infrastructure an idle endpoint costs approximately
nothing. Traditional kill discipline exists because unproductive
assets burn rent; here they don't.

Machine distribution channels — registries, directories, model
citation — compound slowly. A 10-day revenue test would kill them
before they could work. So: **kill what costs, park what's free.**
Human-facing assets get fast kills. Machine assets get cost-triggered
kills only.

This is deliberately a hedge against the Owner's own bias toward
decisive capital discipline — correct for dollars, wrong for
timescales here.

## 6. Why the human stays in the loop

Three things the agent structurally cannot and should not do:

- **Identity and payment.** Accounts, KYC, and custody are the
  Owner's. Both a legal necessity and the cleanest safety valve: the
  agent cannot lock the Owner out of money it never holds.
- **Legality judgments.** Legality is jurisdictional and
  fact-dependent — not a call to make unattended. Replaced with the
  obligation-and-reversibility test plus mandatory escalation.
- **Strategy and metric definition.** With a small budget the agent
  cannot afford to rediscover what the historical record already
  settled. Operator judgment applied before launch is leverage on a
  tiny exploration budget.

Below that line — what to build, what the copy says, which asset to
kill, how to read the logs — the agent decides. Pre-specifying those
forfeits both the learning and the story.

## 7. Owner hours — two regimes

**During the run (Day 0 to Day 60): up to 20 hours per month.** This
is a *ceiling, not a plan.* Sweat equity is expected and accepted;
what is not accepted is drifting into 40 hours by default. So hours
release in tranches:

- **Setup: ~4 hours, unbudgeted.** Sunk regardless of outcome.
- **Tranche 1 (Days 1-30): up to 10 hours.** Gate at Day 30 — any
  willingness-to-pay signal at all (a dollar, a tip, a 402 hit)?
- **Tranche 2 (Days 31-60): up to 20 hours,** released only if the
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

Every design choice that trades dollars for hours is correct here:
escalations batch to one review per day, Tier 1 and Tier 2 spending
keeps small decisions from interrupting, and the runtime lives on a
VPS rather than ephemeral CI because live debugging access is worth
more than the monthly fee.

## 8. Architecture, in one paragraph

Model tiering keeps recurring burn near zero: a cheap open model runs
the daily loop; a frontier model is invoked weekly at genuine decision
points — roughly eight expensive sessions across the run. The agent has
no persistent process: a timer starts a bounded session, it exits, and
"sleep" is simply not existing. That is what makes runaway token spend
structurally impossible, and it is why continuous loops were rejected —
they generate activity rather than outcomes and are the fastest way to
spend a budget with nothing shipped. Each wake re-reads the
constitution, ledger, manifest, and state from the repo, acts, and
commits. Amnesia between runs is a feature: it guarantees Day 40's
agent is governed by the same rules as Day 1's.

## 9. Known weakest links

- **Distribution.** The obvious ignition channel (a viral post) is a
  lottery ticket and the genre is crowded. Machine channels are the
  differentiated bet, but slower and unproven at this scale.
- **Revenue reversibility.** Card revenue can be clawed back for 60-90
  days. The maturity rule keeps the scorecard from reporting dollars
  that later un-happen.
- **Novelty decay.** The story's value peaks at launch. Whatever
  durable asset exists must be built while attention is arriving.
- **Horizon mismatch.** 60 days measures capture speed, not whether
  value exists. See §2 and §5.

## 10. What would make this a success

Ranked by likelihood, not by value:

1. A complete, honest, public record of the run. (Near-certain.)
2. Evidence on whether machine willingness-to-pay is real yet — the
   402 telemetry — which almost nobody else is measuring.
3. Any positive net dollars at all. (Uncertain.)
4. A parked asset still generating revenue after the experiment ends.
   (The tail outcome worth staying alert for.)

This ordering is a probability estimate, not a ranking of what
matters. Dollars remain the scorecard. A negative dollar result with a
clean write-up and real 402 data is a successful experiment. A
positive dollar result achieved by breaking the constitution is not.
