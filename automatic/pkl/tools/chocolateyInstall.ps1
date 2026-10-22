$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/apple/pkl/releases/download/0.32.2/pkl-windows-amd64.exe'
  checksum64     = 'ac3c55c2e43c20964dc5faf51e47bf73a90150dfe1874aa37753651753edf201'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'pkl.exe'
}

Get-ChocolateyWebFile @packageArgs
