$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.60.0/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = '7058bc72fe33777ab3576f44c4496ebaab83eb9d0e03f8d109080aac6c553b01'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
