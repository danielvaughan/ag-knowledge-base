#!/usr/bin/env bash
set -euo pipefail

repo_root="$(git rev-parse --show-toplevel 2>/dev/null || true)"
if [[ -z "$repo_root" ]]; then
  exit 0
fi

cd "$repo_root"

if [[ ! -f topic.yaml ]]; then
  exit 0
fi

yaml_value() {
  local key="$1"
  awk -F: -v key="$key" '
    $1 ~ "^[[:space:]]*" key "$" {
      value = $2
      sub(/^[[:space:]]*/, "", value)
      sub(/[[:space:]]*$/, "", value)
      gsub(/^"|"$/, "", value)
      print value
      exit
    }
  ' topic.yaml
}

knowledge_dir="$(yaml_value "knowledge_dir")"
article_backlog="$(yaml_value "article_backlog")"

if [[ -z "$knowledge_dir" ]]; then
  knowledge_dir="knowledge"
fi

if [[ -z "$article_backlog" ]]; then
  article_backlog="backlog.yaml"
fi

tmp_paths="$(mktemp)"
trap 'rm -f "$tmp_paths"' EXIT

git ls-files -o --exclude-standard -z -- \
  "$knowledge_dir" \
  "$article_backlog" \
  "topic-research-pod/reports/topic-research" \
  "reports/topic-research" > "$tmp_paths"

if [[ ! -s "$tmp_paths" ]]; then
  exit 0
fi

if command -v markdownlint >/dev/null 2>&1; then
  tmp_markdown_paths="$(mktemp)"
  trap 'rm -f "$tmp_paths" "$tmp_markdown_paths"' EXIT

  while IFS= read -r -d '' path; do
    case "$path" in
      *.md) printf '%s\0' "$path" >> "$tmp_markdown_paths" ;;
    esac
  done < "$tmp_paths"

  if [[ -s "$tmp_markdown_paths" ]]; then
    xargs -0 markdownlint --fix -- < "$tmp_markdown_paths"
  fi
fi

xargs -0 git add -- < "$tmp_paths"

if git diff --cached --quiet; then
  exit 0
fi

git commit -m "Add topic research findings"

if git rev-parse --abbrev-ref --symbolic-full-name '@{u}' >/dev/null 2>&1; then
  git push
else
  echo "Topic Research Pod hook: committed locally; no upstream branch configured." >&2
fi
