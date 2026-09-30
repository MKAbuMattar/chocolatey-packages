$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/earendil-works/pi/releases/download/v0.99.2/pi-windows-x64.zip'
  checksum64     = '6f0bd9869d5cf45d5adde79ebedb54357e0c26cb4c64bd4a256f7ae548995f22'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
