$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/meshery/meshery/releases/download/v1.0.71/mesheryctl_1.0.71_Windows_x86_64.zip'
  checksum64     = 'fc0d0eea4f69e6c430b00b5da7eabf661f81d28b1550d5cb12aa12da5994e01a'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
