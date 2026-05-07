Skills are organized into bucket folders under `skills/`:

- `meta/` — agent orchestration, context engineering
- `productivity/` — non-code workflow tools
- `quality/` — debugging, architecture, verification
- `security/` — vulnerability detection, secure defaults

Every skill in a non-empty bucket must have an entry in `.claude-plugin/plugin.json` and a line in the top-level `README.md`. Each bucket folder has a `README.md` listing its contents.

Each skill is a folder containing `SKILL.md` (with YAML frontmatter: `name`, `description`). Reference files and scripts live as siblings, loaded on demand.
