# CLI Commands and Built-in Tools

> Sources:
> - [CLI Commands](https://google-gemini.github.io/gemini-cli/docs/cli/commands.html)
> - [Tools Overview](https://google-gemini.github.io/gemini-cli/docs/tools/)

## Slash Commands (`/`)

Meta-level control over the CLI:

- `/bug` — File a GitHub issue on the Gemini CLI repository.
- `/chat save <tag>` — Save current conversation state.
- `/chat list` — List saved conversation states.
- `/chat resume <tag>` — Resume a saved conversation.
- `/extensions install <url|path>` — Install an extension.
- `/extensions uninstall <name>` — Uninstall an extension.
- `/extensions disable [name]` — Disable extension globally or per workspace.
- `/extensions enable [name]` — Re-enable an extension.
- `/extensions update [name]` — Pull latest changes for extensions.
- `/ide install` — Install the IDE companion extension.
- `/ide enable` — Re-establish IDE connection.
- `/ide info` — Display IDE integration details.
- `/memory show` — Display content of loaded `GEMINI.md` files.
- `/memory add <path>` — Add a file to memory.
- `/memory refresh` — Reload `GEMINI.md` files from disk.
- `/permissions` — Open the Trusted Folders trust dialog.
- `/restore [checkpoint]` — Restore a checkpoint or list available checkpoints.
- `/stats` — Display usage statistics summary.
- `/help` — Display help with all available commands.
- `/undo` — Undo the last tool execution.

## At Commands (`@`)

File or directory references passed as context to the model:

- `@<path>` — Read file(s) and pass content as context.
- `@-` — Read from stdin and pass as context.

Path resolution is workspace-aware and supports `.geminiignore`.

## Shell Mode (`!`)

- `!<shell_command>` — Execute a shell command via `bash` (Linux/macOS) or
  `cmd.exe` (Windows), then return to Gemini CLI.
- `!` (standalone) — Toggle shell mode for direct command input.
- Environment variable `GEMINI_CLI=1` is set in subprocesses.

## Built-in Tools

### File System Tools
- `read_file` — Read file contents.
- `write_file` — Write or create files.
- `edit` — Apply surgical text edits (model is steered toward this for targeted changes).
- `replace` — Replace text in files.
- `glob` — Glob file matching.
- `list_directory` — List directory contents.

### Shell Tool
- `run_shell_command` — Execute shell commands with confirmation and sandboxing.

### Web Tools
- `web_fetch` — Fetch content from URLs.
- `google_web_search` — Perform Google web searches.

### Multi-File Tool
- `read_many_files` — Read content from multiple files or directories.

### Memory Tool
- `save_memory` — Save and recall information across sessions.

## Custom Commands

Users can create custom commands via TOML files:
- **User commands:** `~/.gemini/commands/<name>.toml`
- **Project commands:** `<project>/.gemini/commands/<name>.toml`

Namespacing via subdirectories (`git/commit.toml` → `/git:commit`).

Support for prompt injection (`@{path}` for file content, `!{cmd}` for shell
output), `${user_input}`, and `''` for user arguments.
