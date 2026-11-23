$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.11.23/opensre_0.1.2026.11.23_windows-x64.zip'
  checksum64     = '11dfd8097690650f2cdbc68bf64b1984c58fdb159c9c73d1bdb5057c2c2f61cb'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
