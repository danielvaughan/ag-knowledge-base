# Google Developers Blog — Gemini CLI and Antigravity 2.0 Announcements

## Overview

Several major announcements from the Google Developers Blog cover the
transition from Gemini CLI to Antigravity CLI, new model integrations,
and agentic development examples.

## Transitioning Gemini CLI to Antigravity CLI

Google announced the transition of Gemini CLI into **Antigravity CLI**,
a new agent-first platform built for multi-agent workflows ([blog
post](https://developers.googleblog.com/an-important-update-transitioning-gemini-cli-to-antigravity-cli/)).

### Key Points

- Gemini CLI is being sunset in favor of Antigravity CLI, a Go-based
  terminal experience.
- Antigravity CLI shares the same agent harness as **Antigravity 2.0**
  (the desktop application).
- Features preserved: Agent Skills, Hooks, Subagents, and Extensions
  (renamed to Antigravity plugins).
- **June 18, 2026** is the sunset date for Gemini CLI for Google AI
  Pro/Ultra and free tier users.
- Enterprise customers retain existing access to Gemini CLI with paid
  Gemini and Gemini Enterprise Agent Platform API keys.
- Gemini Code Assist for GitHub stops new installations on
  organizations on the same date.

### Antigravity CLI Advantages

- **Faster execution**: Built in Go for snappier response times.
- **Asynchronous workflows**: Orchestrates multiple agents for complex
  tasks in the background.
- **Unified architecture**: Shares the same agent harness as Antigravity
  2.0.

## Gemini 3 Flash in Gemini CLI

**Gemini 3 Flash** is now available in Gemini CLI with a SWE-bench
Verified score of 78% for agentic coding ([blog
post](https://developers.googleblog.com/gemini-3-flash-is-now-available-in-gemini-cli/)).

### Highlights

- Achieves a SWE-bench Verified score of 78%, outperforming both
  Gemini 3 Pro and the 2.5 series.
- Available at less than a quarter the cost of Gemini 3 Pro.
- Ideal for high-frequency development tasks, large context windows,
  and rapid prototyping.

### Who Has Access

- **Paid tier**: Google AI Pro/Ultra subscribers, paid API key users,
  Gemini Code Assist users enabled by cloud admin for preview models.
- **Free tier**: Gradual rollout; earlier waitlist users received email
  invitations.

### How to Enable

First, upgrade to the latest Gemini CLI version (0.21.1 or later):

```bash
npm install -g @google/gemini-cli@latest
```

Then run `/settings` and toggle "Preview features" to `true`.
Finally, run `/model` to select Gemini 3.

## Gemini 3 Pro in Gemini CLI

**Gemini 3 Pro** integration was announced with five practical use cases
([blog
post](https://developers.googleblog.com/5-things-to-try-with-gemini-3-pro-in-gemini-cli/)):

1. Code review and PR analysis
2. Complex refactoring
3. 3D Voxel simulation
4. Documentation generation
5. Cloud Run performance debugging

### Access

- Google AI Ultra subscribers and paid API key users have immediate
  access.
- Gemini Code Assist Enterprise: Coming soon.
- All other users: Join the waitlist.

## Real-World Agent Examples with Gemini 3

Google collaborated with six frameworks to showcase Gemini 3-powered
agent workflows ([blog
post](https://developers.googleblog.com/real-world-agent-examples-with-gemini-3/)):

1. **ADK (Agent Development Kit)**: Model-agnostic framework for
  building scalable agentic workflows.
2. **Agno** (formerly Phidata): Multi-agent system framework with
  memory, knowledge, and tools.
3. **Browser Use**: Open-source library for AI browser automation.
4. **Eigent**: Local-first multi-agent platform using the CAMEL
  framework.
5. **Letta**: Stateful AI agent platform with memory hierarchy.
6. **mem0**: Smart memory layer for AI applications.

## Key Takeaways

- The Gemini CLI to Antigravity CLI transition marks a major strategic
  shift toward multi-agent platform.
- Gemini 3 Flash offers Pro-grade performance at lower cost.
- Gemini 3 Pro integration expands the scope of agentic tasks.
- The broader Gemini 3 ecosystem includes six integration partners.

## Sources

- [An important update: Transitioning Gemini CLI to Antigravity CLI](https://developers.googleblog.com/an-important-update-transitioning-gemini-cli-to-antigravity-cli/)
- [Gemini 3 Flash is now available in Gemini CLI](https://developers.googleblog.com/gemini-3-flash-is-now-available-in-gemini-cli/)
- [5 things to try with Gemini 3 Pro in Gemini CLI](https://developers.googleblog.com/5-things-to-try-with-gemini-3-pro-in-gemini-cli/)
- [Real-world agent examples with Gemini 3](https://developers.googleblog.com/real-world-agent-examples-with-gemini-3/)
