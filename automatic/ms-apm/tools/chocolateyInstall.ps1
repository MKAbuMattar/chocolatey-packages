$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/microsoft/apm/releases/download/v0.32.0/apm-windows-x86_64.zip'
  checksum64     = '8b4be7c8bac40d1847dbf34bc702ed4006a4654a7abed8bcaa276fb2c40a3dea'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
