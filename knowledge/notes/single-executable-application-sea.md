# Single Executable Application (SEA)

The Gemini CLI is designed to be a self-contained, portable tool.
The main package, `@google/gemini-cli`, is bundled into a single
executable file during the publishing process.

## Key Characteristics

- **Self-Contained**: The bundle includes all necessary dependencies,
  such as `@google/gemini-cli-core`.
- **Portability**: This bundling allows users to run the tool via
  `npm install -g @google/gemini-cli` or directly using
  `npx @google/gemini-cli` without needing to manage individual
  package dependencies separately.
- **Deployment**: The process of creating this single executable
  ensures that the user-facing CLI experience is consistent and
  easy to distribute.

## Implementation Context

In the current monorepo structure, the `@google/gemini-cli`
package handles the user interface and command parsing, while
the core logic resides in `@google/gemini-cli-core`. The bundling
process integrates these components into the final SEA.

Source: [Package Overview](https://google-gemini.github.io/gemini-cli/docs/npm.html)
