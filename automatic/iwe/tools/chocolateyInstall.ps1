$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/iwe-org/iwe/releases/download/iwe-v0.23.1/iwe-v0.23.1-x86_64-pc-windows-msvc.zip'
  checksum64     = 'd8e4eaefb5a7dad5bde4eccb3662851406f44d5ee887541790639be88391fdbb'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
