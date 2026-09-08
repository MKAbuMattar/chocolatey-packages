$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.54.1/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = '8cf1a057a3a1dfeabe5a2be2e55530af1c26b461b717cde833c270ed69a70ac1'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
