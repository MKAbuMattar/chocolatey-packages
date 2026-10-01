$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Kilo-Org/kilocode/releases/download/v7.8.3/kilo-windows-x64.zip'
  checksum64     = '3da5be2ce6dbb21474a0cdd375c298bc33f6430f28517a7aa0133ad5c4697be6'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
