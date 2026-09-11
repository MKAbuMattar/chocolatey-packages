$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/n0-computer/iroh/releases/download/v1.2.0/iroh-dns-server-v1.2.0-x86_64-pc-windows-msvc.zip'
  checksum64     = '1b1c8391b92eeec01d248b4d87b5ecdc2bf42048603eac01c6003ac787764d23'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
