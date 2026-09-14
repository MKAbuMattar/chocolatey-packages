$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/meshery/meshery/releases/download/v1.0.70/mesheryctl_1.0.70_Windows_x86_64.zip'
  checksum64     = '51646d41ca45c366d42d0647ebb444bb035abf3ecf9670a6cf8c3c490bfdedda'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
