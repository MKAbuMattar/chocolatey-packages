$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/herdrdev/herdr/releases/download/v0.9.3/herdr-windows-x86_64.zip'
  checksum64     = 'c75b1fa49f7a3ba4b8b11789912a6147e4214a3b6fd3556d0f80076c8887d795'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
