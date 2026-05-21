# Release Notes: v0.44.0 Nightly 2026-05-21

The latest observed GitHub release during this scheduled run was
`v0.44.0-nightly.20260521.g57c42a5c4`.
It was published on 2026-05-21 at 00:42:04 UTC and is marked as a prerelease.

Sources:

- [Release v0.44.0-nightly.20260521.g57c42a5c4](https://github.com/google-gemini/gemini-cli/releases/tag/v0.44.0-nightly.20260521.g57c42a5c4)
- [Gemini CLI Releases documentation](https://google-gemini.github.io/gemini-cli/docs/releases.html)
- [Gemini CLI Changelog](https://google-gemini.github.io/gemini-cli/docs/changelogs/)

## Release Context

The releases documentation describes three major channels: nightly, preview, and
stable.
It recommends stable for most users.

This nightly is newer than the previously logged `v0.43.0-preview.1` release
from 2026-05-19.
Because it is a nightly prerelease, its contents should be treated as current
implementation signal rather than stable adoption guidance.

## Notable Changes

The release includes several items relevant to agentic development workflows:

- Agent session invocation work, including local session invocation, remote
  session invocation, and wiring `AgentSession` invocations into the agent tool.
- A fix allowing configured MCP servers in non-interactive mode.
- A custom command file-injection path traversal fix.
- Snapshot recovery across sessions.
- Default policy loading parity for the A2A server and CLI.
- Support for Sublime Text and Emacs Client editors with improved error
  messages and documentation.
- Proxy and Windows shell reliability fixes, including `NO_PROXY` handling,
  PowerShell preference, and ESM bundle proxy-agent export preservation.

## Engineering Implications

The agent session invocation items suggest active work on session-level agent
execution surfaces.
The public release body does not provide enough detail to document the user
contract, so this should be tracked as a release signal rather than a how-to
guide.

The non-interactive MCP fix is more immediately actionable for teams that run
Gemini CLI or future Antigravity CLI workflows in CI.
It suggests that unattended agent runs are expected to use configured external
tooling, but teams should wait for stable or preview confirmation before
standardizing around the behavior.

The custom command path traversal fix reinforces that command files are part of
the trusted automation boundary.
Project command repositories should be reviewed like code, especially when
commands inject files or run shell commands.

## Verification Status

This note is based on the GitHub release metadata fetched on 2026-05-21.
No dedicated stable or preview release note for `v0.44.0` was available in the
fetched release list during this run.
