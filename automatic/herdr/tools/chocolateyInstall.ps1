$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/herdrdev/herdr/releases/download/v0.9.2/herdr-windows-x86_64.zip'
  checksum64     = 'de7529c55f3083a444f74673399ed16d1abe45ff08a43dbfea99e4d0edf47d42'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
