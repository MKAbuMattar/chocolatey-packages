$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/iwe-org/iwe/releases/download/iwe-v0.35.0/iwe-v0.35.0-x86_64-pc-windows-msvc.zip'
  checksum64     = 'e1d5cfeb424391d91b71e1d32a2be40bffeb612b82e0a80158a04d61d2d017ef'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
