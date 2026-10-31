$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/cdxgen/cdxgen/releases/download/v13.6.0/cdxgen-windows-amd64.exe'
  checksum64     = '71c49545872f881b7c27655329d6e381e8a5837caddcdb017e3a09161d21dcfd'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'cdxgen.exe'
}

Get-ChocolateyWebFile @packageArgs
