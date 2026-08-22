# cdxgen Chocolatey Package

## Install

```powershell
choco install cdxgen
```

Chocolatey downloads the official 64-bit build at install time and puts it on your PATH. The package itself carries no binaries.

Install a specific version:

```powershell
choco install cdxgen --version=12.8.2
```

## What is cdxgen?

Creates CycloneDX Bill of Materials (BOM) for your projects from source and container images. Supports many languages and package managers. Integrate in your CI/CD pipeline with automatic submission to Dependency Track server.

## Usage

The package installs the `cdxgen` command. Open a new terminal after installing so the PATH change takes effect, then see the [cdxgen documentation](https://cdxgen.github.io/cdxgen/) for the available options.

## Upgrade

```powershell
choco upgrade cdxgen
```

## Uninstall

```powershell
choco uninstall cdxgen
```

## Links

| Resource | URL |
| --- | --- |
| Website | https://cdxgen.github.io/cdxgen/ |
| Source code | https://github.com/cdxgen/cdxgen |
| Releases | https://github.com/cdxgen/cdxgen/releases |
| Issues | https://github.com/cdxgen/cdxgen/issues |
| Chocolatey page | https://community.chocolatey.org/packages/cdxgen |
| Package source | https://github.com/MKAbuMattar/chocolatey-packages/tree/main/automatic/cdxgen |

## License

This Chocolatey package is maintained by [@MKAbuMattar](https://github.com/MKAbuMattar) and licensed under the [MIT License](https://github.com/MKAbuMattar/chocolatey-packages/blob/main/LICENSE).

cdxgen itself is distributed under its own [license](https://github.com/cdxgen/cdxgen/blob/master/LICENSE).
