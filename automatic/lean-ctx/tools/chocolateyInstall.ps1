$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/yvgude/lean-ctx/releases/download/v3.12.8/lean-ctx-x86_64-pc-windows-msvc.zip'
  checksum64     = '8a8c7094260d0f07d94361438cd5264120c7f3692d4d8dd8d81244dba082f449'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
