$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/earendil-works/pi/releases/download/v1.0.4/pi-windows-x64.zip'
  checksum64     = '6bdbfb7bac252eea36a0095e4b741c9d5784d5ba99146e2d76e9246dee409b58'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
