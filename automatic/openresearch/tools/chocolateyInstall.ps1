$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/alphaXiv/OpenResearch/releases/download/v0.2.21/openresearch-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = 'c64e36b2b8c08cc27f4d09506ad5883fd12b33eec3f4339434b82d339b19d0f6'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
