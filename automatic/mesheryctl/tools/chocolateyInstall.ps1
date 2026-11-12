$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/meshery/meshery/releases/download/v1.0.76/mesheryctl_1.0.76_Windows_x86_64.zip'
  checksum64     = '6b6037c9ce593fa95c130c17f4beb2881b108581595ddede3436c119e7ee75e8'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
