$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/cdxgen/cdxgen/releases/download/v13.9.0/cdxgen-windows-amd64.exe'
  checksum64     = 'b85d631d7c1eeb262dc635e582425962fca6ca42ed5559b5bdfe1e83864aa286'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'cdxgen.exe'
}

Get-ChocolateyWebFile @packageArgs
