# Antigravity 2.0 SDK & Core Architecture

The Antigravity 2.0 platform is built on a modular core
(packages/core) that provides a robust system for defining,
registering, and executing tools. This architecture allows
for seamless extension via custom tools or the Model
Context Protocol (MCP).

## Core Concepts

### Tool Interface

Tool (tools.ts): An interface and base class (BaseTool) that
defines the contract for all tools. Each tool must have:

- **name**: A unique internal name (used in API calls to Gemini).
- **displayName**: A user-friendly name.
- **description**: A clear explanation of what the tool does,
  which is provided to the Gemini model.
- **parameterSchema**: A JSON schema defining the parameters
  that the tool accepts. This is crucial for the Gemini model
  to understand how to call the tool correctly.
- **validateToolParams()**: A method to validate incoming
  parameters.
- **getDescription()**: A method to provide a human-readable
  description of what the tool will do with specific parameters
  before execution.
- **shouldConfirmExecute()**: A method to determine if user
  confirmation is required before execution (e.g., for
  potentially destructive operations).
- **execute()**: The core method that performs the tool’s action
  and returns a `ToolResult`.

### ToolResult

ToolResult (tools.ts): An interface defining the structure of a
tool’s execution outcome:

- **llmContent**: The factual content to be included in the
  history sent back to the LLM for context. This can be a
  simple string or a PartListUnion (an array of Part objects
  and strings) for rich content.
- **returnDisplay**: A user-friendly string (often Markdown) or
  a special object (like FileDiff) for display in the CLI.

### Tool Registry

Tool Registry (tool-registry.ts): A class (ToolRegistry)
responsible for:

- **Registering Tools**: Holding a collection of all available
  built-in tools (e.g., `ReadFileTool`, `ShellTool`).
- **Discovering Tools**: It can also discover tools dynamically:
  - **Command-based Discovery**: If `tools.discoveryCommand` is
    configured in settings, this command is executed. It’s
    expected to output JSON describing custom tools, which are
    then registered as `DiscoveredTool` instances.
  - **MCP-based Discovery**: If `mcp.serverCommand` is
    configured, the registry can connect to a Model Context
    Protocol (MCP) server to list and register tools
    (`DiscoveredMCPTool`).

## Built-in Tool Categories

The core comes with a suite of pre-defined tools, typically found in `packages/core/src/tools/`. These include:

- **File System Tools**: Includes `LSTool` (ls.ts),
  `ReadFileTool` (read-file.ts), `WriteFileTool` (write-file.ts),
  `GrepTool` (grep.ts), `GlobTool` (glob.ts), `EditTool` (edit.ts),
  and `ReadManyFilesTool` (read-many-files.ts).

## References

- [Gemini CLI Core: Tools API](https://google-gemini.github.io/gemini-cli/docs/core/tools-api.html)
