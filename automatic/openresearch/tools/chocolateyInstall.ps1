$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/alphaXiv/OpenResearch/releases/download/v0.2.9/openresearch-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = '372c99e54015e2d21d4cb0e3324100a7f411b72475016716de98e3ebfa274d85'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
