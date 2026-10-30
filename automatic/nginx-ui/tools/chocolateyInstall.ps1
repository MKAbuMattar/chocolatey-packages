$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/0xJacky/nginx-ui/releases/download/v2.9.3/nginx-ui-windows-64.zip'
  checksum64     = 'd568380e95005ee898914f7189a291c5d964a49b4dc319206b98354fdc61555d'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
