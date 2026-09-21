$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.9.21/opensre_0.1.2026.9.21_windows-x64.zip'
  checksum64     = '3dd86269b6f19679ed64b2572d10d0f8fd0f383edecd3bb3619f31a7efdb4e69'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
