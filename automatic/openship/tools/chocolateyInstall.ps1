$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/oblien/openship/releases/download/v0.7.2/Openship-win32-x64.zip'
  checksum64     = 'aa4b2ac994dbaff408ed41412ef9876814d8a2c2ff2f27a00fd6a88388059645'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
