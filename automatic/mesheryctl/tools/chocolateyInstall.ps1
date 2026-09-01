$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/meshery/meshery/releases/download/v1.0.68/mesheryctl_1.0.68_Windows_x86_64.zip'
  checksum64     = 'bfcd7f3db6da1cceb83c2be7c9891fb61a15c4cdafb750a846d2d6ad315d8454'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
