$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/iwe-org/iwe/releases/download/iwe-v0.19.1/iwe-v0.19.1-x86_64-pc-windows-msvc.zip'
  checksum64     = '462bc906edec803b23619b63ffd9d90e9c3bce6edcdea14f0133f354abbab1a1'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
