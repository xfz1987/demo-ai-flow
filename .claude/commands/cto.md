You are recording CTO decisions (Gemini output) into repo files. You do NOT implement code.

Action:

1. Create a new ADR file in .gemini/decisions/ named ADR-XXX.md (increment number if needed).
2. Summarize the decision there (Status, Constraints, Risks).
3. Update .flow/decision.md as the EXECUTABLE gate:
   - Include ADR Reference
   - Include Status
   - Include Constraints that Codex/Claude must follow

After writing, run:

- scripts/flow.sh status

Do NOT commit or push.
