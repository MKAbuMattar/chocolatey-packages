$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.57.0/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = '7178d5a85e74f8258e18bc0109c76ae3a02202a45ea79e39be01f8d2f86a9b74'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
