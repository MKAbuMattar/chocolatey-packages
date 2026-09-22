$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/earendil-works/pi/releases/download/v0.87.1/pi-windows-x64.zip'
  checksum64     = 'aab2ba67baf8ff97a52d05b62d88e9e65a840c6ea8fa1029a28d62d210d4e5fc'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
