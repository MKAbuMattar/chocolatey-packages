$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/yvgude/lean-ctx/releases/download/v3.10.5/lean-ctx-x86_64-pc-windows-msvc.zip'
  checksum64     = '72a5ba9f6ecf2420192ef61a1f9eb83f2e482fb22e6b62d201422a2c772d320c'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
