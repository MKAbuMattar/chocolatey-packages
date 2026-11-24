$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.65.7/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = '446433165392db6818f0b0d8ae9761d49e939703d3b7b5ac543e77c1c60816eb'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
