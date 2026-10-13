$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/herdrdev/herdr/releases/download/v0.9.4/herdr-windows-x86_64.zip'
  checksum64     = '0e4ccb5cd7b6ca464a69637cda66d3c93334ebc057c50c5878b8e89e1a20afee'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
