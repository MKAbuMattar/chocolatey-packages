$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/siderolabs/omni/releases/download/v1.14.1/omnictl-windows-amd64.exe'
  checksum64     = 'c48a443e4c05c9f834dc85e7ff323d3b03e43b24b36c8ec1aa43c7156cd853a1'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'omnictl.exe'
}

Get-ChocolateyWebFile @packageArgs
