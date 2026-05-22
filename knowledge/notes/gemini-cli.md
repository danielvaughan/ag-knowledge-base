# Gemini CLI

The Gemini CLI is an open-source AI agent that brings the power
of Google's Gemini models directly into the terminal. It operates
in an interactive Read-Eval-Print Loop (REPL) environment.

## Architecture

The CLI consists of:

- **Client-side Application** (`packages/cli`): The user interface
  and command handler.
- **Local Server** (`packages/core`): Manages requests to the
  Gemini API and handles tool execution.

## Core Capabilities

Gemini CLI utilizes several specialized tools to assist in
development:

- **File System Tools**: Capabilities for `read_file` and
  `write_file`.
- **Shell Tool**: Ability to run shell commands via
  `run_shell_command`.
- **Web Tools**: `web_fetch` for fetching web content and
  `google_web_search` for searching the web.
- **Memory Tool**: Uses `save_memory` to maintain context across
  sessions.
- **MCP Support**: Integration with the Model Context Protocol
  (MCP) for extended functionality.

## Key Commands

### Slash Commands (/)

Commands used for meta-level control:

- \`/bug\`: Files an issue in the Gemini CLI GitHub repository.
- \`/chat\`: Manage conversation history (e.g., \`/chat save [tag]\`,
  \`/chat resume [tag]\`, \`/chat list\`).
- \`/chat share\`: Exports the current conversation to Markdown
  or JSON.

### Chat Management

The CLI supports branching conversation states through the
`/chat` command, allowing developers to save and resume specific
dialogue contexts. Default checkpoints are stored in:

- **Linux/macOS**: `~/.gemini/tmp/<project_hash>/`
- **Windows**: `C:\Users\<Username>\.gemini\tmp\<project_hash>\`
