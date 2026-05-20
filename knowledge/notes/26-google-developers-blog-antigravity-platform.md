# Google Developers Blog — Google Antigravity Platform and ADK

## Google Antigravity Platform

Google introduced **Google Antigravity**, a new agentic development
platform for orchestrating code ([blog
post](https://developers.googleblog.com/build-with-google-antigravity-our-new-agentic-development-platform/)).

### Platform Components

- **Editor View**: State-of-the-art, AI-powered IDE with tab completions
  and inline commands for synchronous workflows.
- **Manager Surface**: Dedicated interface where you can spawn,
  orchestrate, and observe multiple agents working asynchronously across
  different workspaces.

### Use Cases

- Delegate complex, multi-tool software tasks to agents.
- Request UI changes at a higher task-oriented level.
- Dispatch agents for long-running maintenance tasks or bug fixes in
  the background.

### Artifacts System

Agents generate **Artifacts** — tangible deliverables like task lists,
implementation plans, screenshots, and browser recordings — for easy
verification. Users can leave feedback on Artifacts.

### Availability

- Available now in public preview, at no cost for individuals.
- Cross-platform: MacOS, Windows, and Linux.
- Model optionality: Gemini 3 Pro, Anthropic Claude Sonnet 4.5, OpenAI
  GPT-OSS.
- Download at [antigravity.google/download](http://goo.gle/AGY).

## Long-Running AI Agents with ADK

A detailed tutorial on building production-grade, long-running AI agents
using the **Agent Development Kit (ADK)** is available ([blog
post](https://developers.googleblog.com/build-long-running-ai-agents-that-pause-resume-and-never-lose-context-with-adk/)).

### Problem: Stateless Agents Break on Real Workflows

- **Prompt context pollution**: Conversation history fills up over days.
- **Token cost explosion**: Replaying full history burns token budgets.
- **Reasoning hallucinations over idle time**: Models hallucinate steps
  after long pauses.

### Solution: Three Architectural Shifts

1. **Durable memory schemas**: Instead of dumping raw JSON into a vector
   database.
2. **Event-driven dormancy gates**: Instead of active polling or blocked
   threads.
3. **Multi-agent delegation**: Instead of monolithic single-agent
   prompts.

### Tutorial: New Hire Onboarding Coordinator Agent

The tutorial walks through building an onboarding agent that runs
reliably for weeks with:

- Welcome packet delivery
- Pause for document signatures
- Delegation to IT sub-agent for provisioning
- Resume after hardware delivery
- Personalized day-one scheduling

All without losing a single byte of context.

### Bootstrap with Agents CLI

The tutorial uses the [Agents
CLI](https://github.com/google/agents-cli) to scaffold the project:

```bash
uv tool install google-agents-cli
```

### Source Code

Available at [GitHub](https://github.com/GoogleCloudPlatform/generative-ai/tree/main/agents/adk/new-hire-onboarding).

## Sources

- [Build with Google Antigravity, our new agentic development platform](https://developers.googleblog.com/build-with-google-antigravity-our-new-agentic-development-platform/)
- [Build Long-running AI agents with ADK](https://developers.googleblog.com/build-long-running-ai-agents-that-pause-resume-and-never-lose-context-with-adk/)
