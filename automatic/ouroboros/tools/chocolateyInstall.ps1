$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.54.4/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = '9504d1d9b6242bded01d4d42301c48bb71e540c99aa21ed389e2be031677cb43'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
