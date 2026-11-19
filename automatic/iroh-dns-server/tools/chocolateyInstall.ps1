$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/n0-computer/iroh/releases/download/v1.5.0/iroh-dns-server-v1.5.0-x86_64-pc-windows-msvc.zip'
  checksum64     = 'c832efb23feb40d5000e913b56021b5a52f9853f86f8fee096addf93eb537f97'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
