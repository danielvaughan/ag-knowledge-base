# Quotas and Pricing for Gemini CLI

## Overview

Gemini CLI offers three tiers of usage: free, paid tier (fixed price),
and pay-as-you-go. Pricing is based on the authentication method used.

## Free Usage

### Google Account (Gemini Code Assist for Individuals)

- 1,000 model requests / user / day
- 60 model requests / user / minute
- Requests spread across the Gemini model family

Learn more at [Gemini Code Assist for
Individuals Limits](https://developers.google.com/gemini-code-assist/resources/quotas#quotas-for-agent-mode-gemini-cli).

### Gemini API Key (Unpaid)

- 250 model requests / user / day
- 10 model requests / user / minute
- Flash model only

Learn more at [Gemini API Rate
Limits](https://ai.google.dev/gemini-api/docs/rate-limits).

### Vertex AI (Express Mode)

- 90 days before billing is required
- Quotas and models are variable and specific to the account

Learn more at [Vertex AI Express Mode
Limits](https://cloud.google.com/vertex-ai/generative-ai/docs/start/express-mode/overview#quotas).

## Paid Tier (Fixed Price)

### Google AI Pro and AI Ultra Subscribers

- Access to Gemini Code Assist via Google login
- Higher quota limits than the free tier

Learn more at [Gemini Code Assist Quotas and
Limits](https://developers.google.com/gemini-code-assist/resources/quotas).

### Google Cloud Console Subscription

- **Gemini Code Assist Standard**:
  - 1,500 model requests / user / day
  - 120 model requests / user / minute
- **Gemini Code Assist Enterprise**:
  - 2,000 model requests / user / day
  - 120 model requests / user / minute

Models are selected across the Gemini family. See [Standard and Enterprise
license limits](https://developers.google.com/gemini-code-assist/resources/quotas#quotas-for-agent-mode-gemini-cli).

## Pay-As-You-Go

### Vertex AI (Regular Mode)

- Quota governed by a dynamic shared quota system or
  pre-purchased provisioned throughput
- Cost based on model and token usage

Learn more at [Vertex AI Dynamic Shared
Quota](https://cloud.google.com/vertex-ai/generative-ai/docs/resources/dynamic-shared-quota)
and [Vertex AI Pricing](https://cloud.google.com/vertex-ai/pricing).

### Gemini API Key

- Quota varies by pricing tier
- Cost varies by pricing tier and model/token usage

**Important:** When using an API key, you pay per token/call. This can be
more expensive for many small calls with few tokens, but ensures your
workflow is not interrupted by quota limits.

Learn more at [Gemini API Rate
Limits](https://ai.google.dev/gemini-api/docs/rate-limits) and [Gemini API
Pricing](https://ai.google.dev/gemini-api/docs/pricing).

## Gemini for Workspace Plans

Currently apply only to Google-based web products (Gemini web app, Flow
video editor). These plans do **not** apply to API usage powering Gemini
CLI. Support for Workspace plans is under active consideration for future
support.

## Tips to Avoid High Costs

- Do not blindly accept every suggestion, especially for computationally
  intensive tasks like refactoring large codebases.
- Be intentional with your prompts and commands. You are paying per call,
  so think about the most efficient way to get the job done.

## Understanding Your Usage

A summary of model usage is available through the `/stats` command and
presented on exit at the end of a session.

## Sources

- [Quotas and Pricing documentation](https://google-gemini.github.io/gemini-cli/docs/quota-and-pricing.html)
- [Gemini Code Assist Quotas and Limits](https://developers.google.com/gemini-code-assist/resources/quotas)
- [Gemini API Rate Limits](https://ai.google.dev/gemini-api/docs/rate-limits)
- [Gemini API Pricing](https://ai.google.dev/gemini-api/docs/pricing)
- [Vertex AI Pricing](https://cloud.google.com/vertex-ai/pricing)
