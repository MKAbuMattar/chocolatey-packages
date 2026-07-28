# Contributing

Thanks for helping out with these Chocolatey packages.

## How to contribute

1. Fork and clone the repository:

   ```bash
   git clone https://github.com/your-username/chocolatey-packages.git
   ```

2. Create a branch:

   ```bash
   git checkout -b my-change
   ```

3. Make your change. See the [README](../README.md) for the repository layout, how the
   automatic updater works and how to add a new package.

4. Test it on Windows before opening the pull request:

   ```powershell
   choco install chocolatey-au --yes
   .\update_all.ps1 -Name <package> -Force
   ```

   This re-runs the updater and packs the package without pushing anything. The same
   check runs on every pull request.

5. Commit, push and open a pull request describing what changed and why.

## Things to keep in mind

- Package versions, download URLs, checksums and release notes are maintained by the
  updater. Do not bump them by hand.
- A package's description lives in `automatic/<id>/README.md` and is copied into the
  nuspec on every update, so edit the README rather than the nuspec `<description>`.
- Keep package ids lowercase and checksums sha256. Never commit the software itself.
  Installers are downloaded at install time.
- Follow the [Chocolatey packaging documentation](https://docs.chocolatey.org/en-us/create/create-packages/).

## Reporting issues

Open an issue in [GitHub Issues](https://github.com/MKAbuMattar/chocolatey-packages/issues)
and say which package it concerns.

## Code of conduct

This project ships a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating
you agree to abide by its terms.
