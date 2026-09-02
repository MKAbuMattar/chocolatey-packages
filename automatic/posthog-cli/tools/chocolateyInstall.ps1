$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/PostHog/posthog/releases/download/posthog-cli/v0.18.0/posthog-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = '63cc969e23bf3b55514c3376628c4d4c66323d4c8f77aa702581ad2e16fc7141'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
