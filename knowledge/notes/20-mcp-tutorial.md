# MCP Server Setup Tutorial

> **Note:** Antigravity 2.0 is Google's codename for the next-generation agentic
> development platform. The current public-facing implementation is distributed as
> **Gemini CLI** (`@google/gemini-cli`). This note tracks the authoritative public
> information available as of **2026-05-20**.

## Overview

The Gemini CLI documentation includes a tutorial for setting up an MCP server, using
the GitHub MCP server as the primary example. This provides a practical walkthrough
for enabling GitHub repository interactions within the CLI.

Source: [Tutorials — Setting up a Model Context Protocol (MCP) server](https://google-gemini.github.io/gemini-cli/docs/cli/tutorials.html)

> **Caution:** Before using a third-party MCP server, ensure you trust its source and
> understand the tools it provides. Your use of third-party servers is at your own
> risk.

## Prerequisites

- **Docker:** Install and run Docker.
- **GitHub Personal Access Token (PAT):** Create a new classic or fine-grained PAT
  with the necessary scopes.

> **Caution:** Using a broadly scoped personal access token that has access to personal
> and private repositories can lead to information from private repositories being
> leaked into public repositories. Use a fine-grained access token that does not share
> access to both public and private repositories.

## Configuration

Add the `mcpServers` configuration block in your `.gemini/settings.json` file:

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

## Environment Setup

Export the GitHub PAT as an environment variable:

    GITHUB_PERSONAL_ACCESS_TOKEN="pat_YourActualGitHubTokenHere"

The `mcpServers` configuration references this variable, which Gemini CLI uses when
launching the GitHub MCP server.

## Verification

When you launch Gemini CLI, it automatically reads the configuration and launches the
GitHub MCP server in the background. You can then use natural language prompts to
perform GitHub actions, such as:

    get all open issues assigned to me in the 'foo/bar' repo and prioritize them

## Distinction from MCP Server Reference

This tutorial is distinct from the MCP server reference page (note 06), which
provides technical documentation on MCP transports (stdio, HTTP, SSE) and server
configuration options. The tutorial specifically walks through setting up the GitHub
MCP server as a concrete, end-to-end example.
