# Web Fetch and Web Search Tools

Gemini CLI exposes two web-oriented tools relevant to Antigravity-style
agentic development workflows: `web_fetch` and `google_web_search`.
They let an agent gather external web context without leaving the CLI
conversation, but they have different inputs and different output semantics.

## Source

- [Web Fetch Tool documentation](https://google-gemini.github.io/gemini-cli/docs/tools/web-fetch.html)
- [Web Search Tool documentation](https://google-gemini.github.io/gemini-cli/docs/tools/web-search.html)

## `web_fetch`

Use `web_fetch` when the user or agent already knows the URL or set of URLs to
inspect.
The tool accepts a natural-language `prompt` that must include at least one
`http://` or `https://` URL.
It can process up to 20 URLs in a single prompt.

The implementation first relies on Gemini API URL context.
If the Gemini API cannot access a URL, the tool can fall back to fetching
content directly from the local machine.
The response is generated from the fetched content and may include source
attribution or citations where possible.

Example:

```text
web_fetch(prompt="Summarize https://example.com/article and extract key risks.")
```

## `google_web_search`

Use `google_web_search` when the user or agent has a query rather than a known
URL.
The tool accepts a single required `query` string and sends it to the Gemini API,
which performs a Google Search.

The returned result is a processed summary with citations and sources.
It is not a raw search result list.

Example:

```text
google_web_search(query="latest advancements in AI-powered code generation")
```

## Workflow Implications

For engineering teams evaluating Antigravity CLI as the successor to Gemini CLI,
the distinction matters:

- Use `web_fetch` for known authoritative URLs, release notes, documentation
  pages, RFCs, issue links, and design docs.
- Use `google_web_search` for discovery when the agent needs to locate public
  material before summarizing it.
- Prefer explicit URLs for high-stakes technical claims because `web_fetch`
  narrows the source set.
- Treat `google_web_search` output as synthesized search context rather than a
  complete source inventory.

## Key Takeaways

- `web_fetch` is URL-first and prompt-driven.
- `google_web_search` is query-first and returns a generated summary.
- Both tools rely on Gemini API capabilities and return synthesized responses.
- Source quality still depends on the prompt, selected URLs, or search query.
