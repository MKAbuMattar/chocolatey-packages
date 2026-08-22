$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/frectonz/sql-studio/releases/download/0.1.51/sql-studio-x86_64-pc-windows-msvc.zip'
  checksum64     = '00fc1f27abb6190579078e9a04d118602bfb5afa2d847d1c9b68f3058b924974'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
