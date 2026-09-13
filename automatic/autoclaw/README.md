# AutoClaw Chocolatey Package

## Install

```powershell
choco install autoclaw
```

Chocolatey downloads the official 64-bit installer at install time and runs it silently. The package itself carries no binaries.

Install a specific version:

```powershell
choco install autoclaw --version=<version>
```

## What is AutoClaw?

AutoClaw is Z.ai's AI agent for desktop, built on the GLM models. It ships with skills for documents, data analysis, browser automation and instant messaging workflows.

An account is needed to use it. The application is free to download, and it is closed source.

## Upgrade

```powershell
choco upgrade autoclaw
```

AutoClaw also updates itself. Upgrading through Chocolatey installs the same build the application's own updater would fetch, because this package tracks the update feed the application reads.

## Uninstall

```powershell
choco uninstall autoclaw
```

## Links

| Resource | URL |
| --- | --- |
| Website | https://autoclaw.z.ai/ |
| User agreement | https://autoclaw.z.ai/privacy/md2html/?md=autoclaw_agreement&favicon=autoglm |
| Privacy policy | https://autoclaw.z.ai/privacy/md2html/?md=autoclaw_privacy&favicon=autoglm |
| Chocolatey page | https://community.chocolatey.org/packages/autoclaw |
| Package source | https://github.com/MKAbuMattar/chocolatey-packages/tree/main/automatic/autoclaw |

## License

This Chocolatey package is maintained by [@MKAbuMattar](https://github.com/MKAbuMattar) and licensed under the [MIT License](https://github.com/MKAbuMattar/chocolatey-packages/blob/main/LICENSE).

AutoClaw itself is proprietary software from Z.ai, covered by its [user agreement](https://autoclaw.z.ai/privacy/md2html/?md=autoclaw_agreement&favicon=autoglm).
