# Pixi Chocolatey Package

## Install

```powershell
choco install pixi
```

Chocolatey downloads the official 64-bit build at install time and puts it on your PATH. The package itself carries no binaries.

Install a specific version:

```powershell
choco install pixi --version=0.77.0
```

## What is Pixi?

Pixi is a cross-platform, multi-language package manager and workflow tool built on the
conda ecosystem. It manages project dependencies the way cargo or npm do, except it is
not tied to one language. This package installs it.

## What it does

- Installs packages for Python, C++, R and other languages from conda channels
- Runs on Linux, Windows and macOS, including Apple Silicon
- Keeps a lock file up to date so environments can be reproduced
- Uses a command-line interface close to cargo's
- Installs tools per project or system wide
- Is written in Rust, on top of the [rattler](https://github.com/conda/rattler) library

Available packages are listed on [prefix.dev](https://prefix.dev/).

## Getting started

Initialize a new workspace:

```powershell
pixi init myworkspace
cd myworkspace
```

Add dependencies:

```powershell
pixi add python numpy pytest
```

Run tasks:

```powershell
pixi task add test 'pytest -s'
pixi run test
```

## Documentation

The official documentation is at [pixi.sh](https://pixi.sh/). Releases are listed in the
[GitHub repository](https://github.com/prefix-dev/pixi/releases).

## Usage

The package installs the `pixi` command. Open a new terminal after installing so the PATH change takes effect, then see the [Pixi documentation](https://pixi.sh/) for the available options.

## Upgrade

```powershell
choco upgrade pixi
```

## Uninstall

```powershell
choco uninstall pixi
```

## Links

| Resource | URL |
| --- | --- |
| Website | https://pixi.sh/ |
| Source code | https://github.com/prefix-dev/pixi |
| Releases | https://github.com/prefix-dev/pixi/releases |
| Issues | https://github.com/prefix-dev/pixi/issues |
| Chocolatey page | https://community.chocolatey.org/packages/pixi |
| Package source | https://github.com/MKAbuMattar/chocolatey-packages/tree/main/automatic/pixi |

## License

This Chocolatey package is maintained by [@MKAbuMattar](https://github.com/MKAbuMattar) and licensed under the [MIT License](https://github.com/MKAbuMattar/chocolatey-packages/blob/main/LICENSE).

Pixi itself is distributed under its own [license](https://github.com/prefix-dev/pixi/blob/main/LICENSE).
