# Installation and Deployment

> Source: [Deployment](https://google-gemini.github.io/gemini-cli/docs/get-started/deployment.html)

## Standard Installation (Recommended)

### Global Install
```bash
npm install -g @google/gemini-cli
gemini
```

### NPX Execution
```bash
npx @google/gemini-cli
```

## Run from Source (Contributors)

### Development Mode (hot-reloading)
```bash
npm run start
```

### Production-like Mode (Linked package)
```bash
npm link packages/cli
gemini
```

## Run Latest GitHub Commit
```bash
npx https://github.com/google-gemini/gemini-cli
```

## Docker/Podman Sandbox

### Direct from Registry
```bash
docker run --rm -it us-docker.pkg.dev/gemini-code-dev/gemini-cli/sandbox:0.1.1
```

### Via --sandbox flag (with local install)
```bash
gemini --sandbox -y -p "your prompt here"
```

### Custom Sandbox
Create `.gemini/sandbox.Dockerfile` in project root:

```dockerfile
FROM gemini-cli-sandbox
# Add custom dependencies
# RUN apt-get update && apt-get install -y some-package
```

Build with: `BUILD_SANDBOX=1 gemini -s`

## Authentication Methods

### Interactive Mode

1. **Login with Google** (Recommended) — For Google AI Pro/Ultra subscribers.
   Opens browser redirect to localhost. Credentials cached locally.
2. **Gemini API Key** — Set `GEMINI_API_KEY` environment variable.
3. **Vertex AI** — Set `GOOGLE_GENAI_USE_VERTEXAI=true` plus project/location
   variables.

### Headless (Non-interactive)

Must use environment variables:
- `GEMINI_API_KEY` — For Gemini API key auth.
- `GOOGLE_GENAI_USE_VERTEXAI=true` + `GOOGLE_CLOUD_PROJECT` + `GOOGLE_CLOUD_LOCATION`
  — For Vertex AI.

## Release Channels

| Channel   | NPM Tag          | Description                     |
|------     |--          |----------|-------------|
| Stable    | `@latest`      | Full promotion + bug fixes    |
| Preview   | `@preview`     | Not fully vetted              |
| Nightly   | `@nightly`     | Latest main branch, daily     |

### Weekly Promotion Flow

```
main (nightly) → preview → stable
```

- Code committed to main nightly → pushed to nightly.
- After ≤1 week on main → promoted to preview.
- After 1 week in preview → promoted to stable.
- Weekly releases on Tuesdays ~2000 UTC.

## Build and Distribution

### NPM Publication
- TypeScript source transpiled via `tsc`.
- Publishes `@google/gemini-cli-core` (backend) and `@google/gemini-cli` (frontend).

### GitHub npx Execution
- Uses `esbuild` to bundle application + dependencies into a single `gemini.js`
  file on-the-fly. Not checked into the repository.

### GitHub Release Artifacts
- `gemini-cli-bundle.zip` — Bundled self-contained archive.
- Platform-specific binaries: `gemini-darwin-arm64-unsigned.zip`, etc.

## NPM Package Structure

```
@google/gemini-cli/
├── bin/gemini.js         # CLI entry point
├── package.json
├── ...

@google/gemini-cli-core/
├── src/
│   ├── cli/              # CLI package
│   ├── core/             # Core package
│   └── tools/            # Tool implementations
├── dist/                 # Transpiled output (published)
└── package.json
```
