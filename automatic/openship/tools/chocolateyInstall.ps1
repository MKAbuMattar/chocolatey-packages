$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/oblien/openship/releases/download/v0.8.1/Openship-win32-x64.zip'
  checksum64     = 'fd50ad400dda96a911cfcf2cf4b44d2b3b1f67a76ffd98d61188e8978b31accf'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
