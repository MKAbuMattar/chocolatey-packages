$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/meshery/meshery/releases/download/v1.0.75/mesheryctl_1.0.75_Windows_x86_64.zip'
  checksum64     = '61017eafbf88950a4a21a6c19289d7733af2d586b78dedc79c31385662a72440'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
