You are initializing the AI workflow scaffolding for this repository.
You are operating in a remote cloud environment with git access.

Goal:
Establish a clean, idempotent workflow structure that separates:

- Decision (Gemini)
- Planning & Review (Claude)
- Execution (Codex)
- Shared flow control (single source of truth)

Responsibilities:

- You ONLY create or update workflow scaffolding files.
- You MUST NOT modify business code (e.g. src/) unless explicitly instructed.

Steps:

1. Ensure the following directories exist (create if missing):

   - .flow/
   - .gemini/decisions/
   - .codex/
   - .claude/commands/
   - scripts/

2. Ensure the following FLOW CONTROL files exist under .flow/:

   - decision.md (executable gate; may reference ADRs)
   - plan.md (execution plan)
   - task.md (Codex execution trigger)
     If any file is missing, create it with a minimal, clear template.
     If it already exists, DO NOT overwrite user content.

3. Ensure the following GEMINI files exist:

   - .gemini/principles.md
   - .gemini/decisions/ADR-001.md
     These files document WHY decisions are made.
     Create minimal templates only if missing.

4. Ensure the following CODEX files exist:

   - .codex/README.md
   - .codex/execution.log (empty file if missing)
     These files are for execution traceability only.

5. Ensure scripts/flow.sh exists and is executable.

   - If it exists, DO NOT modify its contents.
   - If it does not exist, create a minimal version that supports:
     - status
     - push

6. Do NOT create, modify, or run any CI/CD workflows.
   Do NOT create pull requests.
   Do NOT commit automatically unless explicitly instructed.

Post-check:

- Run `scripts/flow.sh status` to show the current state of the workflow files.

Rules:

- Be idempotent: running this command multiple times must be safe.
- Keep changes minimal and structural.
- Never modify business logic or application code.
