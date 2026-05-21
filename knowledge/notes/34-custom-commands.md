# Custom Commands

Custom commands let Gemini CLI users package repeated prompts as slash commands.
This matters for Antigravity 2.0 teams because reusable project commands can
standardize code review, refactoring, release, incident, or documentation
workflows across a repository.

Sources:

- [Custom Commands](https://google-gemini.github.io/gemini-cli/docs/cli/custom-commands.html)
- [CLI Commands](https://google-gemini.github.io/gemini-cli/docs/cli/commands.html)
- [Gemini CLI Changelog](https://google-gemini.github.io/gemini-cli/docs/changelogs/)
- [Release v0.44.0-nightly.20260521.g57c42a5c4](https://github.com/google-gemini/gemini-cli/releases/tag/v0.44.0-nightly.20260521.g57c42a5c4)

## Locations and Precedence

Gemini CLI discovers global user commands under `~/.gemini/commands/`.
It discovers project commands under `<project>/.gemini/commands/`.
When a project command has the same name as a user command, the project command
takes precedence.

Subdirectories create namespaced commands.
For example, `<project>/.gemini/commands/git/commit.toml` becomes
`/git:commit`.

## TOML Format

Custom command files use the `.toml` extension.
The required field is `prompt`, which can be a single-line or multi-line string.
The optional `description` field appears in help output.

````toml
description = "Generates a Git commit message."
prompt = """
Generate a Conventional Commit message from the staged diff.

```diff
!{git diff --staged}
```

"""

````

## Argument Handling

Commands can use an argument placeholder in the prompt.
When the placeholder appears in normal prompt text, Gemini CLI injects the raw
arguments typed after the command name.
When the placeholder appears inside a shell-injection block, Gemini CLI
shell-escapes the arguments before substitution.

If the prompt does not contain the placeholder, Gemini CLI appends the full
command invocation to the prompt.
That default behavior is useful for commands that parse flexible user input,
such as changelog or issue triage commands.

## Dynamic Injection

Custom commands can inject local shell output with `!{...}`.
The CLI performs a security check and asks for confirmation before executing the
resolved shell command.
Failed commands inject stderr and an exit-status line into the prompt so the
model can reason about the failure.

Custom commands can also inject file, directory, image, PDF, audio, or video
content with `@{...}`.
Directory injection respects `.gitignore` and `.geminiignore` when those
filters are enabled.
File content injection runs before shell command injection and argument
substitution.

## Headless and Security Signals

The changelog records support for running custom slash commands directly in
headless mode, for example by invoking Gemini CLI with a custom command prompt.
The latest observed nightly release on 2026-05-21 also includes a fix to prevent
path traversal in custom command file injection.

For engineering teams, the practical rule is to treat shared project commands as
code.
Review TOML command files, pay attention to `!{...}` shell blocks, and restrict
commands that read files or execute local tools.

## Implications for Antigravity 2.0

Project-scoped custom commands are a likely migration point from one-off
terminal prompts to repeatable agentic workflows.
They can encode team policy, but they also create a new trusted automation
surface.
Teams evaluating Antigravity CLI should include command review, ownership, and
change control in their rollout plan.
