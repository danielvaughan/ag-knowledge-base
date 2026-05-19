# Architecture

> Source: [Architecture Overview](https://google-gemini.github.io/gemini-cli/docs/architecture.html)

## Core Components

The Gemini CLI is a monorepo publishing two NPM packages:

### CLI Package (`packages/cli`)

The user-facing frontend handling:
- Input processing and display rendering
- History management
- Theme and UI customization
- CLI configuration settings

### Core Package (`packages/core`)

The backend handling:
- Gemini API client communication
- Prompt construction and management
- Tool registration and execution logic
- Session and state management
- Server-side configuration

### Tools (`packages/core/src/tools/`)

Individual modules extending Gemini model capabilities:
- File system tools (read, write, edit, glob, replace)
- Shell command execution
- Web fetching (`web_fetch`)
- Web search (`google_web_search`)
- Multi-file read (`read_many_files`)
- Memory tool (`save_memory`)

## Interaction Flow

1. User types a prompt in the terminal (managed by `packages/cli`).
2. CLI sends input to core (`packages/core`).
3. Core constructs a prompt including conversation history and tool definitions,
   then sends it to the Gemini API.
4. Gemini API returns a response (direct answer or tool request).
5. If a tool is needed: core prepares execution, user approves (for write/shell
   operations), tool executes, result sent back to Gemini API.
6. Core sends the final response back to CLI.
7. CLI formats and displays the response.

## Key Design Principles

- **Modularity** — CLI and core are separated for independent development.
- **Extensibility** — Tool system designed for easy extension.
- **User Experience** — CLI focuses on rich, interactive terminal experience.

## Chat History Compression

The core automatically compresses conversation history when approaching token
limits. This compression is designed to be lossless in terms of information
conveyed while reducing overall token usage.

## Model Fallback

If the default "pro" model is rate-limited, the CLI automatically switches to
the "flash" model for the current session, ensuring uninterrupted work.

## File and Memory Discovery Services

- **File Discovery Service** — Finds relevant files in the project. Used by the
  `@` command and file-accessing tools.
- **Memory Discovery Service** — Searches for `GEMINI.md` context files
  hierarchically (current directory → project root → home directory), enabling
  global, project-level, and component-level context files.
