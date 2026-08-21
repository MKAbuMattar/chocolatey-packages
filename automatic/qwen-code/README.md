# Qwen Code Chocolatey Package

## Install

```powershell
choco install qwen-code
```

Chocolatey downloads the official 64-bit archive at install time, unpacks it into the package tools directory and shims the executables it contains. The package itself carries no binaries.

Install a specific version:

```powershell
choco install qwen-code --version=0.21.1
```

## What is Qwen Code?

An open-source AI coding agent that lives in your terminal.

## Usage

The package installs the `qwen` command. Open a new terminal after installing so the PATH change takes effect, then see the [Qwen Code documentation](https://qwenlm.github.io/qwen-code-docs/en/users/overview) for the available options.

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
| Issues | https://github.com/QwenLM/qwen-code/issues |
| Chocolatey page | https://community.chocolatey.org/packages/qwen-code |
| Package source | https://github.com/MKAbuMattar/chocolatey-packages/tree/main/automatic/qwen-code |

## License

This Chocolatey package is maintained by [@MKAbuMattar](https://github.com/MKAbuMattar) and licensed under the [MIT License](https://github.com/MKAbuMattar/chocolatey-packages/blob/main/LICENSE).

Qwen Code itself is distributed under its own [license](https://github.com/QwenLM/qwen-code/blob/main/LICENSE).
