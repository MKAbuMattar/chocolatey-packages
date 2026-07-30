$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/JustVugg/colibri/releases/download/v1.3.0/colibri-v1.3.0-windows-x86_64.zip'
  checksum64     = '7232cb6b647a1e5e53b282a544929f6f533d75c9e27bbe30232b6991af1c3d23'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
