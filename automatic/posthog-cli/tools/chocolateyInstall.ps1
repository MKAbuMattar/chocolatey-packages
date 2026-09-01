$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/PostHog/posthog/releases/download/posthog-cli/v0.16.1/posthog-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = 'dd64d601d3d10fcad43c97c157f62ffbdfe06f68ab74473404473d2af1e196c5'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
