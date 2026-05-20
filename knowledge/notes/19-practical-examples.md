# Practical Examples

> **Note:** Antigravity 2.0 is Google's codename for the next-generation agentic
> development platform. The current public-facing implementation is distributed as
> **Gemini CLI** (`@google/gemini-cli`). This note tracks the authoritative public
> information available as of **2026-05-20**.

## Overview

The Gemini CLI documentation includes a practical examples page with four concrete
use cases demonstrating the agent's capabilities across file management, code analysis,
data processing, and testing workflows.

Source: [Gemini CLI Examples](https://google-gemini.github.io/gemini-cli/docs/get-started/examples.html)

## Example 1 — Rename Photographs Based on Content

**Scenario:** A folder contains unlabelled photo files that need renaming based on
their visual content.

**Setup:**

```
photos/photo1.png
photos/photo2.png
photos/photo3.png
```

**Prompt:**

    Rename the photos in my "photos" directory based on their contents.

**Result:** Gemini asks for permission to rename the files. After confirmation
(accept once), files are renamed with descriptive content-based names:

```
photos/yellow_flowers.png
photos/antique_dresser.png
photos/green_android_robot.png
```

## Example 2 — Explain a Repository by Reading Its Code

**Scenario:** Understanding how a popular open-source utility works by inspecting its
source code rather than relying only on its README.

**Prompt:**

    Clone the 'chalk' repository from https://github.com/chalk/chalk, read its key
    source files, and explain how it works.

**Result:** Gemini performs a multi-step sequence:

1. Asks for permission to run `git clone` to download the repository.
2. Identifies and asks for permission to read key source files.
3. Analyzes the code and returns a structured explanation.

For the `chalk` library, the explanation covers:

- **Core functionality:** A chainable API for styling terminal output with ANSI
  escape codes.
- **Implementation pattern:** Each color or modifier is a getter that appends the
  corresponding ANSI code to an internal stack.
- **Usage example:** `chalk.red.bold('Hello')` chains `red` and `bold` getters.

## Example 3 — Combine Two Spreadsheets

**Scenario:** Merging two separate spreadsheet files into a single combined spreadsheet.

**Setup:** Two spreadsheets that need to be consolidated into one output file.

**Approach:** Provide a natural language prompt instructing Gemini to read both files,
merge their data, and write the result to a new spreadsheet file.

## Example 4 — Run Unit Tests

**Scenario:** A React component (`Login.tsx`) with its corresponding test file
(`Login.test.tsx`) needs validation.

**Setup:**

```
src/components/Login.tsx
src/components/__tests__/Login.test.tsx
```

**Approach:** Prompt Gemini to run the test suite and report results. The example
demonstrates testing of:

- Login button state transitions (disabled while submitting).
- Form validation logic.
- API call mocking and success/failure scenarios.

## Notes

- Results are examples intended to showcase potential use cases. Actual results may
  vary based on the model, prompt quality, and repository context.
- These examples are designed for comparison against competing tools such as Claude
  Code and Codex.
