# Security Features and Sandboxing

> Sources:
> - [Trusted Folders](https://google-gemini.github.io/gemini-cli/docs/cli/trusted-folders.html)
> - [Checkpointing](https://google-gemini.github.io/gemini-cli/docs/cli/checkpointing.html)
> - [Sandboxing](https://google-gemini.github.io/gemini-cli/docs/cli/sandbox.html)

## Trusted Folders

A security feature controlling which projects can use full CLI capabilities.
**Disabled by default.**

### Enabling

Add to user `settings.json`:

```json
{
  "security": {
    "folderTrust": {
      "enabled": true
    }
  }
}
```

### How It Works

On first run in a folder, an interactive trust dialog appears:
- **Trust folder** — Full trust for the current folder.
- **Trust parent folder** — Trust the parent directory (auto-trusts all subdirs).
- **Don't trust** — Restricted "safe mode" for the folder.

Trust decisions are saved in `~/.gemini/trustedFolders.json`.

### Untrusted Workspace Restrictions

When a folder is untrusted, the CLI runs in safe mode:

1. **Workspace settings ignored** — `.gemini/settings.json` not loaded.
2. **Environment variables ignored** — `.env` files not loaded.
3. **Extension management restricted** — No install/update/uninstall.
4. **Tool auto-acceptance disabled** — Always prompt before any tool.
5. **Automatic memory loading disabled** — No auto-loading of context files.

### Trust Check Order

1. **IDE trust signal** — If IDE is connected, its response takes priority.
2. **Local trust file** — `~/.gemini/trustedFolders.json` if no IDE.

### Managing Trust

- `/permissions` command in CLI to change trust for current folder.
- Inspect `~/.gemini/trustedFolders.json` to see all rules.

## Checkpointing

Automatically saves project state before AI tool file modifications.
**Disabled by default.**

### How It Works

When approving a file-modifying tool (e.g., `write_file`, `replace`):

1. **Git Snapshot** — A commit is made in a shadow Git repo at
   `~/.gemini/history/<project_hash>`. Does not interfere with your project's
   Git repository.
2. **Conversation History** — Full conversation up to that point is saved.
3. **Tool Call** — The specific tool call is stored.

### Enabling

Via CLI flag:
```bash
gemini --checkpointing
```

Via `settings.json`:
```json
{
  "general": {
    "checkpointing": {
      "enabled": true
    }
  }
}
```

### Restoring

- `/restore` — List available checkpoints.
- `/restore <checkpoint_file>` — Restore to a specific checkpoint.

Checkpoint file names include timestamp, filename, and tool name
(e.g., `2025-06-22T10-00-00_000Z-my-file.txt-write_file`).

### Storage Locations

- **Git snapshots:** `~/.gemini/history/<project_hash>`
- **Conversation data:** `~/.gemini/tmp/<project_hash>/checkpoints`

## Sandboxing

Isolates potentially unsafe operations (shell commands, file modifications)
in a Docker/Podman container.

### Enabling

- `--sandbox` or `-s` flag
- `GEMINI_SANDBOX` environment variable
- Automatically enabled with `--yolo` / `--approval-mode=yolo`

### Docker Sandbox Image

Published at `us-docker.pkg.dev/gemini-code-dev/gemini-cli/sandbox:0.1.1`.

### Custom Sandbox

Create `.gemini/sandbox.Dockerfile` in project root:

```dockerfile
FROM gemini-cli-sandbox
RUN apt-get update && apt-get install -y some-package
```

Build with: `BUILD_SANDBOX=1 gemini -s`

### MCP Server Considerations

When running in a sandbox, MCP servers must be available **inside** the sandbox.
For `npx`-based MCP servers, `npx` must be installed within the sandbox image
or available in the `sandbox-exec` environment.

## Telemetry

Gemini CLI collects anonymized usage statistics by default:
- Tool call names, success/failure, execution duration (no arguments or results)
- API model used, request duration, success (no prompt/response content)
- CLI configuration (enabled tools, approval mode)

No PII, no prompt/response content, no file content logged.

Opt out via:
```json
{
  "privacy": {
    "usageStatisticsEnabled": false
  }
}
```
