# Gemini CLI Changelogs v0.4.0 — v0.7.0

## Overview

The Gemini CLI changelog directory ([changelogs](https://google-gemini.github.io/gemini-cli/docs/changelogs/))
documents weekly updates from v0.4.0 (September 1, 2025) through v0.7.0
(September 22, 2025). These weekly updates introduced significant features
including IDE plugins, extensions, custom commands, and Google Cloud
integration.

## v0.7.0 — September 22, 2025

### IDE Plugin Spec

Published a spec for creating Gemini CLI IDE plugins that enable rich
context-aware experiences and native in-editor diffing
([PR #8479](https://github.com/google-gemini/gemini-cli/pull/8479) by
[@skeshive](https://github.com/skeshive)).

### Gemini CLI Extensions

- **Flutter:** An early version to help create, build, test, and run
  Flutter apps with Gemini CLI
  ([extension](https://github.com/flutter/gemini-cli-extension)).
- **nanobanana:** Integrate nanobanana into Gemini CLI
  ([extension](https://github.com/gemini-cli-extensions/nanobanana)).

### Telemetry Configuration

Manage telemetry settings using environment variables for flexible setup
([docs](https://github.com/google-gemini/gemini-cli/blob/main/docs/cli/telemetry.md#configuration),
[PR #9113](https://github.com/google-gemini/gemini-cli/pull/9113) by
[@jerop](https://github.com/jerop)).

### Experimental Todos

Track and display progress on complex tasks with a managed checklist.
Off by default; enabled via `"useWriteTodos": true`
([PR #8761](https://github.com/google-gemini/gemini-cli/pull/8761) by
[@anj-s](https://github.com/anj-s)).

### Other Features

- **Share chat for tools:** `/chat share` renders function calls and
  responses in the final markdown file
  ([PR #8693](https://github.com/google-gemini/gemini-cli/pull/8693)
  by [@rramkumar1](https://github.com/rramkumar1)).
- **Citations:** Enabled for all users
  ([PR #8570](https://github.com/google-gemini/gemini-cli/pull/8570)
  by [@scidomino](https://github.com/scidomino)).
- **Custom commands in headless mode:** Run custom slash commands
  directly from the command line: `gemini "/joke Chuck Norris"`
  ([PR #8305](https://github.com/google-gemini/gemini-cli/pull/8305)
  by [@capachino](https://github.com/capachino)).

## v0.6.0 — September 15, 2025

### Higher Limits for Google AI Pro and Ultra

Google AI Pro and AI Ultra subscribers received significantly higher 2.5
quota limits for Gemini CLI. See the [announcement](https://blog.google/technology/developers/gemini-cli-code-assist-higher-limits/).

### Google Cloud Data Platform Extensions

A comprehensive suite of extensions for cloud data platforms:

- **AlloyDB:** Interact, manage, and observe AlloyDB for PostgreSQL
  ([manage](https://github.com/gemini-cli-extensions/alloydb),
  [observe](https://github.com/gemini-cli-extensions/alloydb-observability)).
- **BigQuery:** Connect and query datasets or use a sub-agent for
  contextual insights
  ([query](https://github.com/gemini-cli-extensions/bigquery-data-analytics),
  [sub-agent](https://github.com/gemini-cli-extensions/bigquery-conversational-analytics)).
- **Cloud SQL:** Extensions for PostgreSQL, MySQL, and SQL Server
  (manage and observe variants).
- **Dataplex:** Discover, manage, and govern data and AI artifacts.
- **Firestore:** Interact with Firestore databases, collections, and
  documents.
- **Looker:** Query data, run Looks, and create dashboards.
- **MySQL:** Interact with MySQL databases.
- **Postgres:** Interact with PostgreSQL databases.
- **Spanner:** Interact with Spanner databases.
- **SQL Server:** Interact with SQL Server databases.
- **MCP Toolbox:** Configure and load custom tools for 30+ data sources.

### JSON Output Mode

Invoke Gemini CLI headlessly with `--output-format json` for easy parsing
and post-processing, including response, stats, and errors
([PR](https://github.com/google-gemini/gemini-cli/pull/9066) by
[@jerop](https://github.com/jerop)).

### Keybinding-Triggered Approvals

Use shortcuts (shift+y or shift+tab) to activate YOLO/auto-edit modes.
Pending confirmation dialogs now approve automatically.

### Prompt Search

Search prompt history using ctrl+r.

### Input Undo/Redo

Recover accidentally deleted text in the input prompt using ctrl+z
(undo) and ctrl+shift+z (redo).

### Loop Detection Confirmation

When loops are detected, a dialog appears to disable detection for the
current session.

### Direct to Google Cloud Telemetry

Directly send telemetry to Google Cloud for simplified setup.

### Visual Mode Indicator Revamp

Shell, accept edits, and YOLO modes now have color-coded mode indicators
in the input box.

## v0.5.0 — September 8, 2025

### FastMCP Integration

Quickly install and manage Gemini CLI MCP servers with FastMCP.
Getting started: [gofastmcp.com/integrations/gemini-cli](https://gofastmcp.com/integrations/gemini-cli)
([PR #1709](https://github.com/jlowin/fastmcp/pull/1709) by
[@jackwotherspoon](https://github.com/jackwotherspoon)).

### Positional Prompt for Non-Interactive

Seamlessly invoke Gemini CLI headlessly via `gemini "Hello"`,
synonymous with passing `-p`
([PR #7668](https://github.com/google-gemini/gemini-cli/pull/7668) by
[@allenhutchison](https://github.com/allenhutchison)).

### Experimental Tool Output Truncation

Enable truncating shell tool outputs and saving full output to a file
by setting `"enableToolOutputTruncation": true`
([PR #8039](https://github.com/google-gemini/gemini-cli/pull/8039) by
[@SandyTao520](https://github.com/SandyTao520)).

### Edit Tool Improvements

Significantly improved Gemini CLI's file editing capability
([PR #7679](https://github.com/google-gemini/gemini-cli/pull/7679) by
[@silviojr](https://github.com/silviojr)).

### Custom Witty Messages

Personalize loading messages via `"ui": { "customWittyPhrases": ["YOLO"]}`
in settings.json
([PR #7641](https://github.com/google-gemini/gemini-cli/pull/7641) by
[@JayadityaGit](https://github.com/JayadityaGit)).

### Nested .gitignore Handling

Nested `.gitignore` files are now respected
([PR #7645](https://github.com/google-gemini/gemini-cli/pull/7645) by
[@gsquared94](https://github.com/gsquared94)).

### Enforced Authentication

System administrators can mandate a specific auth method via
`"enforcedAuthType": "oauth-personal|gemini-api-key|..."` in settings.json
([PR #6564](https://github.com/google-gemini/gemini-cli/pull/6564) by
[@chrstnb](https://github.com/chrstnb)).

### A2A Development-Tool Extension

An RFC for an Agent2Agent (A2A) powered extension for developer tool
use cases
([discussion #7822](https://github.com/google-gemini/gemini-cli/discussions/7822),
[PR #7817](https://github.com/google-gemini/gemini-cli/pull/7817) by
[@skeshive](https://github.com/skeshive)).

### Hands-On Codelab

[Google Codelab](https://codelabs.developers.google.com/gemini-cli-hands-on)
available for practical learning.

## v0.4.0 — September 1, 2025

### CloudRun and Security Extensions

Automate app deployment with `/deploy` and find and fix security
vulnerabilities with `/security:analyze`.
Announcement: [Google Cloud blog](https://cloud.google.com/blog/products/ai-machine-learning/automate-app-deployment-and-security-analysis-with-new-gemini-cli-extensions).

### Experimental Features

- **Edit Tool:** Try the new edit tool with `"useSmartEdit": true` in
  settings.json
  ([PR #6823](https://github.com/google-gemini/gemini-cli/pull/6823) by
  [@silviojr](https://github.com/silviojr)).
- **Model talking to itself fix:** Removed a workaround that encouraged
  Gemini CLI to continue conversations on your behalf. Disable with
  `"skipNextSpeakerCheck": false`
  ([PR #7614](https://github.com/google-gemini/gemini-cli/pull/7614) by
  [@SandyTao520](https://github.com/SandyTao520)).
- **Prompt completion:** Real-time AI suggestions as you type, enabled
  with `"general": { "enablePromptCompletion": true }`
  ([PR #4691](https://github.com/google-gemini/gemini-cli/pull/4691)
  by [@3ks](https://github.com/3ks)).

### Footer Visibility Configuration

Customize the CLI footer in settings.json:

- `hideCWD`: hide current working directory.
- `hideSandboxStatus`: hide sandbox status.
- `hideModelInfo`: hide current model information.
- `hideContextSummary`: hide request context summary.

([PR #7419](https://github.com/google-gemini/gemini-cli/pull/7419) by
[@miguelsolorio](https://github.com/miguelsolorio)).

### Other Features

- **Citations for enterprise:** Enterprise Code Assist license users see
  citations by default. Enable with `"showCitations": true`
  ([PR #8570](https://github.com/google-gemini/gemini-cli/pull/8570)
  by [@scidomino](https://github.com/scidomino)).
- **Pro quota dialog:** Interactive dialog for handling daily Pro model
  usage limits.
- **Custom commands with `@`:** Embed local file or directory content
  using `@{path}` syntax.
- **Gemini 2.5 Flash Lite:** Support for `gemini-2.5-flash-lite` model.
- **CLI deprecations:** Deprecated command-line arguments in favor of
  settings.json equivalents.
- **JSON session summary:** Save detailed CLI session statistics via
  `--session-summary <path>`.
- **Robust keyboard handling:** Reliable behavior for arrow keys and
  modifier combinations.
- **MCP loading indicator:** Visual feedback during CLI initialization.
