# rtk Chocolatey Package

## Install

```powershell
choco install rtk
```

Chocolatey downloads the official 64-bit archive at install time, unpacks it into the package tools directory and shims the executables it contains. The package itself carries no binaries.

Install a specific version:

```powershell
choco install rtk --version=<version>
```

## What is rtk?

A command line proxy that sits in front of an LLM and cuts token consumption on common
development commands, upstream reporting 60 to 90 percent on those. It is a single Rust
binary with no dependencies.

## Upgrade

```powershell
choco upgrade rtk
```

## Uninstall

```powershell
choco uninstall rtk
```

## Links

| Resource | URL |
| --- | --- |
| Website | https://www.rtk-ai.app |
| Source code | https://github.com/rtk-ai/rtk |
| Releases | https://github.com/rtk-ai/rtk/releases |
| Issues | https://github.com/rtk-ai/rtk/issues |
| Chocolatey page | https://community.chocolatey.org/packages/rtk |
| Package source | https://github.com/MKAbuMattar/chocolatey-packages/tree/main/automatic/rtk |

## License

This Chocolatey package is maintained by [@MKAbuMattar](https://github.com/MKAbuMattar) and licensed under the [MIT License](https://github.com/MKAbuMattar/chocolatey-packages/blob/main/LICENSE).

rtk itself is distributed under its own [license](https://github.com/rtk-ai/rtk/blob/develop/LICENSE).
