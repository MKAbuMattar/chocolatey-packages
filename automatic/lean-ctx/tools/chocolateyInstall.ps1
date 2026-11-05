$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/yvgude/lean-ctx/releases/download/v3.12.2/lean-ctx-x86_64-pc-windows-msvc.zip'
  checksum64     = '2152a6de384ad302a28fbd478d01f14d00e51dbfeb920a0f5d46b102561a5f73'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
