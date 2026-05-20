# File System Tools

An overview of the Gemini CLI's built-in file system tools for
reading, writing, listing, searching, and modifying files and
directories.

## Source

[**File System Tools documentation**](https://google-gemini.github.io/gemini-cli/docs/tools/file-system.html)

## Security Boundaries

All file system tools operate within a `rootDirectory` (usually the
current working directory where you launched the CLI). Paths provided
must be absolute or resolve relative to this root directory. Operations
outside the root directory fail.

## Tool Inventory

### 1. `list_directory` (ReadFolder)

Lists file and subdirectory names within a directory path.

- **Parameters:**
  - `path` (string, required): Absolute path to the directory.
  - `ignore` (array of strings, optional): Glob patterns to exclude
    (e.g., `["*.log", ".git"]`).
  - `respect_git_ignore` (boolean, optional): Whether to respect
    `.gitignore`. Defaults to `true`.
- **Behavior:** Returns directory names with a directory indicator,
  sorted with directories first then alphabetically.
- **Confirmation:** No.

### 2. `read_file` (ReadFile)

Reads and returns the content of a specified file. Handles text,
images (PNG, JPG, GIF, WEBP, SVG, BMP), and PDF files.

- **Parameters:**
  - `path` (string, required): Absolute path to the file.
  - `offset` (number, optional): 0-based line number to start
    reading from. Requires `limit`.
  - `limit` (number, optional): Maximum number of lines to read.
    Defaults to 2000 lines or the entire file if feasible.
- **Behavior:** For text files, returns content with truncation
  messages if line limits exceeded. For images and PDFs, returns
  base64-encoded data. Other binary files are skipped.
- **Confirmation:** No.

### 3. `write_file` (WriteFile)

Writes content to a specified file. Overwrites existing files or
creates new ones (including parent directories).

- **Parameters:**
  - `file_path` (string, required): Absolute path to the file.
  - `content` (string, required): The content to write.
- **Behavior:** Creates parent directories if needed.
- **Confirmation:** Yes. Shows a diff and asks for user approval
  before writing.

### 4. `glob` (FindFiles)

Finds files matching glob patterns within the working directory.

- **Parameters:**
  - `pattern` (string, required): Glob pattern to match (e.g.,
    `"**/*.ts"`).
  - `path` (string, optional): Directory to search within. Defaults
    to the working directory.
  - `ignore` (array of strings, optional): Glob patterns to exclude.
- **Behavior:** Returns matching file paths.
- **Confirmation:** No.

### 5. `search_file_content` (SearchText)

Searches for a regex pattern within file content across a directory.

- **Parameters:**
  - `pattern` (string, required): Regex pattern to search for.
  - `path` (string, optional): Directory to search within. Defaults
    to the working directory.
  - `include` (string, optional): Glob pattern to filter files (e.g.,
    `"*.js"`, `"src/**/*.{ts,tsx}"`). Searches most files if omitted.
- **Behavior:** Uses `git grep` in Git repositories (fallback to
  system `grep` or JavaScript search). Returns matching lines with
  file paths and line numbers.
- **Confirmation:** No.

### 6. `replace` (Edit)

Replaces text within a file using exact literal string matching with
enhanced reliability.

- **Parameters:**
  - `file_path` (string, required): Absolute path to the file.
  - `old_string` (string, required): The exact literal text to find
    and replace.
  - `new_string` (string, required): The replacement text.
  - `expected_replacements` (number, optional): Number of occurrences
    to replace. Defaults to `1`.
- **Behavior:**
  - If `old_string` is empty and file does not exist, creates a new
    file.
  - If `old_string` is found, replaces it with `new_string`.
  - Multi-Stage Edit Correction: If the initial match fails or
    matches multiple locations, the tool uses the Gemini model to
    iteratively refine `old_string` and `new_string` for improved
    reliability.
- **Failure conditions:** File not absolute, path outside root, file
  not found, string not found after correction attempts, or ambiguous
  multiple matches.
- **Confirmation:** Yes. Shows a diff and asks for user approval.

## Key Takeaways

- All tools respect the `rootDirectory` security boundary.
- `write_file` and `replace` require user confirmation via diff
  display.
- `search_file_content` optimizes for Git repositories with `git grep`.
- `replace` includes a self-correction mechanism for robustness when
  the model's context is slightly off.
