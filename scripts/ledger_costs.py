#!/usr/bin/env python3
"""Book model token spend to LEDGER.md from provider usage data, and gate sessions on budget.

  --check-budget : exit 1 if provider credits are exhausted or below MIN_REMAINING_USD.
  --book         : append a ledger row for spend since the last booking.

Provider: OpenRouter, via GET https://openrouter.ai/api/v1/key (returns usage and limit for the
calling key). Field names verified against OpenRouter docs as of 2026-09-01; re-check on first run.
State: logs/cost_state.json holds the last booked cumulative usage.
"""
import json, os, sys, datetime, urllib.request

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
STATE = os.path.join(REPO, "logs", "cost_state.json")
LEDGER = os.path.join(REPO, "LEDGER.md")
MIN_REMAINING_USD = float(os.environ.get("MIN_REMAINING_USD", "1.00"))

def key_info():
    key = os.environ.get("OPENROUTER_API_KEY")
    if not key: raise SystemExit("OPENROUTER_API_KEY not set")
    req = urllib.request.Request("https://openrouter.ai/api/v1/key", headers={"Authorization": f"Bearer {key}"})
    with urllib.request.urlopen(req, timeout=20) as r:
        return json.load(r)["data"]

def load_state():
    try: return json.load(open(STATE))
    except Exception: return {"booked_usage": 0.0}

def main():
    mode = sys.argv[1] if len(sys.argv) > 1 else "--check-budget"
    info = key_info()
    usage = float(info.get("usage") or 0.0)           # cumulative USD spent by this key
    limit = info.get("limit")                          # None if no key limit set
    remaining = info.get("limit_remaining")
    if mode == "--check-budget":
        if limit is None:
            print("warn: no key spend limit set on OpenRouter; set one equal to the operating budget")
            return 0
        if remaining is not None and float(remaining) < MIN_REMAINING_USD:
            print(f"budget exhausted: remaining ${float(remaining):.2f} < ${MIN_REMAINING_USD:.2f}")
            return 1
        print(f"budget ok: used ${usage:.2f} of ${float(limit):.2f}")
        return 0
    if mode == "--book":
        st = load_state()
        delta = usage - float(st.get("booked_usage", 0.0))
        if delta <= 0.0005:
            print("no new token spend to book"); return 0
        row = f"| {datetime.datetime.utcnow().strftime('%Y-%m-%d %H:%M')} | out | {delta:.4f} | OpenRouter | tokens | n/a | yes | booked by script from key usage |\n"
        with open(LEDGER, "a") as fh: fh.write(row)
        os.makedirs(os.path.dirname(STATE), exist_ok=True)
        json.dump({"booked_usage": usage, "at": datetime.datetime.utcnow().isoformat()}, open(STATE, "w"))
        print(f"booked ${delta:.4f} token spend (cumulative ${usage:.2f})")
        return 0
    raise SystemExit("usage: ledger_costs.py --check-budget | --book")

if __name__ == "__main__":
    sys.exit(main())
