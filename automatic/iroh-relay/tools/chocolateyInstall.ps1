$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/n0-computer/iroh/releases/download/v1.1.0/iroh-relay-v1.1.0-x86_64-pc-windows-msvc.zip'
  checksum64     = '052bd32704afcb4492a0cd8e619e1bb47c69cbe8ecaa89907c22033634b3da1c'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
