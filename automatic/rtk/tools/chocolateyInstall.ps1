$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/rtk-ai/rtk/releases/download/v1.2.0/rtk-x86_64-pc-windows-msvc.zip'
  checksum64     = 'b291b4e53d37f84b7f1696bc20559207396fb0190f20ed3c949db1b7e1c0c378'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
