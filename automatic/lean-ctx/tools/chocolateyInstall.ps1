$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/yvgude/lean-ctx/releases/download/v3.12.5/lean-ctx-x86_64-pc-windows-msvc.zip'
  checksum64     = '3c2af8c7f7a2cac4821d8a86ed8ecd6af9645d3f1573e00de2e7160dfe0824df'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
