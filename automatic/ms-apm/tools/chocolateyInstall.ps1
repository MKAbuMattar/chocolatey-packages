$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/microsoft/apm/releases/download/v0.29.0/apm-windows-x86_64.zip'
  checksum64     = 'c8691a52d6ccc33daa8c50cf6d606faf6569a4af1191be7eaf6a97a8c8e8f496'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
