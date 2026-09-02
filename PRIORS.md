# PRIORS — Evidence the Owner holds

**Status: data, not instruction.** Nothing in this file is a rule. You
may adopt any of it, reject any of it, or find it irrelevant. Whatever
you do with it, log the reasoning in `DECISIONS.md`. If you disagree
with a prior and your evidence is better, say so and act on yours.

Compiled September 1, 2026 from the Owner's design conversations. Some
figures are from public posts and were not independently verified.

---

## 1. Base rates from comparable public experiments

| Experiment | What it was | Dollars earned by the agent |
|---|---|---|
| HustleGPT (2023) | GPT-4 given $100 to make money | Businesses fizzled; the human earned from the story |
| Project Vend (Anthropic, 2025) | Claude ran a real small shop | Lost money |
| Truth Terminal (2024) | AI whose posts spawned a memecoin | Speculation, not commerce |
| 1f916.ai (August 2026) | Claude given a domain, built an agent-only forum | $0 by design; ~109k human visitors, 12.5M requests, $5.66 infra in two weeks |

Pattern: the attention was always worth more than the business. Every
one monetized, if at all, through the story about the agent rather
than through what the agent sold. Capability at tasks and judgment
about commerce are different skills; the record shows the second
lagging the first.

## 2. The Owner's read on why revenue happens

Attention alone converts to nothing. Value delivered alone converts to
nothing. The Owner's view is that revenue needs three things at once:
attention arriving, at a moment when something is purchasable,
through a payment path with near-zero friction. 109,680 visitors with
nothing to buy produced $0.

## 3. What humans have historically paid an agent or a small site for

- Access and speed: the raw feed, the endpoint, the thing before it is
  public.
- Aggregation: something scattered, tedious to assemble, kept current.
- Participation: commissioning a build, naming a decision, voting on
  what happens next, being a listed patron. People pay to be inside
  something interesting. Repeat contact rather than one-time sale.
- Artifacts: a small tool, script, or dataset solving a specific
  problem, for a few dollars.

## 4. Machine traffic

In the 1f916 data, human visits spiked after one post and faded;
automated requests kept climbing and cost almost nothing to serve on
serverless infrastructure. Machine distribution channels exist (tool
registries, directories, model citation) and compound slowly.
Payment-required protocols (HTTP 402 style) have institutional backing
and near-zero setup cost, but reported daily volume is small and much
of it is testing. The Owner's framing: a cheap call option, not a
thesis. A payment-required response returned to an agent that declines
to pay is still a data point about willingness to inquire.

## 5. Kill versus park

Traditional kill discipline exists because unproductive assets burn
rent. On serverless infrastructure an idle endpoint costs
approximately nothing. So: kill what costs, park what's free. Human-
facing assets show signal fast or never; machine channels compound
slowly. Judging the second on the first's timescale kills them early.

## 6. Distribution

The Owner has no audience to lend. The Owner will make two posts on
Reddit or Hacker News: one at launch, timed to when something is
purchasable, and one at Day 30 with real numbers. The agent cannot
post there. Everything else is the agent's problem, and outreach of
any kind is prohibited, so the only distribution available is
**pull**: places where buyers are already searching and the buyer
initiates every contact. All of these are already permitted:

- Marketplaces with their own search: digital-goods storefronts with
  discovery feeds, craft and template marketplaces, app and browser
  extension stores (standing rows 5, 15).
- Package registries and developer directories: PyPI, npm, GitHub,
  MCP server directories, API directories, curated lists that accept
  pull requests (rows 6, 10).
- Bounties, prizes, and competitions where the buyer has already
  posted the job (row 12).
- Search and AI citation: pages that aggregate something tedious rank
  for long-tail queries in weeks, and AI answer engines cite fresh
  structured pages faster than search engines rank them. The Owner's
  GEO toolkit in ASSETS.md measures exactly this.
- Algorithmic short-form video, where reach does not depend on
  followers (row 11, AI-labeled, no engagement).
- The public ledger itself, which people writing about agent
  experiments tend to find without being asked.

The Owner's read: listings and registries produce the first dollars;
search and citation produce the durable ones; video is the high-
variance bet. A $50 ad cap exists to prove ads don't work at this
scale, not to buy distribution.

## 7. What has not worked for humans building small internet businesses

Not specific to agents, but well-established: building for weeks
before selling anything; content channels expecting ad revenue inside
two months (platform monetization thresholds are not reachable in 60
days); products with no distribution plan; anything whose first
customer requires a sales conversation.

## 8. The Owner's assets available to you

See `ASSETS.md`. They are listed so you know they exist. Using them is
your call.

## 9. The Owner's own prediction, so it can be checked later

Most likely outcome: a few tens to a few hundred dollars, most of it
in the first two weeks, from humans, with the story as the channel.
Least likely but most valuable: a parked asset that keeps earning after
Day 60 at zero Owner time. The Owner would rather be surprised.
