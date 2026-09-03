# Buzz Chocolatey Package

## Install

```powershell
choco install buzz --pre
```

Chocolatey downloads the official 64-bit installer at install time and runs it silently. The package itself carries no binaries.

Upstream ships only an alpha build for Windows, so every version of this package is
marked as a prerelease. `--pre` is required, because `choco install buzz` on its own
installs the newest stable version and there is none.

Install a specific version:

```powershell
choco install buzz --version=<version>
```

## What is Buzz?

A hive mind communication platform.

## Prerelease and unsigned

The only Windows build upstream publishes is named `Buzz_<version>_x64-setup_alpha-unsigned.exe`,
and has been for every desktop release. Two things follow from that.

It is an alpha. Upstream has not called a Windows build stable, so treat it as
unfinished software.

It is unsigned. Windows SmartScreen will warn on it, and the installer carries no
Authenticode signature to check the publisher against. The package verifies the download
against a SHA256 checksum recorded in the install script, which confirms the file is the
one upstream published and says nothing about who wrote it.

## Upgrade

```powershell
choco upgrade buzz
```

## Uninstall

```powershell
choco uninstall buzz
```

## Links

| Resource | URL |
| --- | --- |
| Website | https://github.com/block/buzz |
| Releases | https://github.com/block/buzz/releases |
| Issues | https://github.com/block/buzz/issues |
| Chocolatey page | https://community.chocolatey.org/packages/buzz |
| Package source | https://github.com/MKAbuMattar/chocolatey-packages/tree/main/automatic/buzz |

## License

This Chocolatey package is maintained by [@MKAbuMattar](https://github.com/MKAbuMattar) and licensed under the [MIT License](https://github.com/MKAbuMattar/chocolatey-packages/blob/main/LICENSE).

Buzz itself is distributed under its own [license](https://github.com/block/buzz/blob/main/LICENSE).
