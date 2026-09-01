$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/PostHog/posthog/releases/download/posthog-cli/v0.16.2/posthog-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = '050d48c12139c846165155c711546a108946c096c1fa4953e9c474318c768fe1'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
