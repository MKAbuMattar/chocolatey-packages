$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/PostHog/posthog/releases/download/posthog-cli/v0.9.2/posthog-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = 'dc3c4d8679109162e971dd617de0c6e909e5393cb8698352045346bc18baf919'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
