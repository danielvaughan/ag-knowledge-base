# Multi File Read Tool (read\_many\_files)

## Source

https://google-gemini.github.io/gemini-cli/docs/tools/multi-file.html

## Description

The `read_many_files` tool reads content from multiple files specified by paths
or glob patterns. The behavior depends on the provided files:

- **Text files:** Content is concatenated into a single string.
- **Image/PDF/audio/video files:** Read and returned as base64-encoded data when
  explicitly requested by name or extension.

This tool is useful for getting an overview of a codebase, finding where
specific functionality is implemented, reviewing documentation, or gathering
context from multiple configuration files.

> **Note:** A directory path like `/docs` returns an empty result. The tool
> requires a pattern such as `/docs/*` or `/docs/*.md` to identify files.

## Arguments

| Argument | Type | Optional | Default | Description |
|---|---|---|---|---|
| `paths` | list[string] | No | — | Array of glob patterns or paths
  relative to the tool's target directory (e.g., `["src/**/*.ts"]`, `["README.md",
  "docs/*"]`) |
| `exclude` | list[string] | Yes | — | Glob patterns for files/directories to
  exclude (e.g., `["**/*.log", "temp/"]`). Added to default excludes if
  `useDefaultExcludes` is `true` |
| `include` | list[string] | Yes | — | Additional glob patterns to include.
  Merged with `paths` (e.g., `["*.test.ts"]` to specifically add test files if
  they were broadly excluded) |
| `recursive` | boolean | Yes | `true` | Whether to search recursively (controlled
  by `**` in glob patterns) |
| `useDefaultExcludes` | boolean | Yes | `true` | Whether to apply a list of
  default exclusion patterns (e.g., `node_modules`, `.git`, non-image/PDF binary
  files) |
| `respect_git_ignore` | boolean | Yes | `true` | Whether to respect `.gitignore`
  patterns when finding files |

## How It Works

### Text files

1. The tool reads the content of each matched file, attempting to skip binary
   files not explicitly requested as image/PDF.
2. Content is concatenated into a single string with a separator
   `--- {filePath} ---` between each file's content.
3. UTF-8 encoding is used by default.
4. A `--- End of content ---` marker is inserted after the last file.

### Image and PDF files

When explicitly requested by name or extension (e.g., `paths: ["logo.png"]` or
`include: ["*.pdf"]`):

1. The tool reads the file and returns its content as a base64-encoded string.

### Binary file handling

- **Image/PDF/Audio/Video:** The tool can read common image types (PNG, JPEG),
  PDF, audio (mp3, wav), and video (mp4, mov) files, returning them as base64
  encoded data. These files must be explicitly targeted by the `paths` or
  `include` patterns.
- **Other binary files:** The tool attempts to detect and skip other binary
  types by examining their initial content for null bytes.

## Usage

```
read_many_files(paths=["Your files or paths here."], include=["Additional files to include."], exclude=["Files to exclude."], recursive=False, useDefaultExcludes=false, respect_git_ignore=true)
```

## Examples

### Read all TypeScript files in the src directory

```
read_many_files(paths=["src/**/*.ts"])
```

### Read specific files and exclude others

```
read_many_files(paths=["README.md", "docs/**/*.md", "assets/logo.png"], exclude=["docs/OLD_README.md"])
```

### Read all JavaScript files including tests and images

```
read_many_files(paths=["**/*.js"], include=["**/*.test.js", "images/**/*.jpg"], useDefaultExcludes=False)
```

## Important Notes

- **Binary file handling:** Ensure image/PDF files are explicitly targeted by
  specifying the exact filename or a pattern.
- **Performance:** Reading a very large number of files or very large individual
  files can be resource-intensive.
- **Path specificity:** Paths and glob patterns must be specified relative to the
  tool's target directory.
- **Default excludes:** Be aware of default exclusion patterns (like
  `node_modules`, `.git`). Use `useDefaultExcludes=False` to override them, but
  do so cautiously.
