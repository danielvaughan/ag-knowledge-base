# Core Tools API

> **Note:** Antigravity 2.0 is Google's codename for the next-generation agentic
> development platform. The current public-facing implementation is distributed as
> **Gemini CLI** (`@google/gemini-cli`). This note tracks the authoritative public
> information available as of **2026-05-19**.

## Overview

The Gemini CLI core (`packages/core`) features a robust system for defining,
registering, and executing tools. Tools extend the capabilities of the Gemini
model, allowing it to interact with the local environment, fetch web content,
and perform actions beyond simple text generation.

Source: [Gemini CLI Core: Tools API documentation](https://google-gemini.github.io/gemini-cli/docs/core/tools-api.html)

## Core Concepts

### Tool (`tools.ts`)

An interface and base class (`BaseTool`) that defines the contract for all tools.
Each tool must implement:

- **`name`** — Unique internal name (used in API calls to Gemini)
- **`displayName`** — User-friendly name
- **`description`** — Explanation of what the tool does, provided to the Gemini model
- **`parameterSchema`** — JSON schema defining accepted parameters
- **`validateToolParams()`** — Validates incoming parameters
- **`getDescription()`** — Human-readable description for specific parameters before execution
- **`shouldConfirmExecute()`** — Determines if user confirmation is needed (e.g., destructive operations)
- **`execute()`** — Core method that performs the action and returns a `ToolResult`

### ToolResult

An interface defining the structure of a tool's execution outcome:

- **`llmContent`** — Factual content to include in the history sent back to the LLM (string or `PartListUnion`)
- **`returnDisplay`** — User-friendly string (often Markdown) describing what the tool did

### Built-in Tools

The following tools extend `BaseTool`:

- **`shellTool.ts`** — Executes shell commands
- **`readFileTool.ts`** — Reads files from the filesystem
- **`writeFileTool.ts`** — Writes files to the filesystem
- **`editFileTool.ts`** — Edits files using search/replace operations
- **`listDirTool.ts`** — Lists directory contents
- **`fileSystemTool.ts`** — General filesystem operations
- **`memoryTool.ts`** — Interacts with the AI's memory

## Tool Execution Flow

1. **Model Request** — The Gemini model decides to use a tool and returns a
   `FunctionCall` part with the tool name and arguments
2. **Core Receives Request** — The core parses the `FunctionCall`
3. **Tool Retrieval** — The requested tool is looked up in the `ToolRegistry`
4. **Parameter Validation** — The tool's `validateToolParams()` method is called
5. **Confirmation (if needed)** — The tool's `shouldConfirmExecute()` method
   determines if user confirmation is required
6. **Execution** — If validated and confirmed, `execute()` is called with
   arguments and an `AbortSignal` for potential cancellation
7. **Result Processing** — The `ToolResult` is received by the core
8. **Response to Model** — The `llmContent` from the `ToolResult` is packaged
   as a `FunctionResponse` and sent back to the Gemini model
9. **Display to User** — The `returnDisplay` is sent to the CLI

## Extending with Custom Tools

### Command-based Discovery

Advanced users or project administrators can define a
`tools.discoveryCommand` in `settings.json`. This command, when run by the
Gemini CLI core, should output a JSON array of `FunctionDeclaration` objects.
The core then makes these available as `DiscoveredTool` instances. The
corresponding `tools.callCommand` executes the custom tools.

### MCP Servers

For more complex scenarios, one or more MCP servers can be configured via the
`mcpServers` setting in `settings.json`. The Gemini CLI core discovers and uses
tools exposed by these servers. With multiple MCP servers, tool names are
prefixed with the server alias (e.g., `serverAlias__actualToolName`).

## Sources

- [Gemini CLI Core: Tools API documentation](https://google-gemini.github.io/gemini-cli/docs/core/tools-api.html)
