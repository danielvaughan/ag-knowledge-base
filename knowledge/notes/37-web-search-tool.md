# Web Search Tool (google\_web\_search)

## Source

https://google-gemini.github.io/gemini-cli/docs/tools/web-search.html

## Description

The `google_web_search` tool performs a web search using Google Search via the
Gemini API. It returns a summary of web results with sources.

## Arguments

The tool takes one argument:

| Argument | Type | Required | Description |
|---|---|---|---|
| `query` | string | Yes | The search query |

## Usage

```
google_web_search(query="Your query goes here.")
```

## Examples

Get information on a topic:

```
google_web_search(query="latest advancements in AI-powered code generation")
```

## How It Works

The `google_web_search` tool sends a query to the Gemini API, which performs a
web search. The tool returns a generated response based on the search results,
including citations and sources.

## Important Notes

- **Response format:** The tool returns a processed summary, not a raw list of
  search results.
- **Citations:** The response includes citations to the sources used to generate
  the summary.
