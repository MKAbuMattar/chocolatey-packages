$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/flet-dev/flet/releases/download/v1.1.2/flet-windows.zip'
  checksum64     = 'da44d5d64c51796ae3f80e9c980ac373e7f25fc5965bbaf6236b3b28bb2e4071'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
