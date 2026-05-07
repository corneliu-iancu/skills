#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS_DEST="$HOME/.claude/skills"

mkdir -p "$SKILLS_DEST"

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
echo "Done. Skills from $REPO_DIR are now available in Claude Code."
