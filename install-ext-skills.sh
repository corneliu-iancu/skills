#!/bin/bash
set -euo pipefail

SKILLS_DIR="$HOME/.claude/skills"

echo "=== Installing external skills to $SKILLS_DIR ==="

# -------------------------------------------------------
# 1. Fix name: fields in existing SKILL.md files
# -------------------------------------------------------
echo ""
echo "--- Fixing name: fields to include ext- prefix ---"

fix_name() {
  local file="$1"
  local old_name="$2"
  local new_name="$3"
  if [ -f "$file" ]; then
    if grep -q "^name: $old_name" "$file"; then
      sed -i '' "s/^name: $old_name/name: $new_name/" "$file"
      echo "  Fixed: $file ($old_name -> $new_name)"
    else
      echo "  Skip: $file (name already correct or different)"
    fi
  else
    echo "  MISSING: $file"
  fi
}

fix_name "$SKILLS_DIR/ext-differential-review/SKILL.md" "differential-review" "ext-differential-review"
fix_name "$SKILLS_DIR/ext-insecure-defaults/SKILL.md" "insecure-defaults" "ext-insecure-defaults"
fix_name "$SKILLS_DIR/ext-property-based-testing/SKILL.md" "property-based-testing" "ext-property-based-testing"
fix_name "$SKILLS_DIR/ext-semgrep-rule-creator/SKILL.md" "semgrep-rule-creator" "ext-semgrep-rule-creator"
fix_name "$SKILLS_DIR/ext-test-driven-development/SKILL.md" "test-driven-development" "ext-test-driven-development"
fix_name "$SKILLS_DIR/ext-verification-before-completion/SKILL.md" "verification-before-completion" "ext-verification-before-completion"
fix_name "$SKILLS_DIR/ext-systematic-debugging/SKILL.md" "systematic-debugging" "ext-systematic-debugging"
fix_name "$SKILLS_DIR/ext-subagent-driven-development/SKILL.md" "subagent-driven-development" "ext-subagent-driven-development"
fix_name "$SKILLS_DIR/ext-skill-creator/SKILL.md" "skill-creator" "ext-skill-creator"
fix_name "$SKILLS_DIR/ext-react-best-practices/SKILL.md" "vercel-react-best-practices" "ext-react-best-practices"
fix_name "$SKILLS_DIR/ext-web-design-guidelines/SKILL.md" "web-design-guidelines" "ext-web-design-guidelines"
fix_name "$SKILLS_DIR/ext-sentry-find-and-fix-bugs/SKILL.md" "find-bugs" "ext-sentry-find-and-fix-bugs"
fix_name "$SKILLS_DIR/ext-sentry-code-review/SKILL.md" "code-review" "ext-sentry-code-review"
fix_name "$SKILLS_DIR/ext-clawsec/SKILL.md" "clawsec-clawhub-checker" "ext-clawsec"
fix_name "$SKILLS_DIR/ext-clawsec/SKILL.md" "clawsec-suite" "ext-clawsec"
fix_name "$SKILLS_DIR/ext-recursive-decomposition/SKILL.md" "recursive-decomposition" "ext-recursive-decomposition"

# -------------------------------------------------------
# 2. Download missing SKILL.md files
# -------------------------------------------------------
echo ""
echo "--- Downloading missing SKILL.md files ---"

download_skill() {
  local dir="$1"
  local repo="$2"
  local path="$3"
  local new_name="$4"

  mkdir -p "$dir"

  echo "  Downloading: $repo/$path -> $dir/SKILL.md"
  gh api "repos/$repo/contents/$path" --jq '.content' | base64 -d > "$dir/SKILL.md"

  if [ -n "$new_name" ]; then
    # Fix name field in frontmatter
    sed -i '' "s/^name: .*/name: $new_name/" "$dir/SKILL.md"
    echo "    Set name: $new_name"
  fi
}

# ext-static-analysis (codeql SKILL.md)
if [ ! -f "$SKILLS_DIR/ext-static-analysis/SKILL.md" ]; then
  download_skill \
    "$SKILLS_DIR/ext-static-analysis" \
    "trailofbits/skills" \
    "plugins/static-analysis/skills/codeql/SKILL.md" \
    "ext-static-analysis"
else
  echo "  Already exists: ext-static-analysis/SKILL.md"
fi

# ext-context-engineering
if [ ! -f "$SKILLS_DIR/ext-context-engineering/SKILL.md" ]; then
  download_skill \
    "$SKILLS_DIR/ext-context-engineering" \
    "muratcankoylan/Agent-Skills-for-Context-Engineering" \
    "SKILL.md" \
    "ext-context-engineering"
else
  echo "  Already exists: ext-context-engineering/SKILL.md"
fi

# ext-clawsec (replace clawhub-checker with the main clawsec-suite)
echo "  Replacing ext-clawsec with clawsec-suite SKILL.md..."
download_skill \
  "$SKILLS_DIR/ext-clawsec" \
  "prompt-security/clawsec" \
  "skills/clawsec-suite/SKILL.md" \
  "ext-clawsec"

# -------------------------------------------------------
# 3. Download reference files for skills that have them
# -------------------------------------------------------
echo ""
echo "--- Downloading reference/supporting files ---"

download_ref() {
  local dir="$1"
  local repo="$2"
  local path="$3"
  local filename
  filename=$(basename "$path")

  mkdir -p "$dir"
  echo "  Downloading: $repo/$path -> $dir/$filename"
  gh api "repos/$repo/contents/$path" --jq '.content' | base64 -d > "$dir/$filename" 2>/dev/null || echo "    FAILED: $path"
}

# --- Trail of Bits: static-analysis references ---
echo "  ext-static-analysis references..."
for ref in build-fixes.md diagnostic-query-templates.md extension-yaml-format.md important-only-suite.md language-details.md macos-arm64e-workaround.md performance-tuning.md quality-assessment.md ruleset-catalog.md run-all-suite.md sarif-processing.md threat-models.md; do
  download_ref "$SKILLS_DIR/ext-static-analysis/references" "trailofbits/skills" "plugins/static-analysis/skills/codeql/references/$ref"
done

echo "  ext-static-analysis workflows..."
for wf in build-database.md create-data-extensions.md run-analysis.md; do
  download_ref "$SKILLS_DIR/ext-static-analysis/workflows" "trailofbits/skills" "plugins/static-analysis/skills/codeql/workflows/$wf"
done

# --- Trail of Bits: differential-review supporting files ---
echo "  ext-differential-review supporting files..."
for f in adversarial.md methodology.md patterns.md reporting.md; do
  download_ref "$SKILLS_DIR/ext-differential-review" "trailofbits/skills" "plugins/differential-review/skills/differential-review/$f"
done

# --- Trail of Bits: insecure-defaults references ---
echo "  ext-insecure-defaults references..."
download_ref "$SKILLS_DIR/ext-insecure-defaults/references" "trailofbits/skills" "plugins/insecure-defaults/skills/insecure-defaults/references/examples.md"

# --- Trail of Bits: property-based-testing references ---
echo "  ext-property-based-testing references..."
for ref in design.md generating.md interpreting-failures.md libraries.md refactoring.md reviewing.md strategies.md; do
  download_ref "$SKILLS_DIR/ext-property-based-testing/references" "trailofbits/skills" "plugins/property-based-testing/skills/property-based-testing/references/$ref"
done

# --- Trail of Bits: semgrep-rule-creator references ---
echo "  ext-semgrep-rule-creator references..."
for ref in quick-reference.md workflow.md; do
  download_ref "$SKILLS_DIR/ext-semgrep-rule-creator/references" "trailofbits/skills" "plugins/semgrep-rule-creator/skills/semgrep-rule-creator/references/$ref"
done

# --- Anthropic: skill-creator references ---
echo "  ext-skill-creator references..."
download_ref "$SKILLS_DIR/ext-skill-creator/references" "anthropics/skills" "skills/skill-creator/references/schemas.md"

# --- Recursive decomposition references ---
echo "  ext-recursive-decomposition references..."
for ref in codebase-analysis.md cost-analysis.md document-aggregation.md rlm-strategies.md; do
  download_ref "$SKILLS_DIR/ext-recursive-decomposition/references" "massimodeluisa/recursive-decomposition-skill" "plugins/recursive-decomposition/skills/recursive-decomposition/references/$ref"
done

# --- Context engineering sub-skills as references ---
echo "  ext-context-engineering references (sub-skills)..."
mkdir -p "$SKILLS_DIR/ext-context-engineering/references"
for subskill in context-fundamentals context-degradation context-compression context-optimization multi-agent-patterns memory-systems tool-design evaluation; do
  download_ref "$SKILLS_DIR/ext-context-engineering/references" "muratcankoylan/Agent-Skills-for-Context-Engineering" "skills/$subskill/SKILL.md"
  if [ -f "$SKILLS_DIR/ext-context-engineering/references/SKILL.md" ]; then
    mv "$SKILLS_DIR/ext-context-engineering/references/SKILL.md" "$SKILLS_DIR/ext-context-engineering/references/$subskill.md"
    echo "    Renamed to $subskill.md"
  fi
done

# -------------------------------------------------------
# 4. Verify installation
# -------------------------------------------------------
echo ""
echo "=== Installation Summary ==="
echo ""

for skill in ext-static-analysis ext-differential-review ext-insecure-defaults ext-property-based-testing ext-semgrep-rule-creator ext-clawsec ext-test-driven-development ext-verification-before-completion ext-systematic-debugging ext-subagent-driven-development ext-skill-creator ext-context-engineering ext-recursive-decomposition ext-react-best-practices ext-web-design-guidelines ext-sentry-find-and-fix-bugs ext-sentry-code-review; do
  if [ -f "$SKILLS_DIR/$skill/SKILL.md" ]; then
    name_field=$(grep "^name:" "$SKILLS_DIR/$skill/SKILL.md" | head -1)
    file_count=$(find "$SKILLS_DIR/$skill" -type f | wc -l | tr -d ' ')
    echo "  OK: $skill ($file_count files) - $name_field"
  else
    echo "  FAIL: $skill - SKILL.md missing"
  fi
done

echo ""
echo "Done!"
