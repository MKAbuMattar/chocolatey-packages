# Impeccable Chocolatey Package

## Install

```powershell
choco install impeccable
```

Chocolatey downloads the official 64-bit build at install time and puts it on your PATH. The package itself carries no binaries.

Install a specific version:

```powershell
choco install impeccable --version=<version>
```

## What is Impeccable?

A design language that gives an AI coding harness better design judgement. The skill
itself is a set of files, and it runs a small self-contained engine binary.

This package installs that engine. Without it the skill's launcher downloads the binary
on first run into `~/.impeccable/bin/`; installing it here puts a managed copy on your
PATH instead.

## Usage

The package installs the `impeccable` command. Open a new terminal after installing so the PATH change takes effect, then see the [Impeccable documentation](https://impeccable.style) for the available options.

## Upgrade

```powershell
choco upgrade impeccable
```

## Uninstall

```powershell
choco uninstall impeccable
```

## Links

| Resource | URL |
| --- | --- |
| Website | https://impeccable.style |
| Source code | https://github.com/pbakaus/impeccable |
| Releases | https://github.com/pbakaus/impeccable/releases |
| Issues | https://github.com/pbakaus/impeccable/issues |
| Chocolatey page | https://community.chocolatey.org/packages/impeccable |
| Package source | https://github.com/MKAbuMattar/chocolatey-packages/tree/main/automatic/impeccable |

## License

This Chocolatey package is maintained by [@MKAbuMattar](https://github.com/MKAbuMattar) and licensed under the [MIT License](https://github.com/MKAbuMattar/chocolatey-packages/blob/main/LICENSE).

Impeccable itself is distributed under its own [license](https://github.com/pbakaus/impeccable/blob/main/LICENSE).
