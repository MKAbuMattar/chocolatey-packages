$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/yvgude/lean-ctx/releases/download/v3.11.3/lean-ctx-x86_64-pc-windows-msvc.zip'
  checksum64     = 'ced6b04702c9cdf287a2a57a89cb72e74e7c5155ece8e891ba3b8ed15fe6f03b'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
