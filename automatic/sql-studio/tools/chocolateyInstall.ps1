$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/frectonz/sql-studio/releases/download/0.1.53/sql-studio-x86_64-pc-windows-msvc.zip'
  checksum64     = '3221efa945e41d11a745aa6e3652b0052a119cffc3f52a9b2b60b13d366b161e'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
