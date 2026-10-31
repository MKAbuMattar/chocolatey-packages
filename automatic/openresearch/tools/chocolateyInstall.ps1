$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/alphaXiv/OpenResearch/releases/download/v0.2.23/openresearch-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = '88a09bc5bf0b12785f6f4f05e6db8df3fd653613115d69888802dadea87019f4'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
