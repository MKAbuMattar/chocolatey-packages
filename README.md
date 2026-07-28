# Chocolatey Packages

<div align="center">
  <a href="https://github.com/MKAbuMattar/chocolatey-packages/actions/workflows/update.yaml">
    <img src="https://github.com/MKAbuMattar/chocolatey-packages/actions/workflows/update.yaml/badge.svg" alt="Update and publish packages"/>
  </a>
  <a href="https://github.com/MKAbuMattar/chocolatey-packages/actions/workflows/test.yaml">
    <img src="https://github.com/MKAbuMattar/chocolatey-packages/actions/workflows/test.yaml/badge.svg" alt="Test packages"/>
  </a>
  <a href="LICENSE">
    <img src="https://img.shields.io/github/license/MKAbuMattar/chocolatey-packages.svg" alt="License"/>
  </a>
</div>

Source for the [Chocolatey](https://chocolatey.org) packages maintained by
[@MKAbuMattar](https://github.com/MKAbuMattar). Every package here is an
[automatic package](https://docs.chocolatey.org/en-us/create/automatic-packages/). A
scheduled workflow checks upstream for a new version, updates the package, packs it,
pushes it to the Chocolatey Community Repository and creates a GitHub release, one package
at a time. Nobody has to run anything by hand.

## Packages

| Package | Version | Downloads | Upstream |
| --- | --- | --- | --- |
| [lmstudio](automatic/lmstudio) | [![lmstudio](https://img.shields.io/chocolatey/v/lmstudio?color=blue&label=chocolatey&logo=chocolatey)](https://community.chocolatey.org/packages/lmstudio) | ![downloads](https://img.shields.io/chocolatey/dt/lmstudio?color=blue&label=%20) | [lmstudio.ai](https://lmstudio.ai/) |
| [pixi](automatic/pixi) | [![pixi](https://img.shields.io/chocolatey/v/pixi?color=blue&label=chocolatey&logo=chocolatey)](https://community.chocolatey.org/packages/pixi) | ![downloads](https://img.shields.io/chocolatey/dt/pixi?color=blue&label=%20) | [prefix-dev/pixi](https://github.com/prefix-dev/pixi) |
| [t3-code](automatic/t3-code) | [![t3-code](https://img.shields.io/chocolatey/v/t3-code?color=blue&label=chocolatey&logo=chocolatey)](https://community.chocolatey.org/packages/t3-code) | ![downloads](https://img.shields.io/chocolatey/dt/t3-code?color=blue&label=%20) | [pingdotgg/t3code](https://github.com/pingdotgg/t3code) |
| [witsy](automatic/witsy) | [![witsy](https://img.shields.io/chocolatey/v/witsy?color=blue&label=chocolatey&logo=chocolatey)](https://community.chocolatey.org/packages/witsy) | ![downloads](https://img.shields.io/chocolatey/dt/witsy?color=blue&label=%20) | [Kochava-Studios/witsy](https://github.com/Kochava-Studios/witsy) |

```powershell
choco install lmstudio pixi t3-code witsy
```

## Layout

```
automatic/<id>/
  <id>.nuspec               package metadata (version is maintained by the updater)
  update.ps1                how to find the latest version, URL and what to replace
  tools/chocolateyInstall.ps1
  README.md                 package description, synced into the nuspec on every update
icons/                      package icons, served over jsDelivr instead of hotlinked
update_all.ps1              the updater entry point used by CI and locally
```

Folder name, nuspec file name and package id must match, because that is how
[Chocolatey AU](https://github.com/chocolatey-community/chocolatey-au) finds packages.

## How the automation works

`update.yaml` runs hourly on a Windows runner:

1. `update_all.ps1` calls the `update.ps1` of every package in `automatic/`.
2. Each `update.ps1` reports the latest upstream version and download URL.
3. AU skips the package when the version is unchanged or already on the community feed.
4. Otherwise it downloads the installer, computes the SHA256 checksum, rewrites the
   nuspec version, install script URL/checksum and release notes, then runs `choco pack`.
5. The new `.nupkg` is pushed to the community feed, the changed files are committed back
   here (one commit per package) and a GitHub release is created with the `.nupkg` attached.
6. The run report is published as the workflow summary.

`test.yaml` runs on every pull request and does the same thing with `-Force`, which
rebuilds every package without pushing anything. A dead download URL, a broken
`update.ps1` or an invalid nuspec fails the PR.

### Secrets

| Secret | Used for |
| --- | --- |
| `CHOCO_API_KEY` | pushing packages to the Chocolatey Community Repository |
| `GITHUB_TOKEN` | commits, GitHub releases, GitHub API rate limit (provided automatically) |

Only `CHOCO_API_KEY` has to be set, under **Settings → Secrets and variables → Actions**.
Workflow permissions must allow pushing: **Settings → Actions → General → Workflow
permissions → Read and write**.

## Running it locally

Needs Windows, PowerShell 5+ and Chocolatey.

```powershell
choco install chocolatey-au --yes
copy update_vars_default.ps1 update_vars.ps1   # then fill in the keys
.\update_all.ps1                # update everything that has a new version
.\update_all.ps1 -Name pixi     # only one package
.\update_all.ps1 -Force         # rebuild everything, push nothing
```

Publish a single package by hand from its folder:

```powershell
cd automatic/pixi
.\update.ps1
choco push pixi.<version>.nupkg --source https://push.chocolatey.org/
```

## Adding a package

1. `mkdir automatic/<id>` with `<id>.nuspec`, `tools/chocolateyInstall.ps1`, `README.md`.
2. Add the icon as `icons/<id>.png` (128px or larger) and point `iconUrl` at
   `https://cdn.jsdelivr.net/gh/MKAbuMattar/chocolatey-packages@main/icons/<id>.png`.
3. Copy the closest existing `update.ps1` and adjust the upstream lookup.
4. Test with `.\update_all.ps1 -Name <id> -Force`, then open a pull request.

Package requirements follow the
[Chocolatey packaging documentation](https://docs.chocolatey.org/en-us/create/create-packages/):
lowercase id, sha256 checksums, no software redistributed inside the package.

## License

[MIT](LICENSE) for the packaging code in this repository. The packaged software keeps its
own license, linked from each package's `licenseUrl`.
