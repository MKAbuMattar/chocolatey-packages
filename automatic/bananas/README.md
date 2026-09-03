# Bananas Chocolatey Package

## Install

```powershell
choco install bananas
```

Chocolatey downloads the official 64-bit installer at install time and runs it silently. The package itself carries no binaries.

Install a specific version:

```powershell
choco install bananas --version=<version>
```

## What is Bananas?

Bananas, Cross-Platform screen sharing made simple.

## Renamed upstream

At v1.0.0 the project renamed itself from Bananas to p2p.kiwi, moved to
[p2p.kiwi](https://p2p.kiwi), and renamed the installer from `bananas-setup_x64.exe` to
`p2p-kiwi-setup_x64.exe`. The GitHub repository is still `mistweaverco/bananas`.

This package keeps the id `bananas`, because a published Chocolatey id cannot be renamed
in place. From 1.0.0 onward it installs p2p.kiwi.

## Upgrade

```powershell
choco upgrade bananas
```

## Uninstall

```powershell
choco uninstall bananas
```

## Links

| Resource | URL |
| --- | --- |
| Website | https://getbananas.net |
| Source code | https://github.com/mistweaverco/bananas |
| Releases | https://github.com/mistweaverco/bananas/releases |
| Issues | https://github.com/mistweaverco/bananas/issues |
| Chocolatey page | https://community.chocolatey.org/packages/bananas |
| Package source | https://github.com/MKAbuMattar/chocolatey-packages/tree/main/automatic/bananas |

## License

This Chocolatey package is maintained by [@MKAbuMattar](https://github.com/MKAbuMattar) and licensed under the [MIT License](https://github.com/MKAbuMattar/chocolatey-packages/blob/main/LICENSE).

Bananas itself is distributed under its own [license](https://github.com/mistweaverco/bananas/blob/main/LICENSE).
