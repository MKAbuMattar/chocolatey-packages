$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/alphaXiv/OpenResearch/releases/download/v0.2.26/openresearch-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = 'e1ecd756d30b05c73ff45cba1ac9f2f319dbfab48d1dc72567f76081113d5efd'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
