# Memport: Memory Import Processor for GEMINI.md

> **Note:** Antigravity 2.0 is Google's codename for the next-generation agentic
> development platform. The current public-facing implementation is distributed as
> **Gemini CLI** (`@google/gemini-cli`). This note tracks the authoritative public
> information available as of **2026-05-19**.

## Overview

The Memory Import Processor (Memport) allows modularizing GEMINI.md configuration
files by importing content from other markdown files. This enables breaking down
large GEMINI.md files into reusable, composable components.

Source: [Memory Import Processor documentation](https://google-gemini.github.io/gemini-cli/docs/core/memport.html)

## Import Syntax

Use the `@` symbol followed by the path to the file:

```markdown
# Main GEMINI.md file

This is the main content.

@./components/instructions.md

More content here.

@./shared/configuration.md
```

## Supported Path Formats

### Relative Paths

- `@./file.md` — Import from the same directory
- `@../file.md` — Import from parent directory
- `@./components/file.md` — Import from subdirectory

### Absolute Paths

- `@/absolute/path/to/file.md` — Import using absolute path

## Nested Imports

Imported files can themselves contain imports, creating a nested hierarchy:

```markdown
# main.md

@./header.md
@./content.md
@./footer.md
```

```markdown
# header.md

# Project Header

@./shared/title.md
```

## Safety Features

### Circular Import Detection

The processor automatically detects and prevents circular imports. If file A
imports file B which imports file A, the processor raises a warning and halts
the circular chain.

### Path Validation

Import paths are validated against the project root and allowed directories
before processing. Paths are resolved relative to the base GEMINI.md file
or as absolute paths.

### Project Root Detection

The processor searches upwards from the current directory for a `.git`
directory to determine the project root, ensuring imports stay within the
project boundary.

## TypeScript API

### `ProcessImportsResult`

```typescript
interface ProcessImportsResult {
  content: string;        // The processed content with imports resolved
  importTree: MemoryFile; // Tree structure showing the import hierarchy
}
```

### `MemoryFile`

```typescript
interface MemoryFile {
  path: string;           // The file path
  imports?: MemoryFile[]; // Direct imports, in the order they were imported
}
```

### `validateImportPath(importPath, basePath, allowedDirectories)`

Validates that an import path is safe and within allowed directories. Returns
a boolean indicating validity.

### `findProjectRoot(startDir)`

Finds the project root by searching for a `.git` directory upwards from the
given start directory. Implemented as an async function using non-blocking
filesystem APIs.

## Best Practices

1. **Use descriptive file names** for imported components
2. **Keep imports shallow** — avoid deeply nested import chains
3. **Document your structure** — maintain a clear hierarchy of imported files
4. **Test your imports** — ensure all referenced files exist and are accessible
5. **Use relative paths** when possible for better portability

## Troubleshooting

- **Import not working**: Check that the file exists and the path is correct
- **Circular import warnings**: Review your import structure for circular references
- **Permission errors**: Ensure files are readable and within allowed directories
- **Path resolution issues**: Use absolute paths if relative paths are not resolving

## Debug Mode

Enable debug mode for detailed logging of the import process:

```typescript
const result = await processImports(content, basePath, true);
```

## Sources

- [Memory Import Processor documentation](https://google-gemini.github.io/gemini-cli/docs/core/memport.html)
