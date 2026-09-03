$ErrorActionPreference = 'Stop'

$toolsPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/prefix-dev/pixi/releases/download/v0.79.0/pixi-x86_64-pc-windows-msvc.exe'
  checksum64     = 'a7e4dc75344bf0e07b7a1645b9930b8c120b2e12cd2ac71e1f7eac3da5aedda9'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'pixi.exe'
}

Get-ChocolateyWebFile @packageArgs
