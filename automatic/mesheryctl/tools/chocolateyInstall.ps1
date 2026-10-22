$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/meshery/meshery/releases/download/v1.0.74/mesheryctl_1.0.74_Windows_x86_64.zip'
  checksum64     = 'cb7769e28383c1d8d00a8c312855928ee3279790b1bd8373e6e0be5390f027a7'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
