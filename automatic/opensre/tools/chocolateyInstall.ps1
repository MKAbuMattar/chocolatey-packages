$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.11.25/opensre_0.1.2026.11.25_windows-x64.zip'
  checksum64     = '6dae73f48a5b63d2e59acd4aabf2f3ed28f28279a56ba123bafb112fd4589a97'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
