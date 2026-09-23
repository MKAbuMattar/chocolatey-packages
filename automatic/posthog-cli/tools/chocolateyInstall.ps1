$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/PostHog/posthog/releases/download/posthog-cli/v0.18.5/posthog-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = 'b0aa852d59c0df11a10510ebdbc24cb3b9784f4219e2e9263797dfae35af061c'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
