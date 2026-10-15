$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.56.0/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = '8f93d85e90d93d0560cd7be35f0db900b3504568a121600de2c02a06c87f75d4'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
