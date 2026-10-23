$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.59.7/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = 'd6a2a5857521e6c41357c9fa3dc40e65359996a3928397a6bd3ea994d67e8f26'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
