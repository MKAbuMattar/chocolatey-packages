$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.61.0/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = 'cd6bc039f2b27b7a3e9d79d2a6a2dffe412e638637fadb1c9e2b2a9499c89615'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
