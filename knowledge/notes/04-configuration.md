# Configuration

> Source: [Configuration](https://google-gemini.github.io/gemini-cli/docs/get-started/configuration.html)

## Configuration Layers (Precedence Order)

Lower numbers are overridden by higher numbers:

1. **Default values** — Hardcoded defaults within the application.
2. **System defaults file** — `/etc/gemini-cli/system-defaults.json` (Linux),
   `C:\ProgramData\gemini-cli\system-defaults.json` (Windows), or
   `/Library/Application Support/GeminiCli/system-defaults.json` (macOS).
3. **User settings file** — `~/.gemini/settings.json`
4. **Project settings file** — `<project>/.gemini/settings.json`
5. **System settings file** — `settings.json` (system overrides, highest precedence)
6. **Environment variables** — System-wide or from `.env` files
7. **Command-line arguments** — Values passed at launch

## Settings File Locations

| Layer              | Location                                             | Scope     |
|------             |------                                                |------     |
| System defaults    | `/etc/gemini-cli/system-defaults.json`               | Machine   |
| User settings      | `~/.gemini/settings.json`                            | User      |
| Project settings   | `<project>/.gemini/settings.json`                    | Project   |
| System overrides   | (path varies)                                        | Machine   |

Arrays (e.g., `includeDirectories`, `mcpServers`) are **merged** across layers.
Single-value settings follow the precedence above.

## Key Configuration Categories

### General
- `checkpointing.enabled` — Enable automatic checkpointing (default: `false`).
- `sandbox` — Default sandbox type (`"docker"` or `"podman"`).
- `approvalMode` — Tool approval mode (`"default"`, `"yolo"`, etc.).

### Tools
- `core` — Array of allowed core tools and command-specific restrictions
  (e.g., `"ShellTool(ls)"`, `"ShellTool(grep)"`).
- `includeDirectories` — Directories to include in tool operations.
- `excludeDirectories` — Directories to exclude from tool operations.
- `autoMemory` — Auto-load files into context from specified directories.
- `skipContextFiles` — Skip certain context files.

### MCP
- `allowed` — Array of allowed MCP server names.
- `mcpServers` — Object mapping server names to configuration.

### Telemetry
- `telemetry.enabled` — Enable telemetry (default: `true`).
- `telemetry.target` — Telemetry target (`"gcp"` for enterprise).
- `telemetry.otlpEndpoint` — OTLP endpoint URL for enterprise telemetry.
- `telemetry.logPrompts` — Whether to log prompt content (default: `false`).

### Security
- `folderTrust.enabled` — Enable Trusted Folders feature (default: `false`).

### Privacy
- `privacy.usageStatisticsEnabled` — Opt out of usage statistics (default: `true`).

### Advanced
- `bugCommand.urlTemplate` — Custom bug-report URL template (e.g., for internal
  ticketing systems).

## Environment Variables

- `GEMINI_API_KEY` — API key for Gemini API authentication.
- `GOOGLE_CLOUD_PROJECT` — Google Cloud project ID for Vertex AI.
- `GOOGLE_CLOUD_LOCATION` — Cloud location for Vertex AI.
- `GOOGLE_GENAI_USE_VERTEXAI` — Set to `"true"` for Vertex AI.
- `GEMINI_SANDBOX` — Enable sandboxing.
- `GEMINI_CLI_SYSTEM_DEFAULTS_PATH` — Override system defaults path.
- `BUILD_SANDBOX=1` — Build custom sandbox Dockerfile.
- `GEMINI_CLI=1` — Set in subprocesses (detected by scripts).

## .env File Support

Gemini CLI loads `.env` files searching from current directory up:
1. `<project>/.gemini/.env`
2. `~/.gemini/.env`
3. `~/.env`

Variables are loaded from the **first** file found, not merged.

## Sandbox Customization

Create `.gemini/sandbox.Dockerfile` in the project root:

```dockerfile
FROM gemini-cli-sandbox
# Add custom dependencies
# RUN apt-get update && apt-get install -y some-package
```

Build with: `BUILD_SANDBOX=1 gemini -s`

## Model Selection

The CLI determines which model to use. Users can set a specific model through
configuration. Model fallback occurs automatically on rate-limiting (pro → flash).

## Configuration Format Note (9/17/25)

The `settings.json` format was reorganized. Automatic migration from the old
format began 2025-09-17. See [v1 Configuration documentation](https://google-gemini.github.io/gemini-cli/docs/get-started/configuration-v1.html)
for the previous format.
