$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/pbakaus/impeccable/releases/download/engine-v0.1.14/impeccable-windows-x64.exe'
  checksum64     = '38e09451694973ba664a24e67e1502a6913e6d0e533a0a5ae1e04c5963a804b1'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'impeccable.exe'
}

Get-ChocolateyWebFile @packageArgs
