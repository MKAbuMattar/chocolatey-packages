$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/apple/pkl/releases/download/0.33.1/pkl-windows-amd64.exe'
  checksum64     = 'b1da686befc4ce4d92fe81bd2892e7457a505328313380010c4791c7f68d7432'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'pkl.exe'
}

Get-ChocolateyWebFile @packageArgs
