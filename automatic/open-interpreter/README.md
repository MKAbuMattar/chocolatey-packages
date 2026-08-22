# Open Interpreter Chocolatey Package

## Install

```powershell
choco install open-interpreter
```

Chocolatey downloads the official 64-bit archive at install time, unpacks it into the package tools directory and shims the executables it contains. The package itself carries no binaries.

Install a specific version:

```powershell
choco install open-interpreter --version=0.0.34
```

## What is Open Interpreter?

A coding agent for open models like Kimi K3.

## Usage

The package installs the `interpreter` command. Open a new terminal after installing so the PATH change takes effect, then see the [Open Interpreter documentation](http://openinterpreter.com/) for the available options.

## Upgrade

```powershell
choco upgrade open-interpreter
```

## Uninstall

```powershell
choco uninstall open-interpreter
```

## Links

| Resource | URL |
| --- | --- |
| Website | http://openinterpreter.com/ |
| Source code | https://github.com/openinterpreter/openinterpreter |
| Releases | https://github.com/openinterpreter/openinterpreter/releases |
| Issues | https://github.com/openinterpreter/openinterpreter/issues |
| Chocolatey page | https://community.chocolatey.org/packages/open-interpreter |
| Package source | https://github.com/MKAbuMattar/chocolatey-packages/tree/main/automatic/open-interpreter |

## License

This Chocolatey package is maintained by [@MKAbuMattar](https://github.com/MKAbuMattar) and licensed under the [MIT License](https://github.com/MKAbuMattar/chocolatey-packages/blob/main/LICENSE).

Open Interpreter itself is distributed under its own [license](https://github.com/openinterpreter/openinterpreter/blob/main/LICENSE).
