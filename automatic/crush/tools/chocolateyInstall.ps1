$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/charmbracelet/crush/releases/download/v0.99.0/crush_0.99.0_Windows_x86_64.zip'
  checksum64     = '46b24720b6cfe29d6fa97491eb8262184ca05624d805ccc360974ecc3d728c88'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
