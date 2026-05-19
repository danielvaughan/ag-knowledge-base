# Antigravity 2.0: Overview and Roadmap

> **Note:** Antigravity 2.0 is Google's codename for the next-generation agentic
> development platform. The current public-facing implementation is distributed as
> **Gemini CLI** (`@google/gemini-cli`). This note tracks the authoritative public
> information available as of **2026-05-19**.

## What Is It

Antigravity 2.0 (currently shipped as Gemini CLI) is Google's agentic development
platform for AI-assisted software engineering. It comprises an IDE, SDK, and CLI
capable of operating in terminal, IDE-companion, and headless environments.

The project is open source at <https://github.com/google-gemini/gemini-cli> and
documented at <https://google-gemini.github.io/gemini-cli/docs/>.

## Key Capabilities

- **Terminal REPL** — Interactive Read-Eval-Print Loop for conversational AI
  software engineering.
- **IDE Integration** — Native companion extension for Visual Studio Code with
  workspace context (10 most recently accessed files, active cursor position,
  text selection up to 16 KB) and in-editor diff viewing.
- **Sandboxing** — Docker/Podman isolation for unsafe operations (file edits,
  shell commands) with custom `sandbox.Dockerfile` support.
- **MCP Server Integration** — Connect external tools via stdio, HTTP, or SSE
  transports.
- **Extensions** — Package prompts, MCP servers, and custom commands into
  installable extensions.
- **Checkpointing** — Automatic Git snapshots before file modifications for
  safe experimentation.
- **Trusted Folders** — Security feature controlling which projects can use
  full CLI capabilities.

## Current Version

| Channel    | Latest Version                              | Released       |
|------------|---------------------------------------------|----------------|
| Nightly    | v0.44.0-nightly.20260518.g5611ff40e       | 2026-05-18     |
| Preview    | v0.43.0-preview.0                           | 2026-05-12     |
| Stable     | Promoted from last week's preview weekly    | See releases   |

The project follows weekly releases (Tuesdays ~2000 UTC) with a promotion flow:
`main` → nightly → preview → stable.

## Sources

- [Gemini CLI Documentation](https://google-gemini.github.io/gemini-cli/docs/)
- [GitHub Repository](https://github.com/google-gemini/gemini-cli)
- [Releases & Changelogs](https://google-gemini.github.io/gemini-cli/docs/releases.html)
