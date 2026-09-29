$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/alphaXiv/OpenResearch/releases/download/v0.2.13/openresearch-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = 'c4e569ef0dd5e9d6b42f7db2bb6b0961d6868e52e0505439f89e5d329d5da7ec'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
