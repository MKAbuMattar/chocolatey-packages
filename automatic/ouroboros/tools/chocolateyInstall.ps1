$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.65.6/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = '5dded03923a382082ea4e99227a1fadaa1c0f04f6aab3c0271febf624c1cb1a0'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
