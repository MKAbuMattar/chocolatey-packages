$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/alphaXiv/OpenResearch/releases/download/v0.2.10/openresearch-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = 'd85247f8b1d17a1bf0fc649ae8320f8d55388ecb376bb29696d4a70791d16fad'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
