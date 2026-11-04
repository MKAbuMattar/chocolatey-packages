$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/yvgude/lean-ctx/releases/download/v3.12.1/lean-ctx-x86_64-pc-windows-msvc.zip'
  checksum64     = 'a9079bccf5b047fc7d95b917e729a0689f146f3d6185ce12b5a43dd06e498867'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
