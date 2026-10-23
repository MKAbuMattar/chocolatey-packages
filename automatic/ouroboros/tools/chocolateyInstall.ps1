$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.59.8/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = 'ca570e69d0399d6c47a0056e581b62ba4e7e8d7d7b372c78b2ab9a61f44bca0d'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
