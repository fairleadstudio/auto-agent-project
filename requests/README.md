# requests/

Capex Requests and Owner decisions (Constitution Article V).

- The agent writes `requests/NNN-short-slug.md` from `TEMPLATE.md`,
  numbered sequentially, then continues other work.
- The Owner answers by creating `requests/decisions/NNN-short-slug.md`
  containing one of `APPROVED`, `APPROVED WITH CONDITIONS`, or
  `DECLINED` on the first line, followed by any conditions. The Owner
  commits from the Owner identity with a signed commit.
- The agent never writes under `requests/decisions/` (enforced in
  `opencode.json`).
- A request with no decision after 5 days is treated as declined.
- Answered requests stay in place as part of the public record.

Owner questions that are not spend requests (an ask for an account, a
domain-knowledge question, a proposed constitutional amendment) use the
same mechanism with `type:` set accordingly.
