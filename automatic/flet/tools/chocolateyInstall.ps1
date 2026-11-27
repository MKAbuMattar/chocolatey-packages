$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/flet-dev/flet/releases/download/v1.1.4/flet-windows.zip'
  checksum64     = 'f0bfde08366ba8995b3a5048a29c7af5703bb17e0ef99ee8537be799adc62448'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
