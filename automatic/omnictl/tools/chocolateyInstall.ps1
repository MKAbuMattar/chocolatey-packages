$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/siderolabs/omni/releases/download/v1.10.6/omnictl-windows-amd64.exe'
  checksum64     = '64b42e327fa52c0537f9d8269751773095c86081a9e0473ab18e821fa01cad64'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'omnictl.exe'
}

Get-ChocolateyWebFile @packageArgs
