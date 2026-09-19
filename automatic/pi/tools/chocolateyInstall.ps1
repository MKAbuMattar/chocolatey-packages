$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/earendil-works/pi/releases/download/v0.86.0/pi-windows-x64.zip'
  checksum64     = 'bbb55cb641b7cf888a43a5d953faa715f12de05c703893d9f8ff5f09f495051d'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
