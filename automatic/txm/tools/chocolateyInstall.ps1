$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/thatmagicalcat/txm/releases/download/v0.1.5/txm-0.1.5-x86_64-windows.zip'
  checksum64     = '9351615d8d483a760385311ebd782e625c588f4c437498dee995c2a27ff02381'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
