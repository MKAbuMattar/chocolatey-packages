$ErrorActionPreference = 'Stop'

$toolsPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/prefix-dev/pixi/releases/download/v0.76.2/pixi-x86_64-pc-windows-msvc.exe'
  checksum64     = 'd296e346a67ede274643a78c69a8e1068778fcc4213ab98dcc308dd4442f2e4a'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'pixi.exe'
}

Get-ChocolateyWebFile @packageArgs
