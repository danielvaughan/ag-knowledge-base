# IDE Companion Plugin: Interface Specification

> **Note:** Antigravity 2.0 is Google's codename for the next-generation agentic
> development platform. The current public-facing implementation is distributed as
> **Gemini CLI** (`@google/gemini-cli`). This note tracks the authoritative public
> information available as of **2026-05-19**.

## Overview

The IDE Companion Plugin Interface Specification defines the contract for building
a companion plugin to enable Gemini CLI's IDE mode. The official VS Code
extension (`Google.gemini-cli-vscode-ide-companion` on the [VS Code Marketplace](https://marketplace.visualstudio.com/items?itemName=Google.gemini-cli-vscode-ide-companion)) provides native features such as workspace context and in-editor diff viewing.

This specification enables third-party contributors to bring similar functionality
to other editors (JetBrains IDEs, Sublime Text, etc.).

Source: [IDE Companion Plugin Interface Specification](https://google-gemini.github.io/gemini-cli/docs/ide-integration/ide-companion-spec.html)

Last Updated: September 15, 2025

## I. The Communication Interface

Gemini CLI and the IDE plugin communicate through a local communication channel.

### 1. Transport Layer: MCP over HTTP

The plugin **must** run a local HTTP server implementing the **Model Context
Protocol (MCP)**:

- **Protocol**: The server must be a valid MCP server (recommended to use an
  existing MCP SDK)
- **Endpoint**: A single endpoint (e.g., `/mcp`) for all MCP communication
- **Port**: The server **must** listen on a dynamically assigned port (port `0`)

### 2. Discovery Mechanism: The Port File

The CLI discovers the IDE instance by traversing the process tree and looking
for a discovery file containing the IDE's PID.

- **Location**: `os.tmpdir()/gemini/ide/` (create if it doesn't exist)
- **Naming pattern**: `gemini-ide-server-${PID}-${PORT}.json`
  - `${PID}`: Process ID of the parent IDE process
  - `${PORT}`: The port the local MCP server is listening on

### 3. Workspace Context Tool

The IDE plugin exposes a `workspaceContext` tool via `tools/call`:

- Retrieves the 10 most recently accessed files in the IDE
- Includes active cursor position and text selection (up to 16 KB)
- Returns a `CallToolResult` with workspace context data

## II. The Diff Interface

### `ide/diffStarted` Notification

When a diff view is opened, the plugin **must** send this notification:

```typescript
{
  filePath: string;      // Absolute path to the file
  originalContent: string;
  newContent: string;
}
```

### `ide/diffViewed` Notification

Sent when the user views the diff (after applying formatting):

```typescript
{
  filePath: string;
  formattedOriginalContent: string;
  formattedNewContent: string;
}
```

### `tools/call` — `openDiff` Tool

The plugin exposes an `openDiff` tool for opening diff views:

**Arguments (`OpenDiffRequest`)**:
```typescript
interface OpenDiffRequest {
  filePath: string;
  newContent: string;
}
```

**Response (`CallToolResult`)**:
- On success: `TextContent` block with the final content shown in the diff
- On failure: `isError: true` with an error description

### `tools/call` — `closeDiff` Tool

**Arguments (`CloseDiffRequest`)**:
```typescript
interface CloseDiffRequest {
  filePath: string;  // Absolute path to the file whose diff should close
}
```

**Response (`CallToolResult`)**:
- On success: `TextContent` block with the file's final content
- On failure: `isError: true` with an error description

### `ide/diffAccepted` Notification

When the user accepts changes in a diff view:

```typescript
{
  filePath: string;
  content: string;  // May differ from newContent if user made manual edits
}
```

### `ide/diffRejected` Notification

When the user rejects changes (e.g., closes the diff without accepting):

```typescript
{
  filePath: string;  // Absolute path to the rejected diff
}
```

## III. The Lifecycle Interface

The plugin **must** manage resources and the discovery file based on the IDE's lifecycle:

### On Activation (IDE startup/plugin enabled):
1. Start the MCP server
2. Create the discovery file

### On Deactivation (IDE shutdown/plugin disabled):
1. Stop the MCP server
2. Delete the discovery file

## Sources

- [IDE Companion Plugin Interface Specification](https://google-gemini.github.io/gemini-cli/docs/ide-integration/ide-companion-spec.html)
- [VS Code Marketplace listing](https://marketplace.visualstudio.com/items?itemName=Google.gemini-cli-vscode-ide-companion)
