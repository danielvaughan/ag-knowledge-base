# Shell Tool (run_shell_command)

> **Note:** Antigravity 2.0 is Google's codename for the next-generation agentic
> development platform. The current public-facing implementation is distributed as
> **Gemini CLI** (`@google/gemini-cli`). This note tracks the authoritative public
> information available as of **2026-05-20**.

## Overview

The `run_shell_command` tool allows Gemini CLI to interact with the underlying system,
run scripts, and perform command-line operations. It executes commands as subprocesses
with detailed output capture.

Source: [Shell Tool (run_shell_command)](https://google-gemini.github.io/gemini-cli/docs/tools/shell.html)

## Arguments

| Argument | Type | Required | Description |
|---|---|---|-|
| `command` | string | Yes | The exact shell command to execute. |
| `description` | string | No | A brief description of the command's purpose, shown to the user. |
| `directory` | string | No | The directory (relative to project root) in which to execute the command. Defaults to project root. |

## Platform-Specific Execution

- **Linux/macOS:** Commands execute with `bash -c`.
- **Windows:** Commands execute with `cmd.exe /c`.

## Output Capture

The tool returns detailed information:

- `Command`: The executed command.
- `Directory`: Where the command was run.
- `Stdout`: Standard output stream.
- `Stderr`: Standard error stream.
- `Exit Code`: The process exit code.

Interactive commands (e.g., `vim`, `git rebase -i`) are supported if the
`tools.shell.enableInteractiveShell` setting is set to `true`.

Background processes can be started using `&`.

## Configuration Options

### Enable Interactive Shell

```json
{
  "tools": {
    "shell": {
      "enableInteractiveShell": true
    }
  }
}
```

### Set Timeout

```json
{
  "tools": {
    "shell": {
      "timeout": 120
    }
  }
}
```

### Environment Variables

Additional environment variables can be injected via `tools.shell.env`:

```json
{
  "tools": {
    "shell": {
      "env": {
        "MY_VAR": "my_value"
      }
    }
  }
}
```

## Command Restrictions

Command restrictions are configured through `tools.core` and `tools.exclude`:

### Allowlist Specific Commands

To allow only `git status` and `npm install`:

```json
{
  "tools": {
    "core": ["run_shell_command(git status)", "run_shell_command(npm install)"]
  }
}
```

Result:
- `git status`: Allowed
- `npm install`: Allowed
- `ls -l`: Blocked

### Block Specific Command Prefixes

To block `rm` and allow all other commands:

```json
{
  "tools": {
    "core": ["run_shell_command"],
    "exclude": ["run_shell_command(rm)"]
  }
}
```

Result:
- `rm -rf /`: Blocked
- `git status`: Allowed
- `npm install`: Allowed

### Blocklist Takes Precedence

If a command prefix is in both `tools.core` and `tools.exclude`, it is blocked:

```json
{
  "tools": {
    "core": ["run_shell_command(git)"],
    "exclude": ["run_shell_command(git push)"]
  }
}
```

Result:
- `git push origin main`: Blocked
- `git status`: Allowed

### Block All Shell Commands

```json
{
  "tools": {
    "exclude": ["run_shell_command"]
  }
}
```

Result: All commands blocked.

## Security Note

Command-specific restrictions in `excludeTools` for `run_shell_command` are based on
simple string matching and can be easily bypassed. This feature is **not a security
mechanism** and should not be relied upon to safely execute untrusted code.

It is recommended to use `coreTools` to explicitly select commands that can be
executed rather than relying on `excludeTools` for security.
