$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/PostHog/posthog/releases/download/posthog-cli/v0.18.11/posthog-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = '05c59e8292c32ded33c9b968d24220c0ef35f1ccdf94862895eb0e4f3219a372'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
