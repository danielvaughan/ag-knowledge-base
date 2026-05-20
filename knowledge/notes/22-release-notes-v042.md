# Release Notes — v0.42.0

> **Note:** Antigravity 2.0 is Google's codename for the next-generation agentic
> development platform. The current public-facing implementation is distributed as
> **Gemini CLI** (`@google/gemini-cli`). This note tracks the authoritative public
> information available as of **2026-05-20**.

## Overview

v0.42.0 is the first stable release of Gemini CLI, published on 2026-05-12. It
follows the weekly promotion flow: main -> nightly -> preview -> stable.

Source: [GitHub Release v0.42.0](https://github.com/google-gemini/gemini-cli/releases/tag/v0.42.0)

## Key Changes in v0.42.0

### CLI Improvements

- **Automatic update channel safety:** Prevents automatic updates from switching to
  less stable channels (`--fix: prevent automatic updates from switching to less
  stable channels`).
- **SEA support:** Passes Node arguments via `NODE_OPTIONS` during relaunch to support
  Single Executable Application packaging.
- **DECKPAM keypad Enter sequences:** Handles keypad Enter sequences in terminal
  input for better keyboard compatibility.
- **Session deletion:** Adds `--delete` flag to `/exit` command for session deletion.
- **Platform-specific improvements:** Refines platform-specific undo/redo and smart
  bubbling for WSL.
- **InvalidStream handling:** Handles InvalidStream events gracefully without
  throwing.

### Core / API

- **OAuth subagent parsing:** Adds missing OAuth fields support in subagent parsing.
- **Model selection:** Distinguishes fallback chains and fixes maxAttempts for auto
  vs explicit model selection.
- **API timeout:** Reduces default API timeout to 60s and enables retries for undici
  timeouts.
- **A2A pushMessage:** Adds explicit empty log guard in A2A pushMessage.
- **API key validation:** Corrects API key validation logic in
  `handleApiKeySubmit`.

### ACP / Enterprise

- **ACP modularization:** Modularizes the monolithic `acpClient` into specialized files.
- **Prompt processing:** Delegates prompt turn processing logic to `GeminiClient`.

### Extension Integration

- **Extension-backed MCP client:** Fixes disconnection of extension-backed MCP
  clients in `stopExtension`.

### Other Notable Changes

- **@mention gemini robot:** Adds ability to @ mention the gemini robot in
  conversations.
- **Workspace trust:** Updates documentation workflows with workspace trust.
- **Gemma setup guide:** Adds automated Gemma setup guide documentation.
- **Proxy support:** Externalizes https-proxy-agent to fix proxy support; allows
  non-https proxy URLs for container environments.
- **Logging:** Respects `logPrompts` flag for logging sensitive fields.

### Dependencies

- Updates vulnerable dependencies.
