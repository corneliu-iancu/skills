<p>
  <img src="assets/banner.png" alt="AI Skills for Real Engineers" width="100%">
</p>

# Skills

Agent skills and specialized agents for Claude Code.

## Install

```bash
npx skills@latest add corneliu-iancu/skills
```

Or clone and link manually:

```bash
git clone https://github.com/corneliu-iancu/skills.git
cd skills
```

## Skills (7)

| Bucket | Skill | Description |
|--------|-------|-------------|
| **frontend** | [react-best-practices](./skills/frontend/react-best-practices/SKILL.md) | React/Next.js performance patterns from Vercel Engineering |
| **meta** | [context-engineering](./skills/meta/context-engineering/SKILL.md) | Context engineering for multi-agent architectures |
| **meta** | [subagent-driven-development](./skills/meta/subagent-driven-development/SKILL.md) | Parallel subagent orchestration for implementation plans |
| **quality** | [verification-before-completion](./skills/quality/verification-before-completion/SKILL.md) | Verify before claiming done — evidence before assertions |
| **security** | [differential-review](./skills/security/differential-review/SKILL.md) | Security-focused diff review with blast radius calculation |
| **security** | [insecure-defaults](./skills/security/insecure-defaults/SKILL.md) | Detect fail-open insecure defaults in production configs |
| **testing** | [property-based-testing](./skills/testing/property-based-testing/SKILL.md) | Property-based testing across languages and smart contracts |

## Agents (5)

| Bucket | Agent | Description |
|--------|-------|-------------|
| **frontend** | [accessibility-tester](./agents/frontend/accessibility-tester.md) | WCAG compliance and assistive technology assessment |
| **performance** | [performance-engineer](./agents/performance/performance-engineer.md) | Bottleneck identification and profiling |
| **quality** | [architect-reviewer](./agents/quality/architect-reviewer.md) | System design and architectural pattern evaluation |
| **quality** | [code-reviewer](./agents/quality/code-reviewer.md) | Code quality, security, and best practices review |
| **security** | [penetration-tester](./agents/security/penetration-tester.md) | Authorized offensive security testing |

## Hooks

Sound notifications and session-notes summarization live in `hooks/`. See [hooks/README.md](./hooks/README.md) for configuration.

## Structure

```
skills/
├── .claude-plugin/plugin.json   # Plugin manifest
├── skills/<bucket>/<name>/      # Skills (SKILL.md + references)
├── agents/<bucket>/<name>.md    # Agent definitions
├── hooks/                       # Sound + session-notes hooks
├── sounds/                      # Audio files for hook notifications
└── CLAUDE.md                    # Repo rules
```

## License

MIT
