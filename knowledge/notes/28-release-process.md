# Release Process and Cadence

An overview of the Gemini CLI release workflow, promotion flow, and
artifact distribution.

## Source

[**Releases documentation**](https://google-gemini.github.io/gemini-cli/docs/releases.html)

## Release Cadence

The project follows [Semantic Versioning](https://semver.org/) as
closely as possible. Weekly releases are minor version increments;
bug and hotfixes between releases are patch versions on the most
recent release.

### Weekly Release Schedule

Each Tuesday at approximately 2000 UTC, new Stable and Preview
releases are cut.

### Promotion Flow

The promotion flow moves code through these channels:

    main -> nightly -> preview -> stable

1. Code is committed to `main` and pushed to **nightly** each day at
   0000 UTC.
2. After no more than one week on `main`, code is promoted to the
   **preview** channel.
3. After one week, the most recent **preview** channel is promoted to
   **stable**.
4. Patch fixes are produced against both **preview** and **stable**,
   incrementing the patch version each time.

## Installation Tags

**Preview** (unvetted, may contain regressions):

    npm install -g @google/gemini-cli@preview

**Stable** (fully vetted, full promotion + bug fixes):

    npm install -g @google/gemini-cli@latest

**Nightly** (latest from `main`, not validated):

    npm install -g @google/gemini-cli@nightly

## Weekly Release Promotion

Each Tuesday, the on-call engineer triggers the "Promote Release"
GitHub Actions workflow. This single action automates the entire
process:

1. **Promotes Preview to Stable:** Identifies the latest preview
   release and promotes it to stable. This becomes the new `latest`
   tag on npm.
2. **Creates Preview Release:** Takes the latest nightly release and
   promotes it to preview.
3. **Publishes NPM packages:** Builds and publishes
   `@google/gemini-cli` and `@google/gemini-cli-core`.
4. **Creates GitHub Release:** Bundles the executable and attaches it
   as a release asset.

## Manual Releases

For releases outside the regular nightly and weekly cadence, the
`Release: Manual` workflow allows publishing a specific version from
any branch, tag, or commit SHA.

## Rollback and Rollforward

In case of critical regressions:

- Change the npm `dist-tag` to a previous stable version or a new
  patch via the `Release: Change Tags` workflow.
- This is the preferred method, avoiding a full release cycle.

## Patching

Critical bugs already fixed on `main` can be patched against stable
or preview releases through a highly automated process. The patched
commits are cherry-picked onto the target release branch.

## Release Validation

After pushing a new release, smoke testing validates the packages:

    npx -y @google/gemini-cli@latest --version

## Local Testing and Validation

To test the release process without publishing:

1. Trigger the manual workflow from the [GitHub Actions
   tab](https://github.com/google-gemini/gemini-cli/actions/workflows/release-manual.yml).

## Release Deep Dive: Artifact Creation

The release process creates two artifact types:

### NPM Artifacts

Standard, unbundled Node.js packages. The primary artifact is code
in `packages/cli/dist`, depending on `@google/gemini-cli-core`.

### GitHub Release Artifacts

A single, bundled `gemini.js` executable containing all
dependencies. Creation steps:

1. **Build:** Runs `esbuild` to produce the `gemini.js` executable.
2. **Bundle directory:** A `bundle/` directory is created containing:
   - `gemini.js` (from esbuild)
   - `README.md`
   - `LICENSE`
   - Sandbox profiles (`packages/cli/src/utils/*.sb`)
3. **GitHub Release:** The `bundle/` contents are attached as a
   release asset. Users can also run via npx from GitHub.

## Notifications

Failing release workflows automatically create a GitHub issue with
the `release-failure` label. Notifications are posted to the
maintainer's chat channel via GitHub for Google Chat.

## Summary

- Dual-artifact distribution: NPM packages for standard use, bundled
  `gemini.js` for `npx` convenience.
- Three-tier promotion: nightly (daily) to preview (weekly) to stable
  (weekly, one-week lag from main).
- Patch and rollback workflows for rapid incident response.
