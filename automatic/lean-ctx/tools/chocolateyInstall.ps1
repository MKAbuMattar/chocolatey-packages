$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/yvgude/lean-ctx/releases/download/v3.12.3/lean-ctx-x86_64-pc-windows-msvc.zip'
  checksum64     = 'af1321754bd04c6e84cf9fc406d8f87f9df75463f52673448b3e70a6637ca5ed'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
