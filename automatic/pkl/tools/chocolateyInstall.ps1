$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/apple/pkl/releases/download/0.32.1/pkl-windows-amd64.exe'
  checksum64     = '8550a00fcf027335e42c5e2cd553b88e98845408cb1880b3e3d1860caf46d22a'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'pkl.exe'
}

Get-ChocolateyWebFile @packageArgs
