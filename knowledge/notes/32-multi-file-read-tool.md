# Multi-File Read Tool

The `read_many_files` tool lets Gemini CLI gather context from multiple local
files using explicit paths or glob patterns.
For Antigravity-style agentic development, it is the bulk context collection
tool for repository review, documentation analysis, configuration inspection,
and test discovery.

## Source

[Multi File Read Tool documentation](https://google-gemini.github.io/gemini-cli/docs/tools/multi-file.html)

## What It Reads

For text files, `read_many_files` concatenates matched file contents into one
string.
The output inserts a `--- {filePath} ---` separator before each file and an
`--- End of content ---` marker after the final file.

For explicitly targeted media and document files, it can return base64-encoded
content.
Supported examples include images such as PNG and JPEG, PDFs, audio such as MP3
and WAV, and video such as MP4 and MOV.
Other binary files are detected and skipped.

## Arguments

- `paths` is required and accepts a list of paths or glob patterns.
- `exclude` optionally removes matching files or directories.
- `include` optionally adds additional glob patterns.
- `recursive` controls recursive search behavior, primarily through `**` glob
  usage, and defaults to `true`.
- `useDefaultExcludes` controls default exclusions such as `node_modules`,
  `.git`, and non-image or non-PDF binary files.
- `respect_git_ignore` controls `.gitignore` handling and defaults to `true`.

## Path Specificity

Directory paths alone do not imply recursive reads.
A path like `/docs` returns an empty result unless the caller uses a pattern such
as `/docs/*` or `/docs/*.md`.

Media and PDF files must be explicitly targeted by name or extension.
This prevents broad globs from accidentally pulling large binary content into
the model context.

## Examples

Read all TypeScript files under `src`:

```text
read_many_files(paths=["src/**/*.ts"])
```

Read the main README, documentation Markdown files, and a logo while excluding
old documentation:

```text
read_many_files(
  paths=["README.md", "docs/**/*.md", "assets/logo.png"],
  exclude=["docs/OLD_README.md"]
)
```

Read JavaScript files while adding tests and JPEG assets:

```text
read_many_files(
  paths=["**/*.js"],
  include=["**/*.test.js", "images/**/*.jpg"],
  useDefaultExcludes=False
)
```

## Workflow Implications

For software engineers, `read_many_files` is best used when the agent needs
broad repository context before planning or editing.
For engineering managers, the important control points are default excludes,
`.gitignore` respect, and path specificity because they reduce accidental
context loading from generated files, dependencies, or large binaries.

## Key Takeaways

- `read_many_files` aggregates many matched files into a single context payload.
- Globs should be explicit; directory-only paths are not enough.
- Default excludes and `.gitignore` handling are enabled by default.
- Large or broad reads can be resource-intensive, so teams should prefer scoped
  patterns.
