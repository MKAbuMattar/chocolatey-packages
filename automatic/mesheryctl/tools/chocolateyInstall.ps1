$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/meshery/meshery/releases/download/v1.0.63/mesheryctl_1.0.63_Windows_x86_64.zip'
  checksum64     = '425435cc55308ff7098eaea4de894a56e90b577a2c36035a9f9e6d74e5937acd'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
