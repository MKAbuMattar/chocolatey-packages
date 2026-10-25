$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.59.9/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = '4f3dd6540d90162e9f6c3159c0ab483be1bca0fcb33c12a7fdb0dccd519d60d4'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
