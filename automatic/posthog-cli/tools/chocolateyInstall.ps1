$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/PostHog/posthog/releases/download/posthog-cli/v0.18.3/posthog-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = 'c2027f1d673a937c6fcead97536a5b2e4c4fd9cda7e1233be31f07d63a4c1599'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
