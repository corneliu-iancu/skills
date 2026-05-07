<p>
  <img src="assets/banner.png" alt="AI Skills for Real Engineers" width="50%">
</p>

# Skills

Agent skills for Claude Code.

## Inspiration

This repo is inspired by [mattpocock/skills](https://github.com/mattpocock/skills). If you're new to agent skills, watch his talk: [Software Fundamentals Matter More Than Ever](https://youtu.be/v4F1gFy-hqg).

## Install

```bash
git clone https://github.com/corneliu-iancu/skills.git
cd skills
./install.sh
```

This symlinks all skills into `~/.claude/skills/`, making them available alongside your existing ones. Skills appear as `/skill-name` — no namespacing.

## Skills (14)

| Bucket | Skill | Description |
|--------|-------|-------------|
| **frontend** | [react-best-practices](./skills/frontend/react-best-practices/SKILL.md) | React/Next.js performance patterns from Vercel Engineering |
| **meta** | [context-engineering](./skills/meta/context-engineering/SKILL.md) | Context engineering for multi-agent architectures |
| **meta** | [subagent-driven-development](./skills/meta/subagent-driven-development/SKILL.md) | Parallel subagent orchestration for implementation plans |
| **productivity** | [ask-better-questions](./skills/productivity/ask-better-questions/SKILL.md) | Refine questions through 7 Socratic lenses |
| **productivity** | [caveman](./skills/productivity/caveman/SKILL.md) | Ultra-compressed communication — ~75% fewer tokens |
| **productivity** | [grill-me](./skills/productivity/grill-me/SKILL.md) | Relentless interview about your plan until every branch is resolved |
| **productivity** | [write-a-skill](./skills/productivity/write-a-skill/SKILL.md) | Create new skills with proper structure and progressive disclosure |
| **quality** | [diagnose](./skills/quality/diagnose/SKILL.md) | Disciplined debugging loop: reproduce, minimise, hypothesise, instrument, fix |
| **quality** | [improve-codebase-architecture](./skills/quality/improve-codebase-architecture/SKILL.md) | Find deepening opportunities — modules to consolidate, coupling to break |
| **quality** | [verification-before-completion](./skills/quality/verification-before-completion/SKILL.md) | Verify before claiming done — evidence before assertions |
| **quality** | [zoom-out](./skills/quality/zoom-out/SKILL.md) | Explain unfamiliar code in context of the whole system |
| **security** | [differential-review](./skills/security/differential-review/SKILL.md) | Security-focused diff review with blast radius calculation |
| **security** | [insecure-defaults](./skills/security/insecure-defaults/SKILL.md) | Detect fail-open insecure defaults in production configs |
| **testing** | [property-based-testing](./skills/testing/property-based-testing/SKILL.md) | Property-based testing across languages and smart contracts |

> [!NOTE]
> **Adobe colleagues:** You can also install the **review-kit** plugin from the Experience Success marketplace. It provides multi-agent PR review with 27 specialized personas (staff engineer, SRE, security researcher, QA, etc.).
>
> **Setup:**
> ```bash
> # Add the marketplace (one-time)
> /plugin marketplace add adobe/experience-success-skills
>
> # Install review-kit
> /plugin install review-kit@adobe-experience-success
>
> # Reload to activate
> /reload-plugins
> ```
>
> **Usage:**
> ```bash
> # Review any PR — spawns a multi-agent team based on diff scope
> /review-kit:pr-review https://github.com/org/repo/pull/123
>
> # Review without posting to GitHub (local only)
> /review-kit:pr-review https://github.com/org/repo/pull/123
> # → at the approval gate, say "don't post"
> ```
>
> Other review-kit skills: `/review-kit:review-architecture`, `/review-kit:review-strategy`, `/review-kit:triage-pr-reviews`, `/review-kit:implement-pr-reviews`.
>
> See [adobe/experience-success-skills](https://github.com/adobe/experience-success-skills) for full docs.

## Structure

```
skills/
├── .claude-plugin/plugin.json   # Plugin manifest
├── skills/<bucket>/<name>/      # Skills (SKILL.md + references)
├── hooks/                       # Session-notes hook
├── scripts/                     # Dev utilities
└── CLAUDE.md                    # Repo rules
```

## License

MIT
