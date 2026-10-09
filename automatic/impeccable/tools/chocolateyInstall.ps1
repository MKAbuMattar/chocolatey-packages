$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/pbakaus/impeccable/releases/download/engine-v0.1.13/impeccable-windows-x64.exe'
  checksum64     = '2c0d5f5c482c70acb6ebc95b5265a9c872f35e99166324a95f093f7705d6c736'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'impeccable.exe'
}

Get-ChocolateyWebFile @packageArgs
