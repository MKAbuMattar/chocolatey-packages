$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/joelhooks/pdf-brain/releases/download/v2.0.0/pdf-brain-windows-x64.exe'
  checksum64     = '880758ebe2cb078a903d2c7d406770ee5ce1b5fdadd3727e4d5396afce2b2e26'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'pdf-brain.exe'
}

Get-ChocolateyWebFile @packageArgs
