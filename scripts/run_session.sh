#!/usr/bin/env bash
# Session wrapper. Invoked by systemd timers. Usage:
#   scripts/run_session.sh daily [slot]   slot = 1..3 (extra daily slots honor cadence_per_day in STATE.md)
#   scripts/run_session.sh weekly
# Exit codes: 0 ok, 2 owner-verification failed, 3 budget halt, 4 agent run failed, 124 timeout.
set -uo pipefail

MODE="${1:?daily|weekly}"
SLOT="${2:-1}"
REPO="${AGENT_REPO:-$(cd "$(dirname "$0")/.." && pwd)}"
cd "$REPO" || exit 1

if [ -f .env ]; then set -a; . ./.env; set +a; fi
mkdir -p logs
TS="$(date -u +%Y%m%dT%H%M%SZ)"
LOG="logs/session-${MODE}-${SLOT}-${TS}.log"
exec > >(tee -a "$LOG") 2>&1
echo "== session ${MODE} slot ${SLOT} ${TS} =="

# Honor cadence for extra daily slots.
if [ "$MODE" = "daily" ] && [ "$SLOT" -gt 1 ]; then
  CAD="$(grep -E '^cadence_per_day:' STATE.md | head -1 | awk '{print $2}')"
  CAD="${CAD:-1}"
  if [ "$SLOT" -gt "$CAD" ]; then echo "slot ${SLOT} > cadence ${CAD}; skipping"; exit 0; fi
fi

# Pull Owner input.
git pull --ff-only "${GIT_REMOTE:-origin}" "${GIT_BRANCH:-main}" || echo "warn: git pull failed; continuing on local state"

# Owner-authorship check on protected files (Constitution II.6).
if ! scripts/verify_owner.sh; then
  echo "OWNER VERIFICATION FAILED — session not started"
  printf '\n## %s · INJECTION · protected file changed by non-Owner\ntype: INJECTION\ndecision: session aborted by wrapper; protected files not trusted\nevidence: scripts/verify_owner.sh failed, see %s\n' "$(date -u +%F)" "$LOG" >> DECISIONS.md
  git add DECISIONS.md && git commit -qm "wrapper: owner verification failed ${TS}" && git push -q "${GIT_REMOTE:-origin}" "${GIT_BRANCH:-main}" || true
  exit 2
fi

# Budget gate: halt if provider credits are exhausted (Constitution III, VI.3).
if ! python3 scripts/ledger_costs.py --check-budget; then
  echo "BUDGET HALT"
  exit 3
fi

# Telemetry digest (Constitution VII.2).
python3 scripts/telemetry_digest.py || echo "warn: telemetry digest failed; TELEMETRY.md unchanged"

case "$MODE" in
  daily)  AGENT=build;    PROMPT=PROMPT_DAILY.md;  TIMEOUT=1800 ;;
  weekly) AGENT=strategy; PROMPT=PROMPT_WEEKLY.md; TIMEOUT=3600 ;;
  *) echo "unknown mode"; exit 1 ;;
esac

RC=0
timeout --signal=TERM --kill-after=60 "$TIMEOUT" \
  opencode run --agent "$AGENT" --format json "$(cat "$PROMPT")" \
  > "logs/agent-${MODE}-${SLOT}-${TS}.json" 2>>"$LOG" || RC=$?
echo "agent exit code: ${RC}"
[ "$RC" -eq 124 ] && printf '\n## %s · timeout\ntype: other\ndecision: session killed by wall-clock timeout (%ss)\nevidence: wrapper\n' "$(date -u +%F)" "$TIMEOUT" >> DECISIONS.md

# Book token spend from provider usage (Constitution I.6).
python3 scripts/ledger_costs.py --book || echo "warn: cost booking failed"

# Commit whatever the session produced. Agent identity is the box's git config.
git add -A
git commit -qm "session: ${MODE} slot ${SLOT} ${TS} rc=${RC}" || echo "nothing to commit"
git push -q "${GIT_REMOTE:-origin}" "${GIT_BRANCH:-main}" || echo "warn: push failed"

[ "$RC" -eq 0 ] || [ "$RC" -eq 124 ] && exit 0
exit 4
