# omnictl Chocolatey Package

## Install

```powershell
choco install omnictl
```

Chocolatey downloads the official 64-bit build at install time and puts it on your PATH. The package itself carries no binaries.

Install a specific version:

```powershell
choco install omnictl --version=1.10.0
```

## What is omnictl?

SaaS-simple deployment of Kubernetes - on your own hardware.

## Usage

The package installs the `omnictl` command. Open a new terminal after installing so the PATH change takes effect, then see the [omnictl documentation](https://github.com/siderolabs/omni) for the available options.

## Upgrade

```powershell
choco upgrade omnictl
```

## Uninstall

```powershell
choco uninstall omnictl
```

## Links

| Resource | URL |
| --- | --- |
| Website | https://github.com/siderolabs/omni |
| Releases | https://github.com/siderolabs/omni/releases |
| Issues | https://github.com/siderolabs/omni/issues |
| Chocolatey page | https://community.chocolatey.org/packages/omnictl |
| Package source | https://github.com/MKAbuMattar/chocolatey-packages/tree/main/automatic/omnictl |

## License

This Chocolatey package is maintained by [@MKAbuMattar](https://github.com/MKAbuMattar) and licensed under the [MIT License](https://github.com/MKAbuMattar/chocolatey-packages/blob/main/LICENSE).

omnictl itself is distributed under its own [license](https://github.com/siderolabs/omni/blob/main/LICENSE).
