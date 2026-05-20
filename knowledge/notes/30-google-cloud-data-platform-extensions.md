# Google Cloud Data Platform Extensions for Gemini CLI

## Overview

The Gemini CLI v0.6.0 release (2025-09-15) introduced a comprehensive
suite of Google Cloud data platform extensions, enabling direct
database and data service integration from within the CLI ([changelog
entry](https://google-gemini.github.io/gemini-cli/docs/changelogs/)).

These extensions were announced in a Google Cloud blog post on
2025-09-24 ([Sujatha Mandava](https://cloud.google.com/blog/products/databases/gemini-cli-extensions-for-google-data-cloud),
[Sandeep Karmarkar](https://cloud.google.com/blog/products/databases/gemini-cli-extensions-for-google-data-cloud)).

## Supported Data Platform Extensions

### Database Extensions

| Extension | Capabilities | Supported Engines |
|---|---|---|
| AlloyDB | Interact, manage, observe | PostgreSQL |
| Cloud SQL | Interact, manage, observe | PostgreSQL, MySQL, SQL Server |
| Firestore | Interact with databases, collections, documents | Firestore |
| Looker | Query data, run Looks, create dashboards | Looker |
| MySQL | Interact with databases | MySQL |
| Postgres | Interact with databases | PostgreSQL |
| Spanner | Interact with databases | Spanner |
| SQL Server | Interact with databases | SQL Server |
| BigQuery | Query datasets, contextual insights via sub-agent | BigQuery |

### Data Governance

| Extension | Capabilities |
|---|---|
| Dataplex | Discover, manage, govern data and AI artifacts |

### Connectivity

| Extension | Capabilities |
|---|---|
| MCP Toolbox | Configure and load custom tools for 30+ data sources |

## Installation

Each extension is installed as a separate Gemini CLI extension package.
Full installation instructions are available in the [Google Cloud blog
post](https://cloud.google.com/blog/products/databases/gemini-cli-extensions-for-google-data-cloud).

## Use Cases

- Database administration and monitoring directly from the terminal
- SQL query execution without switching to a database GUI
- BigQuery analysis with Gemini-powered contextual insights
- Data governance workflows through Dataplex integration
- Cross-database queries via the MCP Toolbox for 30+ data sources

## Context

These extensions represent a strategic push to make Gemini CLI a
first-class tool for data engineering workflows, complementing the
existing code development capabilities. The breadth of supported
databases (PostgreSQL, MySQL, SQL Server, Firestore, Spanner) and
data platforms (BigQuery, Dataplex, Looker) positions Gemini CLI
as a potential primary interface for Google Cloud data operations.

## Sources

- [Gemini CLI changelog v0.6.0](https://google-gemini.github.io/gemini-cli/docs/changelogs/)
- [Google Cloud: Gemini CLI Extensions for Google Data Cloud](https://cloud.google.com/blog/products/databases/gemini-cli-extensions-for-google-data-cloud)
