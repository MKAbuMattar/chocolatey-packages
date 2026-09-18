$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.9.18/opensre_0.1.2026.9.18_windows-x64.zip'
  checksum64     = '7e939fe1daa34e11a0253f3d618ebb1ec35de8fefbc4e64e80fead9de0e5688c'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
