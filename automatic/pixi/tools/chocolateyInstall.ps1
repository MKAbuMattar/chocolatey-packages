$ErrorActionPreference = 'Stop'

$toolsPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/prefix-dev/pixi/releases/download/v0.76.0/pixi-x86_64-pc-windows-msvc.exe'
  checksum64     = 'a0a6dfd6f6394906319ea616b81504dc7e8bd7296d53320f0ae7ab30defd2d40'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'pixi.exe'
}

Get-ChocolateyWebFile @packageArgs
