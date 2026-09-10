# patent Chocolatey Package

## Install

```powershell
choco install patent
```

Chocolatey downloads the official 64-bit archive at install time, unpacks it into the package tools directory and shims the executables it contains. The package itself carries no binaries.

Install a specific version:

```powershell
choco install patent --version=<version>
```

## What is patent?

A prior-art search for developer tool ideas. You describe what you are thinking of
building and it looks for projects that already ship it, so you find out before writing
the code rather than after.

It runs on the command line and uses embeddings, either through Ollama locally or a
hosted model.

## Upgrade

```powershell
choco upgrade patent
```

## Uninstall

```powershell
choco uninstall patent
```

## Links

| Resource | URL |
| --- | --- |
| Website | https://crates.io/crates/patent |
| Source code | https://github.com/r14dd/patent |
| Releases | https://github.com/r14dd/patent/releases |
| Issues | https://github.com/r14dd/patent/issues |
| Chocolatey page | https://community.chocolatey.org/packages/patent |
| Package source | https://github.com/MKAbuMattar/chocolatey-packages/tree/main/automatic/patent |

## License

This Chocolatey package is maintained by [@MKAbuMattar](https://github.com/MKAbuMattar) and licensed under the [MIT License](https://github.com/MKAbuMattar/chocolatey-packages/blob/main/LICENSE).

patent itself is distributed under its own [license](https://github.com/r14dd/patent/blob/main/LICENSE-APACHE).
