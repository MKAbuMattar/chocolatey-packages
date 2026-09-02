$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/n0-computer/iroh/releases/download/v1.1.0/iroh-dns-server-v1.1.0-x86_64-pc-windows-msvc.zip'
  checksum64     = '9452fecf363883679992d870bd80a0abfa9819baa471d7bf4475cbd9a2b102d8'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
