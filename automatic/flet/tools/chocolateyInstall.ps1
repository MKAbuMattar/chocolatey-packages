$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/flet-dev/flet/releases/download/v1.1.0/flet-windows.zip'
  checksum64     = 'cfb24f898f9b69a6a0bf4b3016facb03bbe249caba399aacd68c0422a99f4a95'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
