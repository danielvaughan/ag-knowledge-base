# Extension Releasing and Distribution

> **Note:** Antigravity 2.0 is Google's codename for the next-generation agentic
> development platform. The current public-facing implementation is distributed as
> **Gemini CLI** (`@google/gemini-cli`). This note tracks the authoritative public
> information available as of **2026-05-20**.

## Overview

Gemini CLI extensions can be distributed through multiple channels, each with its
own trade-offs for install speed, update reliability, and release management.

Source: [Extension Releasing documentation](https://google-gemini.github.io/gemini-cli/docs/extensions/extension-releasing.html)

## Distribution Methods

### 1. Git Repository (Recommended)

The most flexible and simple option. Create a publicly accessible git repo (e.g.,
a public GitHub repository). Users install via:

```bash
gemini extensions install <your-repo-uri>
```

For GitHub repos, a simplified `gemini extensions install` command is available.

**Update mechanism:** When commits are pushed to the depended-on ref, users are
prompted to update. This also allows easy rollbacks, as the HEAD commit is always
treated as the latest version regardless of the actual version in the
`gemini-extension.json` file.

### 2. GitHub Releases

Provides a faster and more reliable initial installation experience by avoiding
repository cloning. Each release includes at least one archive file containing the
full repo contents at the linked tag.

**Update mechanism:** Gemini CLI checks for the latest GitHub release (must be
marked as such). Users can install a specific release via `--ref=<release-tag>`.
Opt-in to pre-release releases and semver ranges are not currently supported.

**Custom pre-built archives:** Extensions requiring build steps or platform-specific
binaries can attach pre-built archives to GitHub releases. Archives must be fully
self-contained and follow platform-specific naming conventions so Gemini CLI can
automatically find the correct asset.

## Managing Release Channels (Git Repository)

Users can depend on any ref (branch, tag, or commit) from a git repository:

```bash
gemini extensions install <repo-uri> --ref=stable
```

### Recommended Release Flow

1. Maintain `stable`, `preview`, and `dev` branches.
2. Do standard development in `dev`.
3. Merge to `preview` for preview releases.
4. Merge to `stable` for stable releases.
5. Cherry-pick between branches as needed (note: this results in divergent history;
   consider force-pushing to maintain clean history).

## Archive Structure

Custom archives must be fully self-contained, including the entire extension.
Extensions developed within a larger repository can use archives that differ from
the repo layout (e.g., a subdirectory archive).

## Sources

- [Extension Releasing documentation](https://google-gemini.github.io/gemini-cli/docs/extensions/extension-releasing.html)
