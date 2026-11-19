$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/PostHog/posthog/releases/download/posthog-cli/v0.20.1/posthog-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = 'daf0acb8d760c73c273768b4c450120bf8c7a6316cbb27b5d3ba9e2311fade24'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
