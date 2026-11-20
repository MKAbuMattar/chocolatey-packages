$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.62.0/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = 'b99664c9929fb2134895883e3a74b2abf1970cd35d1de52c75cf76336df4505e'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
