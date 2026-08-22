# Open Code Review Chocolatey Package

## Install

```powershell
choco install opencodereview
```

Chocolatey downloads the official 64-bit build at install time and puts it on your PATH. The package itself carries no binaries.

Install a specific version:

```powershell
choco install opencodereview --version=1.8.1
```

## What is Open Code Review?

Open-source & free , Battle-tested at Alibaba's scale. Hybrid architecture code review tool: deterministic pipelines + LLM Agent, precise line-level comments, built-in fine-tuned ruleset (NPE, thread-safety, XSS, SQL injection), OpenAI & Anthropic compatible.

## Usage

The package installs the `opencodereview` command. Open a new terminal after installing so the PATH change takes effect, then see the [Open Code Review documentation](https://open-codereview.ai) for the available options.

## Upgrade

```powershell
choco upgrade opencodereview
```

## Uninstall

```powershell
choco uninstall opencodereview
```

## Links

| Resource | URL |
| --- | --- |
| Website | https://open-codereview.ai |
| Source code | https://github.com/alibaba/open-code-review |
| Releases | https://github.com/alibaba/open-code-review/releases |
| Issues | https://github.com/alibaba/open-code-review/issues |
| Chocolatey page | https://community.chocolatey.org/packages/opencodereview |
| Package source | https://github.com/MKAbuMattar/chocolatey-packages/tree/main/automatic/opencodereview |

## License

This Chocolatey package is maintained by [@MKAbuMattar](https://github.com/MKAbuMattar) and licensed under the [MIT License](https://github.com/MKAbuMattar/chocolatey-packages/blob/main/LICENSE).

Open Code Review itself is distributed under its own [license](https://github.com/alibaba/open-code-review/blob/main/LICENSE).
