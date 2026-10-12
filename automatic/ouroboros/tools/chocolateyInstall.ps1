$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.55.7/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = '8e5786154e2c1867fba4d8c0cff8e3d1cb894e6a3a2da0f7c01273277ff1f5ab'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
