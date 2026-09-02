#!/usr/bin/env bash
# Verifies that the latest commit touching each Owner-only file was made by the Owner.
# Strong mode: SSH-signed commit verified against OWNER_ALLOWED_SIGNERS.
# Weak mode (no allowed_signers configured): author email must equal OWNER_EMAIL. Prints a warning.
# Exit 0 = all protected files trusted; 1 = at least one is not.
set -uo pipefail
cd "$(dirname "$0")/.." || exit 1
if [ -f .env ]; then set -a; . ./.env; set +a; fi

PROTECTED=(CONSTITUTION.md STANDING_APPROVALS.md OWNER_NOTES.md opencode.json AGENTS.md PROMPT_DAILY.md PROMPT_WEEKLY.md scripts deploy requests/decisions)
STRONG=0
if [ -n "${OWNER_ALLOWED_SIGNERS:-}" ] && [ -f "${OWNER_ALLOWED_SIGNERS}" ]; then
  git config gpg.ssh.allowedSignersFile "${OWNER_ALLOWED_SIGNERS}" 2>/dev/null
  STRONG=1
else
  echo "warn: OWNER_ALLOWED_SIGNERS not configured; falling back to author-email check (forgeable). Configure SSH commit signing before Day 0."
fi

FAIL=0
for f in "${PROTECTED[@]}"; do
  [ -e "$f" ] || continue
  SHA="$(git log -1 --format=%H -- "$f" 2>/dev/null)"
  [ -z "$SHA" ] && continue   # untracked or no history yet
  if [ "$STRONG" -eq 1 ]; then
    STATUS="$(git log -1 --format=%G? "$SHA")"
    if [ "$STATUS" != "G" ]; then echo "UNTRUSTED: $f (last commit $SHA signature status '$STATUS')"; FAIL=1; fi
  else
    EMAIL="$(git log -1 --format=%ae "$SHA")"
    if [ "$EMAIL" != "${OWNER_EMAIL:-}" ]; then echo "UNTRUSTED: $f (last commit $SHA by $EMAIL, expected ${OWNER_EMAIL:-<unset>})"; FAIL=1; fi
  fi
done
[ "$FAIL" -eq 0 ] && echo "owner verification: ok (mode=$([ $STRONG -eq 1 ] && echo signature || echo email))"
exit $FAIL
