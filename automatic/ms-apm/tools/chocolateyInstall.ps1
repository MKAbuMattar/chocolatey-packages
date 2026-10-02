$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/microsoft/apm/releases/download/v0.33.0/apm-windows-x86_64.zip'
  checksum64     = 'ab0fba071ef9c04a72fc2c13314f71ebd10fdb599ba3c985a09f5ba38095d0a1'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
