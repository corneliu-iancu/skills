#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS_DEST="$HOME/.claude/skills"
AGENTS_DEST="$HOME/.claude/agents"

mkdir -p "$SKILLS_DEST" "$AGENTS_DEST"

echo "=== Linking skills ==="
find "$REPO_DIR/skills" -name SKILL.md -not -path '*/node_modules/*' -print0 |
while IFS= read -r -d '' skill_md; do
  src="$(dirname "$skill_md")"
  name="$(basename "$src")"
  target="$SKILLS_DEST/$name"

  if [ -e "$target" ] && [ ! -L "$target" ]; then
    echo "  skip: $name (non-symlink already exists)"
    continue
  fi

  ln -sfn "$src" "$target"
  echo "  linked: $name"
done

echo ""
echo "=== Linking agents ==="
find "$REPO_DIR/agents" -name "*.md" -not -name "README.md" -print0 |
while IFS= read -r -d '' agent_md; do
  name="$(basename "$agent_md" .md)"
  target="$AGENTS_DEST/$name.md"

  if [ -e "$target" ] && [ ! -L "$target" ]; then
    echo "  skip: $name (non-symlink already exists)"
    continue
  fi

  ln -sfn "$agent_md" "$target"
  echo "  linked: $name"
done

echo ""
echo "Done. Skills and agents from $REPO_DIR are now available in Claude Code."
