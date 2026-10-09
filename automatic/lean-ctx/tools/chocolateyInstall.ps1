$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/yvgude/lean-ctx/releases/download/v3.11.1/lean-ctx-x86_64-pc-windows-msvc.zip'
  checksum64     = '713f3ee287b64e7befdad37f5eb5d1f609a08ad0f42626023dcfba840003ea5f'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
