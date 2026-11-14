$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/cdxgen/cdxgen/releases/download/v13.8.0/cdxgen-windows-amd64.exe'
  checksum64     = '050d2d8368f1d3ff005865515d3c56b06495017dd6745f4f8095128d64809bb4'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'cdxgen.exe'
}

Get-ChocolateyWebFile @packageArgs
