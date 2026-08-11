$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/siderolabs/omni/releases/download/v1.10.0/omnictl-windows-amd64.exe'
  checksum64     = '1fefb0a37ca75648374797d4e92d9f45f08bb49d21b6b0ee9702da352108e35c'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'omnictl.exe'
}

Get-ChocolateyWebFile @packageArgs
