$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.56.1/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = 'bea496233ae25509c1f37c2b3c27b15a5c86f732a0ae9f23f45c8253c1f96a66'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
