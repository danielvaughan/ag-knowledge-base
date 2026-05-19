# Authentication Setup

> Source: [Authentication](https://google-gemini.github.io/gemini-cli/docs/get-started/authentication.html)

## Authentication Options

### 1. Login with Google (Recommended)

For users with Google AI Pro or Google AI Ultra subscriptions.

**Setup:**
1. Select "Login with Google" in the CLI.
2. Follow browser-based OAuth flow (redirects to localhost).
3. Credentials cached locally for future sessions.

**Requirements:**
- A web browser on the same machine as the terminal.
- Google account associated with the subscription.

**(Optional) GOOGLE_CLOUD_PROJECT:**
May be prompted if using:
- Google Workspace account
- Gemini Code Assist license from Google Developer Program
- Enterprise license

### 2. Gemini API Key

For API key authentication:

```bash
export GEMINI_API_KEY="your-api-key"
```

Can also be set via `.env` file (see Configuration note).

### 3. Vertex AI

For enterprise or Vertex AI users:

```bash
export GOOGLE_GENAI_USE_VERTEXAI=true
export GOOGLE_CLOUD_PROJECT="your-project-id"
export GOOGLE_CLOUD_LOCATION="us-central1"
```

**With ADC (Application Default Credentials):**
```bash
export GOOGLE_APPLICATION_CREDENTIALS="/path/to/service-account.json"
```

**With Google Cloud API Key:**
```bash
export GOOGLE_API_KEY="your-gcloud-api-key"
```

## Persisting Environment Variables

### Shell Configuration
```bash
echo 'export GOOGLE_CLOUD_PROJECT="YOUR_PROJECT_ID"' >> ~/.bashrc
source ~/.bashrc
```

### .env File
Create `.gemini/.env` in project or home directory:

```bash
mkdir -p ~/.gemini
cat >> ~/.gemini/.env << EOF
GOOGLE_CLOUD_PROJECT="your-project-id"
GEMINI_API_KEY="your-api-key"
EOF
```

### .env File Search Order
1. `<project>/.gemini/.env`
2. `~/.gemini/.env`
3. `~/.env`

First file found is used (not merged).

## Non-Interactive Mode

For CI/CD or headless environments:
- Uses cached credentials if available.
- If no cached credentials, **must** configure via environment variables.
- CLI exits with error if no suitable environment variables found.

## Google Cloud Shell

Authentication is typically automatic when running in Google Cloud Shell
using Cloud Shell credentials.

## Impact of Auth Method

Your authentication method affects:
- Quotas and rate limits
- Pricing model
- Terms of Service
- Privacy notices

### Auth Method Comparison

| Auth Method          | Free Tier       | Paid Model           | Models Available    |
|------     |---      |----  |----       |---|----|
| Login with Google  | 1000/day, 60/min | Fixed (Code Assist)  | Gemini family       |
| Gemini API Key     | 250/day, 10/min | Pay-per-token         | Flash (free), others (paid) |
| Vertex AI          | 90 days free      | Dynamic shared quota  | Variable            |
