$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/0xJacky/nginx-ui/releases/download/v3.0.1/nginx-ui-windows-64.zip'
  checksum64     = 'a4a3848137fe094c64428bc080908c086b5440ff5eaae03b5c498ce0d7918a2d'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
