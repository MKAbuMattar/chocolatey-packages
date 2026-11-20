$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/iwe-org/iwe/releases/download/iwe-v0.34.0/iwe-v0.34.0-x86_64-pc-windows-msvc.zip'
  checksum64     = '1bf7403748cf9d82b51b8957a953330efe6bdf52dec904f1b38469a8dc295f45'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
