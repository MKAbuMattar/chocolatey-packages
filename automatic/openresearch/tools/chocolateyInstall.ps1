$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/alphaXiv/OpenResearch/releases/download/v0.2.18/openresearch-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = '235d1641b42fd3b2ad047a0e043f95ab602f5f8ab2df6cd664abbb017324c302'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
