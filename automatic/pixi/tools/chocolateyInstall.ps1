$ErrorActionPreference = 'Stop'

$toolsPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/prefix-dev/pixi/releases/download/v0.77.0/pixi-x86_64-pc-windows-msvc.exe'
  checksum64     = 'f7a879f9de570bc4de1b2a4748f00127bf173d72c2021e8d9b3ff3a182d63baa'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'pixi.exe'
}

Get-ChocolateyWebFile @packageArgs
