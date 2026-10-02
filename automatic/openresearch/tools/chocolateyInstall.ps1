$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/alphaXiv/OpenResearch/releases/download/v0.2.15/openresearch-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = 'cfa9356f15d85d8059c22b3e512adc8bcadc535eb4b9ad978c99dc49e1603e85'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
