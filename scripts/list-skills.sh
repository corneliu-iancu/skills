#!/usr/bin/env bash
set -euo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"

cd "$REPO"
echo "=== Skills ==="
find skills -name SKILL.md | sed 's|/SKILL.md||' | sort
echo ""
echo "=== Agents ==="
find agents -name "*.md" -not -name "README.md" | sort
