$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/oblien/openship/releases/download/v1.0.1/Openship-win32-x64.zip'
  checksum64     = 'e0aca56e85844a4da40040714c9fb6e7f8e085b01086ce128f03efdd5ad7b030'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
