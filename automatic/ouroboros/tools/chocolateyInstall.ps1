$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.55.2/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = '1e3a8c3df0afe4bd281ef53335b5e06abf2ae15b4dbb78235438296177762f61'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
