# Troubleshooting Guide

> **Note:** Antigravity 2.0 is Google's codename for the next-generation agentic
> development platform. The current public-facing implementation is distributed as
> **Gemini CLI** (`@google/gemini-cli`). This note tracks the authoritative public
> information available as of **2026-05-20**.

## Overview

The Gemini CLI documentation includes a comprehensive troubleshooting guide
covering authentication errors, common error messages, exit codes, and debugging
tips. This note consolidates the full taxonomy for reference.

Source: [Troubleshooting Guide](https://google-gemini.github.io/gemini-cli/docs/troubleshooting.html)

## Authentication or Login Errors

### "Request contains an invalid argument"

Users with Google Workspace accounts or Google Cloud accounts associated with their
Gmail accounts may not be able to activate the free tier of the Google Code Assist
plan.

**Resolution:**

- For Google Cloud accounts, set `GOOGLE_CLOUD_PROJECT` to your project ID.
- Alternatively, obtain the Gemini API key from Google AI Studio, which includes a
  separate free tier.

### SSL/TLS Certificate Errors

- **Error:** `UNABLE_TO_GET_ISSUER_CERT_LOCALLY` or `unable to get local issuer
  certificate`.
- **Cause:** Corporate network with a firewall intercepting and inspecting SSL/TLS
  traffic. Requires a custom root CA certificate trusted by Node.js.
- **Resolution:** Set the `NODE_EXTRA_CA_CERTS` environment variable to the absolute
  path of your corporate root CA certificate file.

  Example: `export NODE_EXTRA_CA_CERTS=/path/to/your/corporate-ca.crt`

## Common Error Messages and Solutions

### EADDRINUSE — Address Already in Use

- **Error:** `EADDRINUSE` when starting an MCP server.
- **Cause:** Another process is already using the port the MCP server is trying to
  bind to.
- **Resolution:** Stop the other process using the port or configure the MCP server
  to use a different port.

### Command Not Found

- **Error:** `gemini` command not found when attempting to run Gemini CLI.
- **Cause:** Gemini CLI is not correctly installed or not in the system's `PATH`.
- **Resolution:** Verify installation and PATH configuration.

### .env File Variables Not Applied

- **Issue:** Setting `DEBUG=true` or `DEBUG_MODE=true` in a project's `.env` file
  does not enable debug mode for Gemini CLI.
- **Cause:** The `DEBUG` and `DEBUG_MODE` variables are automatically excluded from
  project `.env` files to prevent interference with Gemini CLI behavior.
- **Resolution:** Use a `.gemini/.env` file instead, or configure the
  `advanced.excludedEnvVars` setting in `settings.json` to exclude fewer variables.

## Exit Codes

The Gemini CLI uses specific exit codes to indicate the reason for termination. This
is especially useful for scripting and automation.

| Exit Code | Error Type | Description |
|---|---|---|
| 41 | `FatalAuthenticationError` | An error occurred during the authentication process. |
| 42 | `FatalInputError` | Invalid or missing input provided to the CLI (non-interactive mode only). |
| 44 | `FatalSandboxError` | An error occurred with the sandboxing environment (Docker, Podman, or Seatbelt). |
| 52 | `FatalConfigError` | A configuration file (`settings.json`) is invalid or contains errors. |
| 53 | `FatalTurnLimitedError` | Maximum number of conversational turns for the session was reached (non-interactive mode only). |

## Debugging Tips

### CLI Debugging

- Use the `--verbose` flag with CLI commands for more detailed output.
- Check the CLI logs, often found in a user-specific configuration or cache
  directory.

### Core Debugging

- Check the server console output for error messages or stack traces.
- Increase log verbosity if configurable.
- Use Node.js debugging tools (e.g., `node --inspect`) to step through server-side
  code.

### Tool Issues

- If a specific tool is failing, isolate the issue by running the simplest possible
  version of the command.
- For `run_shell_command`, verify that the command works directly in the shell first.
- For file system tools, verify that paths are correct and check permissions.

### Pre-flight Checks

- Always run `npm run preflight` before committing code. This catches common issues
  related to formatting, linting, and type errors.

## GitHub Issues

If an issue is not covered by the troubleshooting guide, search the Gemini CLI [Issue
Tracker on GitHub](https://github.com/google-gemini/gemini-cli/issues). If no similar
issue is found, create a new GitHub Issue with a detailed description. Pull requests
are also welcome.
