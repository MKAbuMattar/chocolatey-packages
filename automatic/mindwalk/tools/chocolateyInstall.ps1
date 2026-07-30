$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/cosmtrek/mindwalk/releases/download/v0.3.0/mindwalk_windows_amd64.zip'
  checksum64     = '7f71f2d4a61213fc3d46dcdab6152c9389c601a08e651df5ab5ee77bf56f75ad'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
