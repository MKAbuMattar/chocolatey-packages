$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/rtk-ai/rtk/releases/download/v0.52.0/rtk-x86_64-pc-windows-msvc.zip'
  checksum64     = '76055258f531830e7ae25c9152c2428ed9932533df4ad07ad74e684e25e1b125'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
