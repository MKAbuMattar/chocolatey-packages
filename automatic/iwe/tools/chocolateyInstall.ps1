$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/iwe-org/iwe/releases/download/iwe-v0.31.0/iwe-v0.31.0-x86_64-pc-windows-msvc.zip'
  checksum64     = '583c860922cb9482cfb55f6cba4a1a0bd5e23b859cc4499bf191bf7394605bc1'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
