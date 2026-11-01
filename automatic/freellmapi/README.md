# FreeLLMAPI Chocolatey Package

## What is FreeLLMAPI?

FreeLLMAPI aggregates the free tiers of dozens of LLM providers, plus any custom
OpenAI-compatible endpoint, behind a single OpenAI-compatible `/v1` API. A router picks
the best available model for each request, fails over to the next provider when one is
rate-limited, and tracks per-key usage so you stay under every free-tier cap. Keys are
stored encrypted.

Upstream states it is for personal experimentation only.

## Usage

The package installs the FreeLLMAPI desktop app. Start it from the Start Menu, add your
provider keys and point any OpenAI client at its `/v1` endpoint. See
[freellmapi.co](https://freellmapi.co) for more.
