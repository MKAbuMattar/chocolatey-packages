$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/iwe-org/iwe/releases/download/iwe-v0.30.0/iwe-v0.30.0-x86_64-pc-windows-msvc.zip'
  checksum64     = 'a15447702b3c3c5a60b4a1be8751aaf1b3e3e26f2821095f1664ac24293cb8f7'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
