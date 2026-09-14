$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/yvgude/lean-ctx/releases/download/v3.10.1/lean-ctx-x86_64-pc-windows-msvc.zip'
  checksum64     = 'bf77386558fe8c3c6ab9967b322a45af593b99133bcfd430fee8400f88cef397'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
