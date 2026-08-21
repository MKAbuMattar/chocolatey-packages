# Strix Chocolatey Package

## Install

```powershell
choco install strix
```

Chocolatey downloads the official 64-bit archive at install time, unpacks it into the package tools directory and shims the executables it contains. The package itself carries no binaries.

Install a specific version:

```powershell
choco install strix --version=1.4.1
```

## What is Strix?

Open-source AI penetration testing tool to find and fix your app's vulnerabilities.

## Usage

The package installs the `strix` command. Open a new terminal after installing so the PATH change takes effect, then see the [Strix documentation](https://strix.ai) for the available options.

## Upgrade

```powershell
choco upgrade strix
```

## Uninstall

```powershell
choco uninstall strix
```

## Links

| Resource | URL |
| --- | --- |
| Website | https://strix.ai |
| Source code | https://github.com/usestrix/strix |
| Releases | https://github.com/usestrix/strix/releases |
| Issues | https://github.com/usestrix/strix/issues |
| Chocolatey page | https://community.chocolatey.org/packages/strix |
| Package source | https://github.com/MKAbuMattar/chocolatey-packages/tree/main/automatic/strix |

## License

This Chocolatey package is maintained by [@MKAbuMattar](https://github.com/MKAbuMattar) and licensed under the [MIT License](https://github.com/MKAbuMattar/chocolatey-packages/blob/main/LICENSE).

Strix itself is distributed under its own [license](https://github.com/usestrix/strix/blob/main/LICENSE).
