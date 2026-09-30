$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/siderolabs/omni/releases/download/v1.12.3/omnictl-windows-amd64.exe'
  checksum64     = 'b8f46279efd23a46647a1b273bc85000e41f05612480d7a08b5868ccbf20c81a'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'omnictl.exe'
}

Get-ChocolateyWebFile @packageArgs
