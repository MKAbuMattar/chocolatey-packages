$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.58.2/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = '23d8ce7db9ea5091616f2a51b6e7cbb956287b7c31ce9f08918d6e6876e3bbfc'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
