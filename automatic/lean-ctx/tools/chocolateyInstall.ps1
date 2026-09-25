$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/yvgude/lean-ctx/releases/download/v3.10.3/lean-ctx-x86_64-pc-windows-msvc.zip'
  checksum64     = 'a80e9c5c41f1e57a338dc137b76f4c8dae1b6b6dd1d0aac4d76b2dd6a48ecf7a'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
