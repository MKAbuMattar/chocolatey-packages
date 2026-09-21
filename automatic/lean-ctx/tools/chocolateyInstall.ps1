$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/yvgude/lean-ctx/releases/download/v3.10.2/lean-ctx-x86_64-pc-windows-msvc.zip'
  checksum64     = '74cf6cddaa42650bd29c21acfcb58e7b9d89b62986e4434f9b45130e1caa68f6'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
