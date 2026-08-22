$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/flet-dev/flet/releases/download/v0.86.5/flet-windows.zip'
  checksum64     = 'ded43763d47debd4474c6580ecbafdd745e7eb916d71d96e617fe655edfb37ac'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
