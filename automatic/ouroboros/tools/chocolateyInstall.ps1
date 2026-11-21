$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.64.0/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = '4edab9970e4778b89dbfe274f16d9c5e5143ffcb502584b58f179c1b1b6e77f4'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
