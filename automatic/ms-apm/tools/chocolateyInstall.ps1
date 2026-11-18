$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/microsoft/apm/releases/download/v0.36.1/apm-windows-x86_64.zip'
  checksum64     = '22a43fe9a0dc1dab6f9d8206da976a72445f6ca083e3c5f4ca7de88a9849d4ba'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
