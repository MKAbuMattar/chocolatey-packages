# Servo Chocolatey Package

## Install

```powershell
choco install servoshell
```

Chocolatey downloads the official Windows build from the [servo/servo](https://github.com/servo/servo/releases) releases and puts it on your PATH.
Only the main executable is put on your PATH. The bundled libraries stay in the package folder.

The package id is `servoshell`, after the executable Servo ships, because an unrelated
"Servo Tech Demo" package already holds the `servo` id on the community repository.

## What is Servo?

Servo aims to empower developers with a lightweight, high-performance alternative for embedding web technologies in applications.

Upstream describes it with these topics: browser, rust, servo, web, webbrowser, webengine, webplatform.

## Upgrade

```powershell
choco upgrade servoshell
```

## Uninstall

```powershell
choco uninstall servoshell
```

## Links

| Resource | URL |
| --- | --- |
| Website | https://servo.org |
| Source code | https://github.com/servo/servo |
| Releases | https://github.com/servo/servo/releases |
| Chocolatey page | https://community.chocolatey.org/packages/servoshell |
| Package source | https://github.com/MKAbuMattar/chocolatey-packages/tree/main/automatic/servoshell |

## License

This Chocolatey package is maintained by [@MKAbuMattar](https://github.com/MKAbuMattar) and licensed under the [MIT License](https://github.com/MKAbuMattar/chocolatey-packages/blob/main/LICENSE).

Servo itself is distributed under its own [license](https://github.com/servo/servo/blob/main/LICENSE).
