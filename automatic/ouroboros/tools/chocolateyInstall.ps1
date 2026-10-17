$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.58.0/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = 'a26bf69340e946befaa64d589b623d67ce686e0c24f3b53b3ac08719ccbd2835'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
