$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/JustVugg/colibri/releases/download/v1.10.2/colibri-v1.10.2-windows-x86_64.zip'
  checksum64     = '8dcad7b5806b9c54e85f04e54a65f280b43583e5eca0c59512ae23b43d19e051'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
