# Web Fetch Tool (web\_fetch)

## Source

https://google-gemini.github.io/gemini-cli/docs/tools/web-fetch.html

## Description

The `web_fetch` tool summarizes, compares, or extracts information from web
pages. It processes content from one or more URLs (up to 20) embedded in a
prompt. The tool takes a natural language prompt and returns a generated
response.

## Arguments

| Argument | Type | Required | Description |
|---|---|---|---|
| `prompt` | string | Yes | A comprehensive prompt that includes the URL(s) (up to 20)
  to fetch and specific instructions on how to process their content. Must
  contain at least one URL starting with `http://` or `https://`. |

## Usage

```
web_fetch(prompt="Your prompt, including a URL such as https://google.com.")
```

## Examples

### Summarize a single article

```
web_fetch(prompt="Can you summarize the main points of https://example.com/news/latest")
```

### Compare two articles

```
web_fetch(prompt="What are the differences in the conclusions of these two papers: https://arxiv.org/abs/2401.0001 and https://arxiv.org/abs/2401.0002?")
```

## How It Works

1. Provide a natural language prompt that contains URLs.
2. The tool asks for confirmation before fetching any URLs.
3. Once confirmed, URLs are processed through Gemini API's `urlContext`.
4. If the Gemini API cannot access a URL, it falls back to fetching content
   directly from the local machine.
5. The tool formats the response, including source attribution and citations.

## Important Notes

- **URL processing:** `web_fetch` relies on the Gemini API's ability to access
  and process the given URLs.
- **Output quality:** The quality of the output depends on the clarity of the
  instructions in the prompt.
- **URL limit:** Up to 20 URLs can be included in a single prompt.
