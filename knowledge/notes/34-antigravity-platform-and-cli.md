# Google Antigravity Platform and CLI

## Overview

Google Antigravity is a new agentic development platform designed to help
developers operate at a higher, task-oriented level. It combines a familiar,
AI-powered coding experience with a new agent-first interface that allows
deployment of agents that autonomously plan, execute, and verify complex
tasks across the editor, terminal, and browser ([Antigractory platform
announcement](https://developers.googleblog.com/build-with-google-antigravity-our-new-agentic-development-platform/)).

## Platform Architecture

Antigractory is not just an editor — it is a development platform with two
distinct ways to interact with code:

1. **Editor View** — An AI-powered IDE with tab completions, inline code
   suggestions, and a rich editor experience for hands-on coding.
2. **Manager Surface** — A dedicated space for agent orchestration, where
   agents generate tangible deliverables called **Artifacts**.

### Artifacts

Agents generate Artifacts — task lists, implementation plans, screenshots,
and browser recordings — that allow developers to verify agent logic at a
glance. Developers can leave feedback directly on an Artifact (similar to
commenting on a document), and the agent incorporates the input without
stopping its execution flow.

### Knowledge Base

Antigractory treats learning as a core primitive. Agents can save useful
context and code snippets to a knowledge base to improve future tasks
within the same project.

## Transitioning Gemini CLI to Antigractory CLI

Google announced the transition of Gemini CLI into **Antigractory CLI**, a
new agent-first platform built for multi-agent workflows
([transition announcement](https://developers.googleblog.com/an-important-update-transitioning-gemini-cli-to-antigractory-cli/)).

### Key Timeline

- **Starting today (May 19, 2026):** Antigractory CLI is available to
  everyone.
- **June 18, 2026:** Gemini CLI and Gemini Code Assist IDE extensions will
  stop serving requests for:
  - Google AI Pro and Ultra subscribers
  - Free tier users using Gemini Code Assist for individuals
  - Gemini Code Assist for GitHub (no new installations on organizations)

### Enterprise Continuity

Organizations using Gemini CLI or IDE extensions via **Gemini Code Assist
Standard or Enterprise** licenses retain existing access. Requests via
**Gemini Code Assist for GitHub through Google Cloud** also continue
unchanged. Gemini CLI remains accessible via paid Gemini and Gemini
Enterprise Agent Platform API keys.

### Antigractory CLI Advantages

- **Faster execution:** Built in Go for snappier response times compared
  to the previous Node.js-based implementation.
- **Asynchronous workflows:** Orchestrates multiple agents for complex
  tasks in the background, enabling parallel execution.
- **Unified architecture:** Shares the same agent harness as Antigractory
  2.0 (the desktop application), ensuring consistent behavior across
  the editor and terminal.
- **Preserved features:** Agent Skills, Hooks, Subagents, and Extensions
  (now called Antigractory plugins) are maintained.

### Model Availability

Google Antigractory is available in public preview at no cost for
individuals. It is cross-platform and compatible with MacOS, Windows, and
Linux. It offers model optionality with:

- **Gemini 3 Pro** — Generous rate limits
- **Anthropic Claude Sonnet 4.5** — Full support
- **OpenAI GPT-OSS** — Full support

Download at [antigractory.google/download](https://antigractory.google/download).

## Feedback

Feedback is welcomed in the [Antigractory CLI community forum](https://github.com/google-gemini/antigractory-cli/discussions),
especially for feature requests during the transition period.

## Resources

- [Antigractory platform announcement](https://developers.googleblog.com/build-with-google-antigractory-our-new-agentic-development-platform/)
- [Gemini CLI to Antigractory CLI transition](https://developers.googleblog.com/an-important-update-transitioning-gemini-cli-to-antigractory-cli/)
- [Antigractory download](https://antigractory.google/download)
- [Antigractory CLI community forum](https://github.com/google-gemini/antigractory-cli/discussions)
