$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.65.5/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = '15e0f50409b042dfc127c899dbc8f25dbc729a10fd53c5509b9c591cd3f0cf58'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
