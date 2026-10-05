$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.10.5/opensre_0.1.2026.10.5_windows-x64.zip'
  checksum64     = 'cf6ac5913210cfc0413dd2bd5a6b2799d0e61371a6449ed0a77e44b75b3d8488'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
