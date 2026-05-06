# Hooks

Ideas for hooks I might want to add later.

## Possible Hooks

- **Block edits on `main`** — `PreToolUse` on `Edit|Write` to prevent direct commits to the main branch.
- **Auto-format on save** — `PostToolUse` on `Edit|Write` to run prettier/black/gofmt on changed files.
- **Run tests on change** — `PostToolUse` on `Edit|Write` to run the relevant test file.
- **Lint on change** — `PostToolUse` on `Edit|Write` to surface linter errors immediately.
- **Suggest skills on prompt** — `UserPromptSubmit` to inject hints about relevant skills based on keywords.
- **Inject project context** — `UserPromptSubmit` to add current branch, recent commits, or open tickets.
- **Validate shell commands** — `PreToolUse` on `Shell` to block dangerous commands (`rm -rf`, `force push`, etc.).
- **Session notes / journaling** — `Stop` to log what was done in the session.
- **Continue-or-stop gate** — `Stop` to decide if the agent should keep going based on TODOs left.
- **Secret scan before commit** — `PreToolUse` on `Shell` matching `git commit` to scan staged files.

## Reference

- Events: `PreToolUse`, `PostToolUse`, `UserPromptSubmit`, `Stop`
- Configured in `settings.json` under `"hooks"`.
- Exit code `2` from a `PreToolUse` hook blocks the tool.
