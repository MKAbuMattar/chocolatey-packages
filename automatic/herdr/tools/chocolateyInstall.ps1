$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/herdrdev/herdr/releases/download/v0.9.1/herdr-windows-x86_64.zip'
  checksum64     = '04ce380cac5af27bfcf75d0951ac49b7afe4c984aee8852985806d4f71f93a6e'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
