$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.63.0/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = '949208ccfebd0cf4b5d99be08a654eaf4a08933e7041ec245dac299f370502eb'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
