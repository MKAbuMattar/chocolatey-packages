$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/cdxgen/cdxgen/releases/download/v13.5.0/cdxgen-windows-amd64.exe'
  checksum64     = '41af8c242026e62591f4c969c2c951bbad7f2084aec97c3577129b45f5abfad4'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'cdxgen.exe'
}

Get-ChocolateyWebFile @packageArgs
