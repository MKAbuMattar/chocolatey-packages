# CC Switch Chocolatey Package

## Install

```powershell
choco install cc-switch
```

Chocolatey downloads the official 64-bit installer at install time and runs it silently. The package itself carries no binaries.

Install a specific version:

```powershell
choco install cc-switch --version=<version>
```

## What is CC Switch?

A desktop application for managing and switching between coding agents, covering Claude
Code, Codex, OpenCode and others from one window.

Upstream also publishes a portable zip. This package installs the MSI, so Windows records
the install and Chocolatey can uninstall it cleanly.

## Upgrade

```powershell
choco upgrade cc-switch
```

## Uninstall

```powershell
choco uninstall cc-switch
```

## Links

| Resource | URL |
| --- | --- |
| Website | https://ccswitch.io |
| Source code | https://github.com/farion1231/cc-switch |
| Releases | https://github.com/farion1231/cc-switch/releases |
| Issues | https://github.com/farion1231/cc-switch/issues |
| Chocolatey page | https://community.chocolatey.org/packages/cc-switch |
| Package source | https://github.com/MKAbuMattar/chocolatey-packages/tree/main/automatic/cc-switch |

## License

This Chocolatey package is maintained by [@MKAbuMattar](https://github.com/MKAbuMattar) and licensed under the [MIT License](https://github.com/MKAbuMattar/chocolatey-packages/blob/main/LICENSE).

CC Switch itself is distributed under its own [license](https://github.com/farion1231/cc-switch/blob/main/LICENSE).
