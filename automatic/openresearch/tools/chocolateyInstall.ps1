$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/alphaXiv/OpenResearch/releases/download/v0.2.29/openresearch-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = '5e76089620f57f01e5d5d5f8af00648cf6a8088b5d2ce8b6132aa9f67d3b3556'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
