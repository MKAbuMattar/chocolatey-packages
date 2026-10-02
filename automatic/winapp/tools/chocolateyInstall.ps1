$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/microsoft/winappCli/releases/download/v0.7.1/winappcli-x64.zip'
  checksum64     = 'd925d1e32cdc320b6d271f653fd2cd3c05b5d7558deb20d1b548bead77900fcf'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
