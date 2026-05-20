# Token Caching and Cost Optimization

> **Note:** Antigravity 2.0 is Google's codename for the next-generation agentic
> development platform. The current public-facing implementation is distributed as
> **Gemini CLI** (`@google/gemini-cli`). This note tracks the authoritative public
> information available as of **2026-05-20**.

## Overview

Gemini CLI automatically optimizes API costs through token caching when using API
key authentication. This feature reuses previous system instructions and context
to reduce the number of tokens processed in subsequent requests.

Source: [Token Caching and Cost Optimization](https://google-gemini.github.io/gemini-cli/docs/cli/token-caching.html)

## How It Works

When a user interacts with Gemini CLI, the system instructions and conversation
context are sent to the Gemini API. On subsequent interactions, Gemini CLI caches
these instructions and context, reusing them for later requests rather than
resending the full content. This significantly reduces the number of tokens billed
to the user's API quota.

## Supported Authentication Methods

| Method | Cached |
|---|---|
| API key (Gemini API key) | Yes |
| Vertex AI (with project and location setup) | Yes |
| OAuth (Google Personal/Enterprise accounts) | No |

OAuth users are not supported for cached content creation via the Code Assist API
at this time.

## Viewing Cached Token Savings

Users can view their token usage and cached token savings using the `/stats`
command. When cached tokens are available, they will be displayed in the stats
output alongside token usage information.

## Sources

- [Token Caching and Cost Optimization](https://google-gemini.github.io/gemini-cli/docs/cli/token-caching.html)
