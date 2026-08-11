$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/h9zdev/WireTapper/releases/download/WireTapper/app-web.exe'
  checksum64     = '25cdcec77ecead95c27d15d616c0c0ee94b192abed2389bd3a6d66546fe61514'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'wiretapper.exe'
}

Get-ChocolateyWebFile @packageArgs
