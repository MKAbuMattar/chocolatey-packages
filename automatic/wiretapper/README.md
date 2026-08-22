# WireTapper Chocolatey Package

## Install

```powershell
choco install wiretapper
```

Chocolatey downloads the official 64-bit build at install time and puts it on your PATH. The package itself carries no binaries.

Install a specific version:

```powershell
choco install wiretapper --version=<version>
```

## What is WireTapper?

WireTapper is a wireless OSINT tool that passively detects and maps Wi-Fi, Bluetooth, CCTV cameras, vehicles, headphones, TVs, IoT devices, and cell towers, turning nearby radio signals into clear situational intelligence.

## Usage

The package installs the `wiretapper` command. Open a new terminal after installing so the PATH change takes effect, then see the [WireTapper documentation](https://github.com/h9zdev/WireTapper) for the available options.

## Upgrade

```powershell
choco upgrade wiretapper
```

## Uninstall

```powershell
choco uninstall wiretapper
```

## Links

| Resource | URL |
| --- | --- |
| Website | https://github.com/h9zdev/WireTapper |
| Releases | https://github.com/h9zdev/WireTapper/releases |
| Issues | https://github.com/h9zdev/WireTapper/issues |
| Chocolatey page | https://community.chocolatey.org/packages/wiretapper |
| Package source | https://github.com/MKAbuMattar/chocolatey-packages/tree/main/automatic/wiretapper |

## License

This Chocolatey package is maintained by [@MKAbuMattar](https://github.com/MKAbuMattar) and licensed under the [MIT License](https://github.com/MKAbuMattar/chocolatey-packages/blob/main/LICENSE).

WireTapper itself is distributed under its own [license](https://github.com/h9zdev/WireTapper/blob/main/LICENSE-NONCOMMERCIAL.md).
