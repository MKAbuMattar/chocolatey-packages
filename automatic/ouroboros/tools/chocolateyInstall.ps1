$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.61.1/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = '0e4d3fe598840b92500437484188b64820084739f9937512e5133dbe12bc7fd7'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
