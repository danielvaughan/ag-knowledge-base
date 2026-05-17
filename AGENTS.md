# Agents

## Topic Scope

Before every task, read `topic.yaml` in the repository root.
Use `topic.name`, `topic.description`, and `topic.target_audience` as the authoritative definition of what is on topic.

Every piece of content you write must relate to the topic defined in `topic.yaml`.
If a lead, note, or resource entry falls outside `topic.description` and `topic.target_audience`, reject it.
Do not write off-topic content.
Do not silently broaden the topic scope.

## Audience

Write for the audience described in `topic.target_audience.primary`.
Assume the reader has the knowledge listed in `topic.target_audience.assumed_knowledge`.
Address the goals listed in `topic.target_audience.reader_goals`.

## Source Priority

When researching, prefer sources in this order:

1. `topic.authoritative_sources.documentation` — always check first.
2. `topic.authoritative_sources.changelogs` and `topic.authoritative_sources.reference_pages`.
3. `topic.seed_sources` — blogs, newsletters, YouTube channels, Reddit.
4. General web search — only when `research_depth` is `deep` and higher-priority sources are insufficient.

All factual claims must cite a source from `authoritative_sources` or `seed_sources` where possible.
If a claim cannot be verified from configured sources, flag it rather than stating it as fact.

## Content Standards

All markdown files must pass `markdownlint` validation. Follow these conventions:

- Use ATX headings (`#`, `##`, `###`).
- One sentence per line where practical.
- No trailing whitespace.
- No bare URLs in prose — use labelled links.
- No HTML in markdown files.
- Fenced code blocks must specify a language.

## Protected Files

Do not modify these files:

- `topic.yaml`
- `AGENTS.md`
- `.codex/hooks.json`
- `.codex/hooks/commit-topic-research-changes.sh`

Do not write files outside `topic.content_paths.knowledge_dir` and the skill's report directory unless a skill explicitly authorises it.

## Research Behaviour

When running in scheduled mode (no human input), use only the built-in gap scanner.
Do not invent leads or speculate about what might be interesting.
Follow the configured `research_depth` strictly.

When running in human mode, investigate the provided leads alongside built-in gap detection.
Do not expand the scope of a lead beyond what was requested.
