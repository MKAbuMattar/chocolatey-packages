$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/n0-computer/iroh/releases/download/v1.4.0/iroh-dns-server-v1.4.0-x86_64-pc-windows-msvc.zip'
  checksum64     = '7646034c62527dc216d1ec69b356bda127e44f1b2c3c144d3656a25a71f7bed7'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
