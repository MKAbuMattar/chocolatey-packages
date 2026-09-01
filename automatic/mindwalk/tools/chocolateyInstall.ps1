$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/cosmtrek/mindwalk/releases/download/v0.5.0/mindwalk_windows_amd64.zip'
  checksum64     = 'd47f7393411074e9ebd27c6e4c75e6f8677311b09e6d9dc315952e369072051f'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
