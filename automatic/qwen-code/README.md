# Qwen Code Chocolatey Package

## Install

```powershell
choco install qwen-code
```

Chocolatey downloads the official Windows build from the [QwenLM/qwen-code](https://github.com/QwenLM/qwen-code/releases) releases and puts it on your PATH.
The archive bundles its own Node.js runtime and a copy of ripgrep. Only the `qwen` command is put on your PATH, so the bundled `node`, `npm` and `rg` do not shadow anything you already have installed.

## What is Qwen Code?

An open-source AI coding agent that lives in your terminal.

## Upgrade

```powershell
choco upgrade qwen-code
```

## Uninstall

```powershell
choco uninstall qwen-code
```

## Links

| Resource | URL |
| --- | --- |
| Website | https://qwenlm.github.io/qwen-code-docs/en/users/overview |
| Source code | https://github.com/QwenLM/qwen-code |
| Releases | https://github.com/QwenLM/qwen-code/releases |
| Chocolatey page | https://community.chocolatey.org/packages/qwen-code |
| Package source | https://github.com/MKAbuMattar/chocolatey-packages/tree/main/automatic/qwen-code |

## License

This Chocolatey package is maintained by [@MKAbuMattar](https://github.com/MKAbuMattar) and licensed under the [MIT License](https://github.com/MKAbuMattar/chocolatey-packages/blob/main/LICENSE).

Qwen Code itself is distributed under its own [license](https://github.com/QwenLM/qwen-code/blob/main/LICENSE).
