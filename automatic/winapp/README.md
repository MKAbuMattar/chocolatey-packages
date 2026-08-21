# winapp CLI Chocolatey Package

## Install

```powershell
choco install winapp
```

Chocolatey downloads the official 64-bit archive at install time, unpacks it into the package tools directory and shims the executables it contains. The package itself carries no binaries.

Install a specific version:

```powershell
choco install winapp --version=0.5.0
```

## What is winapp CLI?

winapp, the Windows App Development CLI, is a single command-line interface for managing Windows SDKs, packaging, generating app identity, manifests, certificates, and using build tools with any app framework.

## Upgrade

```powershell
choco upgrade winapp
```

## Uninstall

```powershell
choco uninstall winapp
```

## Links

| Resource | URL |
| --- | --- |
| Website | https://github.com/microsoft/winappCli |
| Releases | https://github.com/microsoft/winappCli/releases |
| Issues | https://github.com/microsoft/winappCli/issues |
| Chocolatey page | https://community.chocolatey.org/packages/winapp |
| Package source | https://github.com/MKAbuMattar/chocolatey-packages/tree/main/automatic/winapp |

## License

This Chocolatey package is maintained by [@MKAbuMattar](https://github.com/MKAbuMattar) and licensed under the [MIT License](https://github.com/MKAbuMattar/chocolatey-packages/blob/main/LICENSE).

winapp CLI itself is distributed under its own [license](https://github.com/microsoft/winappCli/blob/main/LICENSE).
