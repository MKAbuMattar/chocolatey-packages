$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/siderolabs/omni/releases/download/v1.13.1/omnictl-windows-amd64.exe'
  checksum64     = '0a96094bb6622c5d6e669a0e2fead925116da039d4ce9d9c83603b4df1789956'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'omnictl.exe'
}

Get-ChocolateyWebFile @packageArgs
