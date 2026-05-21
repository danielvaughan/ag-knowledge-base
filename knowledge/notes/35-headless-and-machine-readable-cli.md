# Headless and Machine-Readable CLI Use

Headless use is the automation path for Gemini CLI and the current public
surface that informs Antigravity CLI migration planning.
It is relevant for CI, scheduled maintenance, scripted analysis, and engineering
manager evaluations of repeatable agentic workflows.

Sources:

- [Authentication](https://google-gemini.github.io/gemini-cli/docs/get-started/authentication.html)
- [Configuration](https://google-gemini.github.io/gemini-cli/docs/get-started/configuration.html)
- [Gemini CLI Changelog](https://google-gemini.github.io/gemini-cli/docs/changelogs/)
- [Troubleshooting](https://google-gemini.github.io/gemini-cli/docs/troubleshooting.html)
- [Release v0.44.0-nightly.20260521.g57c42a5c4](https://github.com/google-gemini/gemini-cli/releases/tag/v0.44.0-nightly.20260521.g57c42a5c4)

## Authentication

The authentication documentation separates interactive mode from headless
non-interactive mode.
For local interactive use, Google login is the recommended path, especially for
Google AI Pro or Google AI Ultra subscribers.
For CI/CD or other non-interactive environments, the documentation points to
environment-based credentials such as Gemini API keys, Vertex AI Application
Default Credentials, service account JSON keys, or Google Cloud API keys.

The Vertex AI service account path is explicitly positioned for
non-interactive environments, CI/CD, or organizations that restrict user-based
ADC or API key creation.
That makes it the strongest documented fit for centrally managed automation.

## Invocation and Output

The changelog records positional prompt support for non-interactive use, where a
command like `gemini "Hello"` is synonymous with passing a prompt flag.
It also records JSON output mode for headless invocations via
`--output-format json`.
The JSON output includes response, stats, and errors according to the changelog.

The current configuration documentation exposes `output.format` with `text` and
`json` values.
For automation, this provides a persistent configuration path in addition to
command-line invocation.

## Failure Modes

The troubleshooting documentation distinguishes non-interactive failures through
dedicated exit codes.
It lists `FatalInputError` for invalid or missing input and
`FatalTurnLimitedError` for reaching the maximum number of conversational turns.

These codes matter for CI wrappers because they let scripts distinguish bad
input or configured turn limits from general process failure.

## MCP and Automation

The latest observed nightly release on 2026-05-21 includes a fix allowing
configured MCP servers in non-interactive mode.
That is important for automation because many enterprise workflows depend on
MCP-backed tools for repository, issue, cloud, or internal system access.

This release item is from a nightly prerelease.
Treat it as a current signal rather than a stable-channel guarantee until it
appears in preview or stable release notes.

## Implications for Antigravity 2.0

For teams evaluating Antigravity CLI as the Gemini CLI successor, headless mode
is the bridge between interactive agent use and production engineering
automation.
The key adoption questions are credential ownership, JSON parsing contracts,
exit-code handling, MCP server availability, and whether custom commands should
be allowed in unattended runs.
