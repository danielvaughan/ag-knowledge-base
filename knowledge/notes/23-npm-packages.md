# NPM Package Overview

> **Note:** Antigravity 2.0 is Google's codename for the next-generation agentic
> development platform. The current public-facing implementation is distributed as
> **Gemini CLI** (`@google/gemini-cli`). This note tracks the authoritative public
> information available as of **2026-05-20**.

## Overview

The Gemini CLI monorepo contains two main NPM packages managed via NPM Workspaces:
`@google/gemini-cli` and `@google/gemini-cli-core`.

Source: [Package Overview](https://google-gemini.github.io/gemini-cli/docs/npm.html)

## @google/gemini-cli

The main package responsible for the user interface, command parsing, and all other
user-facing functionality.

When published, it is bundled into a single executable file. This bundle includes all
dependencies, including `@google/gemini-cli-core`.

**Installation:**

- `npm install -g @google/gemini-cli`
- `npx @google/gemini-cli`

Both approaches deliver the same self-contained executable.

## @google/gemini-cli-core

The package containing the core logic for interacting with the Gemini API. It handles:

- Making API requests.
- Handling authentication.
- Managing the local cache.

This package is **not** bundled. It is published as a standard Node.js package with
its own dependencies, allowing it to be used as a standalone package in other
projects. All transpiled JS code in the `dist` folder is included in the package.

## NPM Workspaces

The project uses NPM Workspaces to manage packages within the monorepo.

### Configuration

The root `package.json` defines workspaces:

```json
{
  "workspaces": ["packages/*"]
}
```

This tells NPM that any folder inside the `packages` directory is a separate package.

### Benefits

- **Simplified dependency management:** Running `npm install` from the root installs
  all dependencies for all packages and links them together.
- **Automatic linking:** Packages within the workspace can depend on each other.
  Changes to one package are immediately available to dependent packages.
- **Script execution:** Run scripts in any package from the root using the
  `--workspace` flag. For example: `npm run build --workspace @google/gemini-cli`.
