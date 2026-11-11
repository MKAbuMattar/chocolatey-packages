$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/PostHog/posthog/releases/download/posthog-cli/v0.19.3/posthog-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = '5fc57ea6a5bc381e60bac0baac966c5dbf86b74a2fd2b0cd44d534888a08ea01'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
