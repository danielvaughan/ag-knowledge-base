#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

export OPENAI_API_KEY="ollama"
export OPENAI_BASE_URL="http://localhost:11434/v1"

cd "$REPO_DIR"
timeout 30m codex exec --profile nanoclaw-local-coder --sandbox workspace-write \
  -c sandbox_workspace_write.network_access=true \
  "Use the topic-researcher-local subagent with the topic-research skill on this repo."
