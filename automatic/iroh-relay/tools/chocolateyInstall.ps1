$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/n0-computer/iroh/releases/download/v1.2.0/iroh-relay-v1.2.0-x86_64-pc-windows-msvc.zip'
  checksum64     = '31df0f028453a12abe4b55f9ab50580d5b00d5e5ab3596d0371c6f808e383f90'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
