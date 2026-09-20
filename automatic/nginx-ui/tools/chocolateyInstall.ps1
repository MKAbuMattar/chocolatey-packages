$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/0xJacky/nginx-ui/releases/download/v2.6.2/nginx-ui-windows-64.zip'
  checksum64     = 'cc41f25d7f9294a9b1d99accaf2fdb5d2e64a1e694ddd76e4e468a3b3227680a'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
