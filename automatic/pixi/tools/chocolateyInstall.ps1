$ErrorActionPreference = 'Stop'

$toolsPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/prefix-dev/pixi/releases/download/v0.75.0/pixi-x86_64-pc-windows-msvc.exe'
  checksum64     = '63ec8945eed67b74ead220d1ece1167ac39166ef4f804ee46c37daf7105ec232'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'pixi.exe'
}

Get-ChocolateyWebFile @packageArgs
