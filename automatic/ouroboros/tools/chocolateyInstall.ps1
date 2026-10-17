$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.58.1/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = 'fa6028cdfef0ef124d6fd0d3f6756f81e54f81c2a2793100a16ff87f6517e929'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
