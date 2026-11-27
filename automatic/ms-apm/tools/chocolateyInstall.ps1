$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/microsoft/apm/releases/download/v0.39.1/apm-windows-x86_64.zip'
  checksum64     = 'b1376a71f1e31499feaf2ce850fb0b511d7fcea20842204588d742b9020c460f'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
