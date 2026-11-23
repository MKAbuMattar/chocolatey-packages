$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/microsoft/apm/releases/download/v0.38.1/apm-windows-x86_64.zip'
  checksum64     = '0e96d0a17bd6c1d550b5bcad1aa845ddcc6d2e0564c3ef42cf96485396720853'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
