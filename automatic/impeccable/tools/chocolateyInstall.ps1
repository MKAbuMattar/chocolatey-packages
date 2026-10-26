$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/pbakaus/impeccable/releases/download/engine-v0.1.18/impeccable-windows-x64.exe'
  checksum64     = '8f61e96b0c97001546a824d79b44f46b423b560f3eb1a0cc44a8695a1b395d9f'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'impeccable.exe'
}

Get-ChocolateyWebFile @packageArgs
