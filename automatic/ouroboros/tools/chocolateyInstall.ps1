$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.55.9/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = 'b9c56bfe3dc39c3c3eb0d395b90b9078f74740b92807370988be6d784a1468ae'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
