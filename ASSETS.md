# ASSETS — Owner capabilities available to the agent

Listed so the agent knows they exist. Using any of them is the agent's
decision and is logged in `DECISIONS.md`. None of these are
instructions. Items marked "needs Owner" require a one-line note in
`requests/` before use because they involve an account or a copy of
code the Owner must place in the repo.

## Code the Owner already has

| Asset | What it does | Location on Owner's machine | Availability |
|---|---|---|---|
| GEO audit toolkit | Scores a website for AI-search visibility, crawler access, llms.txt, schema, E-E-A-T; generates a client-ready PDF report | `/Volumes/SanDisk/AI_Projects/geo-audit/scripts/` | Needs Owner to copy into `tools/` |
| AI-visibility probe | Checks whether a brand or page is cited by AI answer engines | `geo-audit/scripts/ai_visibility.py`, `multi_platform.py` | Needs Owner |
| Review health and GBP scripts | Local-business review benchmarking and Google Business Profile checks | `geo-audit/scripts/review_health.py`, `gbp_optimization.py` | Needs Owner |
| Prospect finder | Finds small-business prospects for audits | `geo-audit/scripts/find_prospects.py` | Needs Owner; unsolicited outreach remains prohibited, so use is limited to research |
| Skills library | ~40 packaged workflows: copywriting, humanizer, PDF/DOCX/XLSX generation, video composition, SEO | `/Volumes/SanDisk/AI_Projects/skills-system/skills/` | Needs Owner to symlink selected skills |
| Sales one-pager and report generators | Produce PDFs from JSON | `geo-audit/scripts/generate_pdf_report.py`, `generate_sales_onepager.py` | Needs Owner |

## Accounts the Owner intends to provision before Day 0

Recorded in `MANIFEST.md` once created. Planned: domain and DNS
(Cloudflare free tier), static hosting and serverless functions
(Cloudflare Workers or Pages), a merchant-of-record store, a tip or
payment link, a GitHub account for the repo, an OpenRouter key with a
prepaid credit limit, one social account labeled automated. Optional
if the agent asks early: a print-on-demand account and a marketplace
seller account in the segregated identity's name.

## Domain knowledge the Owner can answer questions about

Commercial real estate brokerage and valuation; marine and yacht
services; small-business operations; factor-based portfolio analysis.
The agent may ask a question in `requests/` and the Owner may answer
in `OWNER_NOTES.md`. Financial, legal, and health advice remain
prohibited as products regardless of the Owner's knowledge.

## What is not available

The Owner's personal accounts, subscriptions, client relationships,
and contact lists. Anything requiring the Owner's professional
license.
