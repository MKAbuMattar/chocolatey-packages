$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/frectonz/sql-studio/releases/download/0.1.54/sql-studio-x86_64-pc-windows-msvc.zip'
  checksum64     = '2a1439affe8c5ea77353b6de6f155aa7cff6bc59f84f367e5a4c9e2a70df1121'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
