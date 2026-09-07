$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/PostHog/posthog/releases/download/posthog-cli/v0.18.1/posthog-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = '9ca20f24474a45ffb4bbfc606e37b1a1952e2c1a2a5e0cb153ab27aaddaf2960'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
