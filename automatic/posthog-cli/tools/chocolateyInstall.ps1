$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/PostHog/posthog/releases/download/posthog-cli/v0.18.7/posthog-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = '7c9300578d7e43473135c8f8e5e2860c0838e99cc8acd85b17026ab07e9fcca1'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
