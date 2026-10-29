$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/terralist/terralist/releases/download/v0.11.1/terralist_windows_amd64.zip'
  checksum64     = '05d7bf2f3559bfaf35030565797dc6c1a7261e3ea0070c5fb121eaa1c3fe9ae6'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
