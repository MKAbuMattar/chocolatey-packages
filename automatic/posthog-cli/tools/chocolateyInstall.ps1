$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/PostHog/posthog/releases/download/posthog-cli/v0.19.0/posthog-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = '0570725c3df10342b5623a80d84a4e9c6c0a3682a4612656a5f007462ec4477d'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
