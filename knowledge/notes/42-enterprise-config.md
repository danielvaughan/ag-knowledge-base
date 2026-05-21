# Enterprise Configuration

## Source

https://google-gemini.github.io/gemini-cli/docs/cli/enterprise.html

## Overview

The enterprise document outlines configuration patterns and best practices for
deploying and managing Gemini CLI in an enterprise environment. System-level
settings allow administrators to enforce security policies, manage tool access,
and ensure a consistent experience for all users.

## Security Disclaimer

> The patterns in this document help administrators create a more controlled and
> secure environment. They should not be considered a foolproof security boundary.
> A determined user with sufficient local privileges may still be able to
> circumvent these configurations. These measures are designed to prevent
> accidental misuse and enforce corporate policy, not to defend against a malicious
> actor with local administrative rights.

## Settings Merging and Precedence

Settings are merged from four files. The precedence order for single-value
settings (like `theme`) is:

1. **System Defaults** — `system-defaults.json`
2. **User Settings** — `~/.gemini/settings.json`
3. **Workspace Settings** — `<project>/.gemini/settings.json`
4. **System Overrides** — `settings.json`

System Overrides have the final say on single-value settings. For arrays
(`includeDirectories`) and objects (`mcpServers`), values are merged.

### Example Precedence

- **system-defaults.json** (system-wide baseline):
  - Sets `ui.theme` to `"default-corporate-theme"`
  - Sets `context.includeDirectories` to `["/etc/gemini-cli/common-context"]`

- **User settings.json** (~/.gemini/settings.json):
  - Overrides `ui.theme` to `"user-preferred-dark-theme"`
  - Adds MCP servers: `corp-server`, `user-tool`
  - Adds to `includeDirectories`: `"~/gemini-context"`

- **Workspace settings.json** (<project>/.gemini/settings.json):
  - Overrides `ui.theme` to `"project-specific-light-theme"`
  - Adds MCP server: `project-tool`
  - Adds to `includeDirectories`: `"./project-context"`

- **System Overrides** (settings.json):
  - Overrides `ui.theme` to `"system-enforced-theme"`

The theme resolution follows the precedence order, ultimately selecting the
system-enforced theme.

## Key Enterprise Settings

### Allowed Domains

Admins can restrict which MCP servers or external services users can connect to.
This is useful for controlling access to internal APIs or approved third-party
services.

### Blocked Tools

Administrators can block specific tools from being used, preventing access to
sensitive functionality or compliance-restricted tools.

### Proxy Settings

Enterprise deployments may require proxy configuration for MCP servers that
connect to external services.

### System-Wide MCP Server Defaults

System defaults can include pre-configured MCP servers that are available to all
users without individual configuration.

## Deployment Patterns

### System Defaults (system-defaults.json)

Sets a baseline configuration for all users on the machine. Users can override
individual settings but cannot remove the baseline.

### System Overrides (settings.json)

Provides the highest precedence settings, allowing administrators to enforce
policies that users cannot override.

### Merged Arrays and Objects

- `includeDirectories` — Values from all four files are merged into a single list
- `mcpServers` — MCP server definitions from all files are combined, allowing
  users to add their own servers alongside enterprise-provided ones
