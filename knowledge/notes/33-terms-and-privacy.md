# Terms and Privacy

Gemini CLI terms and privacy obligations depend on the authentication method and
account type.
This matters for teams evaluating Antigravity CLI migration because data
handling can differ between individual accounts, enterprise accounts, Gemini API
keys, and Vertex AI backends.

## Source

[Gemini CLI Terms of Service and Privacy Notice](https://google-gemini.github.io/gemini-cli/docs/tos-privacy.html)

## Authentication Methods

The documentation identifies four authentication paths:

- Google account with Gemini Code Assist for individuals.
- Google account with Gemini Code Assist Standard or Enterprise.
- API key with the Gemini Developer API.
- API key with Vertex AI GenAI API.

Each path maps to different terms of service and privacy notices.

## Terms and Privacy Mapping

- Gemini Code Assist via Google, Individual: Google Terms of Service and Gemini
  Code Assist privacy notice for individuals.
- Gemini Code Assist via Google, Standard or Enterprise: Google Cloud Platform
  Terms of Service and Gemini Code Assist privacy notice for Standard and
  Enterprise.
- Gemini Developer API, Unpaid: Gemini API Terms for unpaid services and Google
  Privacy Policy.
- Gemini Developer API, Paid: Gemini API Terms for paid services and Google
  Privacy Policy.
- Vertex AI GenAI API, Cloud project: Google Cloud Platform Service Terms and
  Google Cloud Privacy Notice.

## Model Training and Data Use

For personal Google accounts using Gemini Code Assist for individuals, prompts,
answers, and related code may be collected and used to improve Google products,
including model training, unless relevant controls apply.

For Gemini Code Assist Standard or Enterprise accounts, prompts, answers, and
related code are treated as confidential and are not used to train models.

For Gemini Developer API keys, the answer depends on whether the service is
unpaid or paid.
Unpaid services may collect prompts, answers, and related code for product
improvement and model training.
Paid services treat inputs as confidential, with limited logging for abuse,
policy, legal, or regulatory purposes.

For Vertex AI GenAI API usage, prompts, answers, and related code are not used
to train models under the cited Cloud privacy terms.

## Usage Statistics

Usage Statistics is the shared control for optional data collection in Gemini
CLI.
For individual Google accounts and unpaid Gemini Developer API usage, enabling
the setting can allow collection of both anonymous telemetry and prompt or
answer content.
For Standard, Enterprise, paid Gemini Developer API, and Vertex AI usage, the
setting controls anonymous telemetry but does not permit model-training use of
prompts and answers according to the documentation.

## Workflow Implications

Engineering managers should decide which authentication path is acceptable
before adopting Gemini CLI or migrating teams toward Antigravity CLI.
Individual and unpaid paths can have materially different data-use implications
from Standard, Enterprise, paid API, or Vertex AI paths.

Software engineers should treat authentication selection as part of project
setup, not a purely personal preference, when working with private repositories,
customer code, or regulated data.

## Key Takeaways

- Terms and privacy vary by authentication method.
- Standard, Enterprise, paid Gemini Developer API, and Vertex AI paths provide
  stronger confidentiality positioning than individual or unpaid paths.
- Usage Statistics is the main optional-data control, but its effect depends on
  account type.
- Team adoption guidance should pair authentication setup with data-handling
  policy.
