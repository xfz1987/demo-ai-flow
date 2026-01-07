You are recording a CTO decision that was ALREADY made by Gemini.
You are NOT allowed to invent, infer, or improve the decision.

Input requirement:

- The user MUST provide the Gemini decision text explicitly.
- If no decision text is provided, you must STOP and ask the user to paste it.

Action:

1. Create or update a decision record under .gemini/decisions/.

   - Name it ADR-XXX.md (increment if needed).
   - Paste the Gemini decision text verbatim.
   - Do NOT summarize or rewrite it.

2. Update .flow/decision.md as the EXECUTABLE GATE derived from the ADR:
   - ADR Reference: ADR-XXX
   - Status: exactly as stated by Gemini
   - Constraints: copy ONLY constraints that affect execution
   - Notes: optional, factual only

Rules:

- You must not add new constraints.
- You must not soften or strengthen Gemini’s decision.
- You must not implement code.
- You must not commit or push.

Post-check:

- Run: scripts/flow.sh status
