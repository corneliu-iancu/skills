# Hooks

Scripts that run at specific events during Claude Code execution.

## Hook Events

| Event | When It Fires | Use Case |
|-------|---------------|----------|
| `PreToolUse` | Before tool execution | Block edits on main, validate commands |
| `PostToolUse` | After tool completes | Auto-format, run tests, lint |
| `UserPromptSubmit` | User submits prompt | Add context, suggest skills |
| `Stop` | Agent finishes | Decide if Claude should continue |

## Hook Response Format

Hooks can output JSON to control behavior:

```json
{
  "block": true,           // Block the action (PreToolUse only)
  "message": "Reason",     // Message to show user
  "feedback": "Info",      // Non-blocking feedback
  "suppressOutput": true,  // Hide command output
  "continue": false        // Whether to continue
}
```

## Exit Codes

- `0` - Success
- `2` - Blocking error (PreToolUse only, blocks the tool)
- Other - Non-blocking error

## Configuration

Hooks are configured in `settings.json`:

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "\"$CLAUDE_PROJECT_DIR\"/.claude/hooks/my-hook.sh",
            "timeout": 5
          }
        ]
      }
    ]
  }
}
```

## Files in This Directory

- `session-notes-wrapper.sh` - Wrapper for session notes tracking
- `session-notes.py` - Python script for session notes
- `session-notes.conf.json` - Configuration for session notes
