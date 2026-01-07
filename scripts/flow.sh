#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

case "${1:-}" in
  status)
    echo "== git =="
    git status -sb
    echo
    echo "== .flow =="
    ls -la .flow || true
    echo
    echo "== decision =="
    sed -n '1,120p' .flow/decision.md 2>/dev/null || true
    echo
    echo "== plan =="
    sed -n '1,120p' .flow/plan.md 2>/dev/null || true
    echo
    echo "== task =="
    sed -n '1,160p' .flow/task.md 2>/dev/null || true
    ;;

  push)
    msg="${2:-chore: update flow files}"
    git add \
      .flow/decision.md .flow/plan.md .flow/task.md \
      .gemini/principles.md .gemini/decisions/ADR-001.md \
      .codex/execution.log \
      .claude/commands \
      scripts/flow.sh \
      .github/workflows \
      2>/dev/null || true

    if git diff --cached --quiet; then
      echo "Nothing to commit."
      exit 0
    fi

    git commit -m "$msg"
    git push
    echo "Pushed."
    ;;

  *)
    echo "Usage:"
    echo "  scripts/flow.sh status"
    echo "  scripts/flow.sh push \"commit message\""
    exit 1
    ;;
esac
