# pixi Chocolatey Package

## Install

```powershell
choco install pixi
```

To install by hand instead, follow the instructions at [pixi.sh](https://pixi.sh/) or in
the [pixi repository](https://github.com/prefix-dev/pixi).

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
