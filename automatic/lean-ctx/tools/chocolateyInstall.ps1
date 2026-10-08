$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/yvgude/lean-ctx/releases/download/v3.11.0/lean-ctx-x86_64-pc-windows-msvc.zip'
  checksum64     = '883a8ae902bf7bbc0887a6bfd74ff11ea41ef03cf67236a4f17a9a28d2f95d5b'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
