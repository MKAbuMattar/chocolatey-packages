$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/flet-dev/flet/releases/download/v1.0.3/flet-windows.zip'
  checksum64     = 'b92a6905b948b9a565e2163d8a3c878cd0499a7997bc0ef37b7c4cac9eae6bff'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
