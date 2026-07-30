$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.50.6/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = '36d28d19c6e0e54931a1a919f7703c388ae9c9d33396e09441cb4b8315a84e0a'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
