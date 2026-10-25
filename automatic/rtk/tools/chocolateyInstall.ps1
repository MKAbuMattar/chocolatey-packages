$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/rtk-ai/rtk/releases/download/v1.1.0/rtk-x86_64-pc-windows-msvc.zip'
  checksum64     = 'c9a8f7a8bad471e64a343314168f38d2399a06fa327cdf5772fb0e645d99ea6f'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
