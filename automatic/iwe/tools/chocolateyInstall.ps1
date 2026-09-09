$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/iwe-org/iwe/releases/download/iwe-v0.24.0/iwe-v0.24.0-x86_64-pc-windows-msvc.zip'
  checksum64     = '19b4c4a6e1be73174dccdd2a206784e095486f9804c667fc0bdc46e54ea88ba7'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
