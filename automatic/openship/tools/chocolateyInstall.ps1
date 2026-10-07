$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/oblien/openship/releases/download/v0.8.2/Openship-win32-x64.zip'
  checksum64     = '64b68e379e073116b2698b6e13d80753ce029611d8bb713b060917443e323653'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
