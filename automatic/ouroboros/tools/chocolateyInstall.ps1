$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.59.0/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = 'f3fcb98beeacfbc9337fffc9c2d4665b09286aa7aa6bed231f80383add7bf652'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
