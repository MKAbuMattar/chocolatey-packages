$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/charmbracelet/crush/releases/download/v0.104.0/crush_0.104.0_Windows_x86_64.zip'
  checksum64     = '2a306e2b0c7ab24ef1a59efc9b53f79e95d0a97a97c0e5244ac164eedc620e9e'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
