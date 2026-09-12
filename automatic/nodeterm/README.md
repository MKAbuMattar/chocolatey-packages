# NodeTerm Chocolatey Package

## Install

```powershell
choco install nodeterm
```

Chocolatey downloads the official 64-bit installer at install time and runs it silently. The package itself carries no binaries.

The download is about 137 MB, so the install takes a while on a slow connection.

Install a specific version:

```powershell
choco install nodeterm --version=<version>
```

## What is NodeTerm?

A terminal manager that lays terminals out as draggable nodes on an infinite pan and zoom
canvas, rather than as tabs or panes. The terminals are tmux backed, so sessions survive,
and several coding agents can run in parallel with each one visible as its own node.

Upstream also publishes a browser Server Edition and builds for macOS and Linux. This
package installs the Windows desktop application.

## Upgrade

```powershell
choco upgrade nodeterm
```

## Uninstall

```powershell
choco uninstall nodeterm
```

## Links

| Resource | URL |
| --- | --- |
| Website | https://nodeterm.dev |
| Source code | https://github.com/eneskirca/nodeterm |
| Releases | https://github.com/eneskirca/nodeterm/releases |
| Issues | https://github.com/eneskirca/nodeterm/issues |
| Chocolatey page | https://community.chocolatey.org/packages/nodeterm |
| Package source | https://github.com/MKAbuMattar/chocolatey-packages/tree/main/automatic/nodeterm |

## License

This Chocolatey package is maintained by [@MKAbuMattar](https://github.com/MKAbuMattar) and licensed under the [MIT License](https://github.com/MKAbuMattar/chocolatey-packages/blob/main/LICENSE).

NodeTerm itself is distributed under its own [license](https://github.com/eneskirca/nodeterm/blob/main/LICENSE).
