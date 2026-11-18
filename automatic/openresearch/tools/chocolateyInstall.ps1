$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/alphaXiv/OpenResearch/releases/download/v0.2.28/openresearch-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = '2d3bd553aa9961533742a32d10d9a29e6e11f2d995f5506b2fefdf13617248da'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
