$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/charmbracelet/crush/releases/download/v0.96.0/crush_0.96.0_Windows_x86_64.zip'
  checksum64     = '2ed6b2a2db41b3f28fa0c9d4d3e38b90594e1da2bd6a8cdf82de5853eb445cad'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
