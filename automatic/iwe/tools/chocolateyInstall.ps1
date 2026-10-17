$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/iwe-org/iwe/releases/download/iwe-v0.28.0/iwe-v0.28.0-x86_64-pc-windows-msvc.zip'
  checksum64     = '8f5842f04e98d53bec5e776e08e57dea4ca4b9a5dd482378f7b8427eac31f73b'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
