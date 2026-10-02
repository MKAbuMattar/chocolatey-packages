$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.55.4/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = 'eba7adb86ff559c8b2d0c7aa3f50971cc1a87977db33d40627838e5e435dcd9f'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
