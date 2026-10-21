$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.10.21/opensre_0.1.2026.10.21_windows-x64.zip'
  checksum64     = '577c4bfba9b8d824cfe2dec8faced55f53ecce3809008f78cb0dee44ca705e6a'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
