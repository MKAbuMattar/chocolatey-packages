$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Kilo-Org/kilocode/releases/download/v7.8.1/kilo-windows-x64.zip'
  checksum64     = '5c3944e8ac8111a1568133ccd7ee4222e7900b9805051c23736b12e115513a2b'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
