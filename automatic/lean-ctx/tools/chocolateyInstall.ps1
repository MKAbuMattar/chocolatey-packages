$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/yvgude/lean-ctx/releases/download/v3.12.6/lean-ctx-x86_64-pc-windows-msvc.zip'
  checksum64     = '275d64054db9a765cbcbf3ee63be4b879ba9e7530e93d7b3e974b852199bd673'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
