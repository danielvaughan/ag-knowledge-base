# Session Invocation API

The Session Invocation API is a major architectural addition introduced in the `v0.44.0-nightly` release, facilitating deeper integration with the Antigravity 2.0 ADK.

## Overview

The API provides structured ways to initiate and manage agent sessions, supporting both local and remote environments.

## Core Concepts

- **LocalSessionInvocation**: Used for initiating agent sessions that run locally on the user's machine.
- **RemoteSessionInvocation**: Used for initiating and managing agent sessions that run on remote infrastructure.

## Engineering Implications

The inclusion of this API suggests a move towards more complex, distributed agentic execution models, allowing for better orchestration between local development environments and remote cloud-based agentic platforms.
