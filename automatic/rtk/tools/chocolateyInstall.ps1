$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/rtk-ai/rtk/releases/download/v1.0.1/rtk-x86_64-pc-windows-msvc.zip'
  checksum64     = '64b4807c50b61dddf2ac1e86751dbda9117ab94ed02bf266e6584da571c39896'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
