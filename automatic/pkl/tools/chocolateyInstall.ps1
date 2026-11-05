$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/apple/pkl/releases/download/0.33.0/pkl-windows-amd64.exe'
  checksum64     = '9875af0d17d3535ed0e3903f3ae71fc8007268949328f73c2d12942fca11840c'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'pkl.exe'
}

Get-ChocolateyWebFile @packageArgs
