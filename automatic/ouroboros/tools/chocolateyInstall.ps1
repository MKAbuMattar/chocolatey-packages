$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.59.5/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = 'e5e5eeeb656e479785b5a84baa0d4174dd877aac7e981ef82137ca6255e5c99e'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
