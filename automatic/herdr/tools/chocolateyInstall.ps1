$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/herdrdev/herdr/releases/download/v0.9.0/herdr-windows-x86_64.zip'
  checksum64     = 'b4508c445de1c1a68c760a01735da2aba2fa214b2aafd4b07f732e49b2a64b11'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
