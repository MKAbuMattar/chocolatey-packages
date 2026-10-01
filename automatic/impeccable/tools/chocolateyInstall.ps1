$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/pbakaus/impeccable/releases/download/engine-v0.1.9/impeccable-windows-x64.exe'
  checksum64     = 'cbfe0cfbf553a9e2fe65ee4fe61c9adad56fb9d3f277dc73f32a735a571e6a22'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'impeccable.exe'
}

Get-ChocolateyWebFile @packageArgs
