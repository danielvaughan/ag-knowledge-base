# Tools: Memory (`save_memory`)

> **Note:** Antigravity 2.0 is Google's codename for the next-generation agentic
> development platform. The current public-facing implementation is distributed as
> **Gemini CLI** (`@google/gemini-cli`). This note tracks the authoritative public
> information available as of **2026-05-20**.

## Overview

The `save_memory` tool allows Gemini CLI to persist and recall information across
sessions. It enables personalized and directed assistance by storing key facts that
the model can reference in future interactions.

Source: [Tools: Memory](https://google-gemini.github.io/gemini-cli/docs/tools/memory.html)

## How It Works

- The tool appends the provided fact to a special `GEMINI.md` file located in the
  user's home directory (`~/.gemini/GEMINI.md`).
- This file can be configured with a different name.
- Once added, facts are stored under a `## Gemini Added Memories` section.
- The file is loaded as context in subsequent sessions, allowing the CLI to recall
  the saved information.

## Usage

```
save_memory(fact="Your fact here.")
```

### Parameters

| Parameter | Type | Required | Description |
|---|---|---|---|
| `fact` | string | Yes | The specific fact or piece of information to remember. Should be a clear,
self-contained statement in natural language. |

## Examples

```
save_memory(fact="My preferred programming language is Python.")
save_memory(fact="The project I'm currently working on is called 'gemini-cli'.")
```

## Best Practices

- Use `save_memory` for concise, important facts.
- It is not intended for storing large amounts of data or conversational history.
- The memory file is a plain text Markdown file, so it can be viewed and edited
  manually if needed.

## Sources

- [Tools: Memory](https://google-gemini.github.io/gemini-cli/docs/tools/memory.html)
