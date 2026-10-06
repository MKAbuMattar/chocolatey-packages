$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.55.6/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = '6336d269bfb93b9b14630b8945da3e6ee0867b362f8466d32d2cafbbd6537fb2'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
