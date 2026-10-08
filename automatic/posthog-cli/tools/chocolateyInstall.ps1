$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/PostHog/posthog/releases/download/posthog-cli/v0.18.10/posthog-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = '14018e60a9c4bcd6feebe6e0e01017769bea0cb802e597c8879fdf8a5503472f'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
