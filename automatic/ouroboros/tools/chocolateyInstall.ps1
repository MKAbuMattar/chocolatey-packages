$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.54.0/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = '4e0259c6d3bc5c1194a56e6b73df4d8748f79435860bb214da96858f2f62d4a3'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
