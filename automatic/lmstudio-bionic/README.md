# LM Studio Bionic Chocolatey Package

## Install

```powershell
choco install lmstudio-bionic
```

Chocolatey downloads the official 64-bit installer at install time and runs it silently. The package itself carries no binaries.

The download is about 620 MB, so the install takes a while on a slow connection.

Install a specific version:

```powershell
choco install lmstudio-bionic --version=<version>
```

## What is LM Studio Bionic?

An agent from LM Studio for working with open models, on coding, research and document
tasks. It runs models locally on your own machine, in LM Studio's cloud, or on a remote
machine over LM Link, and it can hold several sessions at once so separate pieces of work
run in parallel.

It is a separate application from LM Studio itself, and this package installs only Bionic.
For LM Studio, use the [lmstudio](https://community.chocolatey.org/packages/lmstudio)
package.

## Upgrade

```powershell
choco upgrade lmstudio-bionic
```

## Uninstall

```powershell
choco uninstall lmstudio-bionic
```

## Links

| Resource | URL |
| --- | --- |
| Website | https://lmstudio.ai/ |
| Documentation | https://lmstudio.ai/docs/bionic |
| Download page | https://lmstudio.ai/download/bionic |
| Issues | https://github.com/lmstudio-ai/lmstudio-bug-tracker/issues |
| Chocolatey page | https://community.chocolatey.org/packages/lmstudio-bionic |
| Package source | https://github.com/MKAbuMattar/chocolatey-packages/tree/main/automatic/lmstudio-bionic |

## License

This Chocolatey package is maintained by [@MKAbuMattar](https://github.com/MKAbuMattar) and licensed under the [MIT License](https://github.com/MKAbuMattar/chocolatey-packages/blob/main/LICENSE).

LM Studio Bionic itself is distributed under its own [terms](https://lmstudio.ai/terms).
