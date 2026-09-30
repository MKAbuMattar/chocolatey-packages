$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/alphaXiv/OpenResearch/releases/download/v0.2.14/openresearch-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = '6aee5e25a2ecb3f24171a339498265cc740d809a51f7c5c2a22587f05ccaf889'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
