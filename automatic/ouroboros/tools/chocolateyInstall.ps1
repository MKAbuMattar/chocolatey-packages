$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.55.1/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = 'bf72ab5e8babe4ddf7da9aff7c6a49e87be5596dc7a7d2d2c1059762136dc191'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
