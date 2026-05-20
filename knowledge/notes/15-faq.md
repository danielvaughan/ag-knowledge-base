# Frequently Asked Questions

> **Note:** Antigravity 2.0 is Google's codename for the next-generation agentic
> development platform. The current public-facing implementation is distributed as
> **Gemini CLI** (`@google/gemini-cli`). This note tracks the authoritative public
> information available as of **2026-05-20**.

## Overview

The Gemini CLI documentation includes a comprehensive FAQ covering general issues,
installation, configuration, and subscription-related topics.

Source: [FAQ](https://google-gemini.github.io/gemini-cli/docs/faq.html)

## General Issues

### API Error 429 — Resource Exhausted

This error indicates that the API request limit has been exceeded. The Gemini API
has rate limits to prevent abuse and ensure fair usage.

**Resolution:**
- Check usage via the Google AI Studio or Google Cloud project dashboard.
- Optimize prompts: batch prompts or introduce delays between requests.

## Installation and Updates

### Updating to the Latest Version

- **npm install**: Run `npm install -g @google/gemini-cli@latest`.
- **Compiled from source**: Pull the latest changes from the repository and
  rebuild.

## Platform-Specific Issues

### CLI Crash on Windows (chmod)

Commands like `chmod` are specific to Unix-like operating systems (Linux, macOS)
and are not available on Windows by default.

**Resolution:**
- Use Windows equivalents: `icacls` to modify file permissions.
- Use a compatibility layer: Git Bash or Windows Subsystem for Linux (WSL).

## Configuration

### Configuring GOOGLE_CLOUD_PROJECT

Set the `GOOGLE_CLOUD_PROJECT` environment variable in your shell:

```bash
export GOOGLE_CLOUD_PROJECT="your-project-id"
```

For a permanent setting, add the line to your shell's startup file (e.g.,
`~/.bashrc` or `~/.zshrc`).

## Google AI Pro/Ultra Subscription FAQs

### What are the benefits of Google AI Pro or Ultra?

Subscribers to Google AI Pro or Ultra automatically have higher limits for Gemini
Code Assist and Gemini CLI. These limits are shared across Gemini CLI and agent
mode in the IDE.

### Where to learn more?

Visit the Manage Subscription page in your subscription settings for details on
your Google AI Pro or Ultra plan.

### Where to find more help?

Search the [Gemini CLI issue tracker on GitHub](https://github.com/google-gemini/gemini-cli/issues).
If you can't find a similar issue, consider creating a new GitHub Issue with a
detailed description. Pull requests are also welcome.

## Sources

- [FAQ](https://google-gemini.github.io/gemini-cli/docs/faq.html)
