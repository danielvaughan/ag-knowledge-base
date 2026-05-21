# CLI Tutorials — MCP Server Setup

## Source

https://google-gemini.github.io/gemini-cli/docs/cli/tutorials.html

## Overview

The tutorials page contains step-by-step guides for setting up MCP servers with
the Gemini CLI. The primary example uses the GitHub MCP server.

## MCP Server Setup — GitHub MCP Server

### Prerequisites

- Docker installed and running
- GitHub Personal Access Token (PAT) with necessary scopes

### Configuration

In your project's root directory, create or open `.gemini/settings.json`:

```json
{
  "mcpServers": {
    "github": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "-e",
        "GITHUB_PERSONAL_ACCESS_TOKEN",
        "ghcr.io/github/github-mcp-server"
      ],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "${GITHUB_PERSONAL_ACCESS_TOKEN}"
      }
    }
  }
}
```

### GitHub Token Setup

Set the GitHub PAT as an environment variable:

```bash
GITHUB_PERSONAL_ACCESS_TOKEN="pat_YourActualGitHubTokenHere"
```

> **Security note:** Use a fine-grained access token that does not share access to
> both public and private repositories. A broadly scoped token can lead to
> information leakage from private repositories into public ones.

### Launch and Verify

When you launch Gemini CLI, it automatically reads your configuration and launches
the GitHub MCP server in the background. Use natural language prompts to interact
with the GitHub MCP server:

> "get all open issues assigned to me in the 'foo/bar' repo and prioritize them"

## Important Notes

- Always trust the source of any third-party MCP server.
- Third-party server usage is at your own risk.
- The GitHub MCP server provides tools for creating issues, commenting on pull
  requests, and other repository interactions.
