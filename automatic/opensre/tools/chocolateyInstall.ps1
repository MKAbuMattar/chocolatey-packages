$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.11.17/opensre_0.1.2026.11.17_windows-x64.zip'
  checksum64     = '3f1d8e4355f5c6068e405b093d938e1fab81d44bb7e6b67d1e13d2099fd07858'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
