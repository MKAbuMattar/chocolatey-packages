$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/pbakaus/impeccable/releases/download/engine-v0.1.28/impeccable-windows-x64.exe'
  checksum64     = '2fd0b53e8d9554f3f028a258fd958d39bd712b3eb4f1725363966ca2380f8c3e'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'impeccable.exe'
}

Get-ChocolateyWebFile @packageArgs
