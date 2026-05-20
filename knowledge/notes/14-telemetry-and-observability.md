# Telemetry and Observability with OpenTelemetry

> **Note:** Antigravity 2.0 is Google's codename for the next-generation agentic
> development platform. The current public-facing implementation is distributed as
> **Gemini CLI** (`@google/gemini-cli`). This note tracks the authoritative public
> information available as of **2026-05-20**.

## Overview

Gemini CLI is built on [OpenTelemetry](https://opentelemetry.io/), the vendor-neutral,
industry-standard observability framework. This integration enables comprehensive
monitoring, analytics, and debugging of CLI usage.

Source: [Observability with OpenTelemetry](https://google-gemini.github.io/gemini-cli/docs/cli/telemetry.html)

## Key Benefits

- **Usage Analytics** — Understand interaction patterns and feature adoption.
- **Performance Monitoring** — Track response times, token consumption, and
  resource utilization.
- **Real-time Debugging** — Identify bottlenecks, failures, and error patterns.
- **Workflow Optimization** — Make informed decisions about configurations.
- **Enterprise Governance** — Monitor usage across teams, track costs, ensure
  compliance, and integrate with existing monitoring infrastructure.

## Universal Compatibility

Gemini CLI can export telemetry data to any OpenTelemetry backend:

- Google Cloud
- Jaeger
- Prometheus
- Datadog
- Other OpenTelemetry-compatible collectors

## Configuration

Enable telemetry by setting the appropriate configuration in your
`settings.json` file. The telemetry section controls the exporter type,
sampling rate, and target endpoints.

## Telemetry Export Options

### Google Cloud Telemetry

#### Prerequisites

A Google Cloud project with the appropriate APIs enabled (Cloud Trace, Cloud
Metrics).

#### Direct Export (Recommended)

Configures Gemini CLI to export directly to Google Cloud Trace and Metrics
without an intermediate collector.

#### Collector-Based Export (Advanced)

Routes telemetry through a self-hosted OpenTelemetry collector before sending
to Google Cloud. Provides more control over data processing and filtering.

### Local Telemetry

#### File-based Output (Recommended)

Exports telemetry data to local JSON files for offline analysis. Useful for
development and debugging.

#### Collector-based Export

Routes local telemetry through an OpenTelemetry collector running on the
local machine.

## Metrics

### Custom Metrics

Gemini CLI emits a range of custom metrics including:

- **`gemini_cli.command.execute`** (Counter, s): Tracks command execution counts
  and durations with attributes for command name, exit code, and execution
  mode.
- **`gemini_cli.tool.execute`** (Counter, s): Tracks tool usage with attributes
  for tool name, success status, execution time, and file-level details
  (`model_added_lines`, `model_removed_lines`, `user_added_lines`,
  `user_removed_lines`, `programming_language`, `extension`).
- **`gemini_cli.chat_compression`** (Counter, Int): Counts chat compression
  operations with `tokens_before` and `tokens_after` attributes.

### GenAI Semantic Convention

Gemini CLI complies with the [OpenTelemetry GenAI semantic conventions](https://github.com/open-telemetry/semantic-conventions/blob/main/docs/gen-ai/gen-ai-metrics.md):

- **`gen_ai.client.token.usage`** (Histogram, token): Input and output tokens
  per operation. Attributes include `gen_ai.operation.name`, `gen_ai.provider.name`,
  `gen_ai.token.type`, `gen_ai.request.model`, `gen_ai.response.model`.
- **`gen_ai.client.operation.duration`** (Histogram, s): GenAI operation duration.
  Attributes include `gen_ai.operation.name`, `gen_ai.provider.name`,
  `gen_ai.request.model`, `gen_ai.response.model`, `error.type`.

## Sources

- [Observability with OpenTelemetry](https://google-gemini.github.io/gemini-cli/docs/cli/telemetry.html)
