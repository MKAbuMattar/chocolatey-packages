$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/PostHog/posthog/releases/download/posthog-cli/v0.20.0/posthog-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = '2c6408f2eaaa4ecd772c074ed490c82eb47577013f696f4acc2c7e92b336f439'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
