$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.55.3/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = '8fd77caf7b6e28989073f013d080ffa6bfb9dcc67bd1513e1477f717a6ee2f30'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
