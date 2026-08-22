# LM Studio Chocolatey Package

## Install

```powershell
choco install lmstudio
```

Chocolatey downloads the official 64-bit installer at install time and runs it silently. The package itself carries no binaries.

Install a specific version:

```powershell
choco install lmstudio --version=<version>
```

## What is LM Studio?

LM Studio is a desktop application for running large language models on your own machine,
with no internet connection required. This package installs it.

## Features

- Runs LLMs locally and offline
- Chats with your local documents, added in version 0.3
- Serves models through the built-in chat interface or an OpenAI compatible local server
- Downloads compatible model files from Hugging Face
- Lists new and notable models on its Discover page

It supports GGUF models from Hugging Face, including Llama 3.2, Mistral, Phi, Gemma,
DeepSeek, Qwen 2.5 and StarCoder.

## Requirements

An M1, M2, M3 or M4 Mac, or a Windows or Linux PC with a processor that supports AVX2.
LM Studio is built on the [llama.cpp project](https://github.com/ggerganov/llama.cpp).

## Documentation

The technical documentation is at [lmstudio.ai/docs](https://lmstudio.ai/docs), and
release announcements go on the [LM Studio blog](https://lmstudio.ai/blog).

## Frequently asked questions

### Does LM Studio collect any data?

No. Running a model locally is the point, so your data stays on your machine. See
[Offline Operation](https://lmstudio.ai/docs/offline) for the details.

### What are the minimum hardware and software requirements?

The [System Requirements](https://lmstudio.ai/docs/system-requirements) page has the
current list.

## Upgrade

```powershell
choco upgrade lmstudio
```

## Uninstall

```powershell
choco uninstall lmstudio
```

## Links

| Resource | URL |
| --- | --- |
| Website | https://lmstudio.ai/ |
| Documentation | https://lmstudio.ai/docs/app |
| Issues | https://github.com/lmstudio-ai/lmstudio-bug-tracker/issues |
| Chocolatey page | https://community.chocolatey.org/packages/lmstudio |
| Package source | https://github.com/MKAbuMattar/chocolatey-packages/tree/main/automatic/lmstudio |

## License

This Chocolatey package is maintained by [@MKAbuMattar](https://github.com/MKAbuMattar) and licensed under the [MIT License](https://github.com/MKAbuMattar/chocolatey-packages/blob/main/LICENSE).

LM Studio itself is distributed under its own [license](https://lmstudio.ai/terms).
