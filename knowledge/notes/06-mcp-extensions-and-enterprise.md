# MCP Servers, Extensions, and Enterprise

> Sources:
> - [MCP Servers](https://google-gemini.github.io/gemini-cli/docs/tools/mcp-server.html)
> - [Extensions](https://google-gemini.github.io/gemini-cli/docs/extensions/)
> - [Enterprise](https://google-gemini.github.io/gemini-cli/docs/cli/enterprise.html)

## MCP Servers

### What Is an MCP Server

An application exposing tools and resources to the Gemini CLI through the
Model Context Protocol. Acts as a bridge between the Gemini model and external
systems (databases, APIs, custom scripts).

### Transport Types

- **stdio** — Default. Runs local servers.
  ```bash
  gemini mcp add <name> <command> [args...]
  ```
- **HTTP** — Streamable HTTP transport.
  ```bash
  gemini mcp add --transport http <name> <url>
  ```
- **SSE** — Server-Sent Events transport.
  ```bash
  gemini mcp add --transport sse <name> <url>
  ```

### Authentication Headers

```bash
gemini mcp add --transport http secure-server https://api.example.com/mcp/ \
  --header "Authorization: Bearer abc123"
```

### Environment Variables

```bash
gemini mcp add <name> -e API_KEY=123 <command>
```

### Management Commands

- `gemini mcp list` — List all configured servers with connection status.
- `gemini mcp remove <name>` — Remove a server from configuration.
- `/mcp list` — List servers from within the CLI.

### Discovery Architecture

- **Discovery layer** (`mcp-client.ts`): Iterates servers, establishes connections,
  fetches tool definitions, sanitizes schemas, registers tools.
- **Execution layer** (`mcp-tool.ts`): Wraps each discovered tool in a
  `DiscoveredMCPTool` instance handling confirmation logic and execution.

### MCP Server Configuration

In `settings.json`:

```json
{
  "mcp": {
    "timeout": 30000,
    "logLevel": "info",
    "allowed": ["server1", "server2"],
    "excludeTools": ["tool1", "tool2"]
  },
  "mcpServers": {
    "my-server": {
      "command": "npx -y @modelcontextprotocol/server-example",
      "timeout": 30000
    }
  }
}
```

### Trusted MCP Servers

In enterprise environments, use the `mcp.allowed` setting to create an allowlist
of permitted MCP servers. The enterprise example shows restricting to a single
corporate MCP server.

## Extensions

### What Are Extensions

Extensions package prompts, MCP servers, and custom commands into installable
bundles. Designed to be easily shareable.

### Installation

```bash
gemini extensions install https://github.com/gemini-cli-extensions/security
# Example: gemini-cli-security extension provides /security:analyze command
```

### Management Commands

- `gemini extensions install <url|path>` — Install from GitHub URL or local path.
- `gemini extensions uninstall <name>` — Uninstall an extension.
- `gemini extensions disable [name]` — Disable globally or per workspace.
- `gemini extensions enable [name]` — Re-enable.
- `gemini extensions update [name]` — Pull latest changes.
- `/extensions list` — List installed extensions from within CLI.

### Extension Structure

```
.gemini/extensions/<extension-name>/
├── gemini-extension.json     # Extension manifest
├── prompts/                  # Extension prompts
├── commands/                 # Custom commands (TOML files)
│   ├── deploy.toml
│   └── gcs/
│       └── sync.toml
└── GEMINI.md                 # Extension context (optional)
```

### Extension Manifest Fields

- `name` — Extension identifier.
- `description` — Brief description.
- `version` — Semantic version.
- `environmentVariables` — Key-value pairs.
- `mcpServers` — MCP server configuration.
- `promptFiles` — Glob patterns for prompt files.
- `includeTools` — Array of allowed tools (e.g., `"ReadFileTool"`).
- `excludeTools` — Array of tool names to exclude.
- `commandsGlob` — Custom glob pattern for command files.

### Custom Commands in Extensions

Extensions provide commands via TOML files in `commands/`:
- `deploy.toml` → `/deploy` (shown as `[gcp] Custom command`)
- `gcs/sync.toml` → `/gcs:sync`

### Conflict Resolution

- No conflict → extension command uses its natural name (e.g., `/deploy`).
- With conflict → extension command renamed with prefix (e.g., `/gcp.deploy`).

### Variables

Supported in `gemini-extension.json`:
- `${extensionPath}` — Extension directory path.
- `${workspacePath}` — Current workspace path.
- `${/}` or `${pathSeparator}` — OS path separator.

## Enterprise Deployment

### Key Patterns

1. **Centralized Configuration** — Use `system-defaults.json` and
   `settings.json` (system overrides) to enforce policies.
2. **Forced Sandboxing** — `tools.sandbox: "docker"` forces all tool execution
   into Docker.
3. **Tool Allowlisting** — `tools.core` restricts to specific tools/commands.
4. **Approved MCP Servers** — `mcp.allowed` limits to corporate servers only.
5. **Custom Bug Reporting** — Redirect `/bug` to internal ticketing via
   `advanced.bugCommand.urlTemplate`.
6. **Telemetry Integration** — Route telemetry to internal OTLP endpoint
   (e.g., `https://telemetry-prod.example.com:4317`).
7. **Disable Usage Statistics** — Set `privacy.usageStatisticsEnabled: false`.

### Enterprise Example Configuration

```json
{
  "tools": {
    "sandbox": "docker",
    "core": ["ReadFileTool", "GlobTool", "ShellTool(ls)", "ShellTool(cat)", "ShellTool(grep)"]
  },
  "mcp": { "allowed": ["corp-tools"] },
  "mcpServers": {
    "corp-tools": {
      "command": "/opt/gemini-tools/start.sh",
      "timeout": 5000
    }
  },
  "telemetry": {
    "enabled": true,
    "target": "gcp",
    "otlpEndpoint": "https://telemetry-prod.example.com:4317",
    "logPrompts": false
  },
  "advanced": {
    "bugCommand": {
      "urlTemplate": "https://servicedesk.example.com/new-ticket?title={title}&details={info}"
    }
  },
  "privacy": {
    "usageStatisticsEnabled": false
  }
}
```

### Security Note

Enterprise patterns prevent accidental misuse and enforce corporate policy but
are **not** a foolproof security boundary. A determined user with local
administrative rights may still circumvent these configurations.

## Quotas and Pricing

### Free Tier

| Auth Method                    | Daily Requests | Per Minute | Models        |
|------ --------|-----           |--  -----|------|---------|
| Login with Google              | 1000           | 60       | Gemini family |
| Gemini API Key (unpaid)        | 250            | 10       | Flash only    |
| Vertex AI Express Mode         | 90 days free   | Variable | Variable      |

### Paid Tier (Fixed Price)

| Edition              | Daily Requests | Per Minute |
|------       |---             |--   ----|
| Code Assist Standard | 1500          | 120       |
| Code Assist Enterprise | 2000        | 120       |

### Pay-As-You-Go

- **Vertex AI (Regular Mode):** Dynamic shared quota or provisioned throughput.
  Cost based on model and token usage.
- **Gemini API Key:** Quota varies by pricing tier. Cost varies by tier and
  usage.

### Usage Summary

Run `/stats` command or view summary at end of session.
