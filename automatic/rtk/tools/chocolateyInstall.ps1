$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/rtk-ai/rtk/releases/download/v0.51.0/rtk-x86_64-pc-windows-msvc.zip'
  checksum64     = '1623e9b45d28b15122d69e7314776e1123a804224885ce07e7182fb40080f05c'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
