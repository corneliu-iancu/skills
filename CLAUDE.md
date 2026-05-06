Skills and agents are organized into bucket folders:

**Skills** (`skills/`):
- `frontend/` — UI frameworks, design patterns
- `meta/` — agent orchestration, context engineering
- `misc/` — kept around but rarely used
- `quality/` — code review, verification
- `security/` — vulnerability detection, secure defaults
- `testing/` — test methodologies

**Agents** (`agents/`):
- `frontend/` — accessibility, UI review
- `performance/` — profiling, bottleneck analysis
- `quality/` — code review, architecture review
- `security/` — penetration testing

Every skill in a non-empty bucket must have an entry in `.claude-plugin/plugin.json` and a line in the top-level `README.md`. Each bucket folder has a `README.md` listing its contents.

Each skill is a folder containing `SKILL.md` (with YAML frontmatter: `name`, `description`). Reference files and scripts live as siblings, loaded on demand.

Each agent is a single `.md` file with YAML frontmatter (`name`, `description`, `tools`, `model`).
