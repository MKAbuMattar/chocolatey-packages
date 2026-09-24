$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/PostHog/posthog/releases/download/posthog-cli/v0.18.6/posthog-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = '660495ed31a1d72fb5ec5e7e43dfc3520c8c3f85384afef09bbaf8ee7bd6d222'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
