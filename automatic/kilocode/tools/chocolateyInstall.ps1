$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Kilo-Org/kilocode/releases/download/v7.8.18/kilo-windows-x64.zip'
  checksum64     = '4d13c566a3e7d91ceb6986ea037a4eee6aa145918a75b38f8208034c07e74780'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
