$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.59.4/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = '5aeb18a5ba87086dca77dc46e8b80c3798a6850fc9b45bc21cbdc95abb909684'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
