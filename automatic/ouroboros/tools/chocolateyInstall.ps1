$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.59.3/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = 'a30716f143000de8ea139a506b73a3c08131fd2418a6c5f965bd6ece7730f3ea'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
