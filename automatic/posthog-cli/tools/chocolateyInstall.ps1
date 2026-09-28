$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/PostHog/posthog/releases/download/posthog-cli/v0.18.9/posthog-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = 'fec1624f8a8d232ae314a9391e266884e8cacb238719262e652696a1f96708b2'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
