$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/terralist/terralist/releases/download/v0.11.3/terralist_windows_amd64.zip'
  checksum64     = '19ca56f28e7f60e32f555e2e9210174e9e95caaa583521497bd2c774aa033c59'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
