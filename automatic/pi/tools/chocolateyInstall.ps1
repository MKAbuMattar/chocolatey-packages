$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/earendil-works/pi/releases/download/v1.6.1/pi-windows-x64.zip'
  checksum64     = 'dbb007c8c50782de1642382fed777c60252aab080f36eef7823324c574c1f3e4'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
