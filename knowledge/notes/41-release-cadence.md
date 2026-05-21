# Release Cadence and Promotion Flow

## Source

https://google-gemini.github.io/gemini-cli/docs/releases.html

## Overview

The Gemini CLI follows a structured release cadence based on semver with weekly
promotions across three release channels.

## Weekly Release Promotion Process

Each Tuesday, the on-call engineer triggers the "Promote Release" workflow which
automates the entire release process:

1. **Promotes Preview to Stable** — The latest preview release becomes the new
   latest version on npm.
2. **Promotes Nightly to Preview** — The latest nightly release becomes the new
   preview version.
3. **Prepares for Next Nightly** — A PR is automatically created and merged to
   bump the version in main.

This ensures a consistent and reliable release cadence with minimal manual
intervention.

## Release Channels

### Stable (latest)

- Full promotion of last week's preview release + bug fixes and validations.
- Installation: `npm install -g @google/gemini-cli@latest`

### Preview

- Not fully vetted; may contain regressions or other outstanding issues.
- Installation: `npm install -g @google/gemini-cli@preview`

### Nightly

- Published daily at UTC 0000. Contains all changes from main at time of release.
- Should be assumed to have pending validations and issues.
- Installation: `npm install -g @google/gemini-cli@nightly`

## Promotion Flow

```
main → nightly → preview → stable (latest)
```

1. Code committed to `main`, pushed nightly to nightly channel
2. After ≤1 week on main → promoted to preview
3. After 1 more week → promoted to stable

## Semver Compliance

The project follows [semver.org](https://semver.org/) as closely as possible.
Weekly releases are minor version increments. Bug fixes and hotfixes between
releases are patch versions on the most recent release.

## Versioning Source of Truth

The NPM registry is the single source of truth for versioning:

1. The release workflow queries NPM's dist-tags (latest, preview, nightly)
2. For each version, it verifies:
   - A corresponding git tag exists
   - A corresponding GitHub Release exists
3. Any discrepancy causes the workflow to halt, alerting the on-call engineer

This NPM-first approach prevents versioning discrepancies.

## Manual Releases

For releases outside the regular schedule:

1. Go to the Actions tab → "Release: Manual" workflow
2. Provide:
   - **Version:** Exact semver with `v` prefix (e.g., `v0.6.1`)
   - **Ref:** Branch, tag, or commit SHA
   - **NPM Channel:** preview, nightly, latest, or dev
   - **Dry Run:** true (logs without publishing) or false (live release)
   - **Force Skip Tests:** true (not recommended for production)
   - **Skip GitHub Release:** true (npm release only)

## Rollback/Rollforward

For critical regressions, use the "Release: Change Tags" workflow:

1. Go to the Actions tab → "Release: Change Tags" workflow
2. Provide:
   - **Version:** Existing version (e.g., `0.5.0-preview-2`)
   - **Channel:** preview, stable
   - **Dry Run:** true or false
