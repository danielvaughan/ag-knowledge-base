# Release Notes — v0.43.0 and v0.44.0

## Source

https://github.com/google-gemini/gemini-cli/releases/tag/v0.43.0
https://github.com/google-gemini/gemini-cli/releases/tag/v0.44.0

## Overview

v0.43.0 and v0.44.0 are the most recent releases as of 2026-05-20. Both have
been promoted to the stable (latest) channel on npm.

### Version Information

| Version | Channel | npm Tag |
|---|---|---|
| v0.44.0 | Stable | latest |
| v0.43.0 | Stable (legacy) | — |

### Installation

```bash
npm install -g @google/gemini-cli@latest
```

## v0.44.0

- Confirmed stable release on GitHub.
- Follows the standard weekly release cadence (released on a Tuesday).

## v0.43.0

- Confirmed stable release on GitHub.
- Part of the standard weekly release cadence.

## Release Cadence

The Gemini CLI follows a strict release schedule (see `docs/releases.html` for
full details):

1. Code is committed to `main` and pushed nightly
2. After no more than 1 week on main, code is promoted to the preview channel
3. After 1 more week the most recent preview is promoted to stable
4. Patch fixes are produced against both preview and stable as needed

Each Tuesday at ~2000 UTC new Stable and Preview releases are cut.

## Channels

| Channel | npm Tag | Description |
|---|---|---|
| Stable | `latest` | Fully vetted promotion of last week's preview + bug fixes |
| Preview | `preview` | Less tested, may contain regressions |
| Nightly | `nightly` | Daily releases from main, assumes pending validations and issues |

## Manual Releases

For releases outside the regular cadence:

1. Navigate to the Actions tab of the repository
2. Select the "Release: Manual" workflow
3. Provide version (e.g., `v0.6.1`), ref, and npm channel (preview/nightly/latest/dev)
4. Optional: Dry run, skip tests, skip GitHub release

## Rollback/Rollforward

For critical regressions:

1. Navigate to the Actions tab
2. Select "Release: Change Tags" workflow
3. Specify existing version and target channel (preview/stable)
4. This changes the npm dist-tag without a full release cycle

This is the preferred method for both rollbacks and rollforwards.
