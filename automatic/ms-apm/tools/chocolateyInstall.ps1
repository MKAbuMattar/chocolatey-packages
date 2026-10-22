$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/microsoft/apm/releases/download/v0.35.0/apm-windows-x86_64.zip'
  checksum64     = '9a0a912b3ba68ac154b940e1931425c85f03edcfcc2339661d3aa32d8fa17c2f'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
