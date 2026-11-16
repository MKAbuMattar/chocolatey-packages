$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/meshery/meshery/releases/download/v1.0.80/mesheryctl_1.0.80_Windows_x86_64.zip'
  checksum64     = '1f69147d1cb81a44cbde9ba0eaa051bf1179dac91a1310a3b917e1408a270763'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
