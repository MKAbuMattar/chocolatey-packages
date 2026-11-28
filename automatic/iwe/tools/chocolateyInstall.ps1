$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/iwe-org/iwe/releases/download/iwe-v0.36.0/iwe-v0.36.0-x86_64-pc-windows-msvc.zip'
  checksum64     = '9dcd15bd6bac87aa2896881ec44bc60d2ef84692681c7b8fccdbcc0323cf218f'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
