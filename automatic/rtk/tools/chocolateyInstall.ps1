$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/rtk-ai/rtk/releases/download/v1.0.0/rtk-x86_64-pc-windows-msvc.zip'
  checksum64     = '011bffd00d3b9142987f77f9ec2c4db018d833ea9b2a175167068c2a74b2599e'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
