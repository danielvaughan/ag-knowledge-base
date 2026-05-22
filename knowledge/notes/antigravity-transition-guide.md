# Transitioning from Gemini CLI to Antigravity 2.0

## Overview

Google is transitioning from the **Gemini CLI** (a TypeScript-based tool) to the **Antigravity CLI** (a Go-based, agent-first platform). This change marks a strategic shift toward a unified multi-agent ecosystem that shares the same harness as the **Antigravity 2.0** desktop application.

## Key Dates

- **Sunset Date**: June 18, 2026. 
- On this date, Gemini CLI will be sunset for Google AI Pro/Ultra and free tier users.

## Core Comparisons

| Feature | Gemini CLI | Antigravity CLI |
|---|---|---|
| **Base Language** | TypeScript | Go |
| **Architecture** | Client-server (packages/cli + packages/core) | Agent-first/Multi-agent platform |
| **Primary Interface** | Terminal (REPL) | Terminal (REPL) & Desktop App (IDE) |
| **Core Harness** | Standardized tools/hooks | Shared with Antigravity 2.0 (Skills, Hooks, Subagents) |
| **Extension Model** | Extensions | Antigravity Plugins |

## Major Improvements

- **Performance**: The switch to Go provides snappier response times and faster execution.
- **Multi-Agent Support**: Native support for asynchronous, multi-agent workflows.
- **Unified Ecosystem**: The CLI and the Antigravity 2.0 Desktop App share the same underlying agent harness, allowing for a seamless transition between terminal-based and IDE-based development.

## Feature Preservation

Despite the architectural shift, key developer-centric features have been preserved and evolved:
- **Agent Skills**: Now part of the unified agent harness.
- **Hooks & Subagents**: Remain central to the workflow.
- **Extensions**: Transitioned into the **Antigravity Plugin** model.

## Model Integration

The platform emphasizes high-performance, cost-effective models:
- **Gemini 3 Flash**: Optimized for high-frequency development with low latency and high SWE-bench scores.
- **Gemini 3 Pro**: Available for complex refactoring, documentation, and deep technical analysis.

## Sources
- [An important update: Transitioning Gemini CLI to Antigravity CLI](https://developers.googleblog.com/an-important-update-transitioning-gemini-cli-to-antigravity-cli/)
- [Google Developers Blog - Gemini CLI and Antigravity 2.0 Announcements](knowledge/notes/25-google-developers-blog-announcements.md)
