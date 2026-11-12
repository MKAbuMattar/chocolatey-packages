$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/oblien/openship/releases/download/v0.9.12/Openship-win32-x64.zip'
  checksum64     = 'd31c47e9ff9ebf0ff5520c4169a77cdba06172a4821f2c417fcc7fccb3b8dc04'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
