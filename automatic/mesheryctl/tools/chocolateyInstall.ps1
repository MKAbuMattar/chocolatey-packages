$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/meshery/meshery/releases/download/v1.0.82/mesheryctl_1.0.82_Windows_x86_64.zip'
  checksum64     = 'd8ebc7c3d5d6ab2b09a78d98cab643ccd7204aa44cb6cc230d8e952be93ec886'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
