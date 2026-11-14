$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.11.14/opensre_0.1.2026.11.14_windows-x64.zip'
  checksum64     = '5b2d3fd0e0db413d6dc5673414adf1a0c3b3a0d7ec52742fca9e936db14a82b4'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
