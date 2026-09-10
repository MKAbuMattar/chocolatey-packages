$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/r14dd/patent/releases/download/v0.14.0/patent-x86_64-pc-windows-msvc.zip'
  checksum64     = '5b337ea72d036ad043016a8c7b162ade5e25b4a123f4eb65e466ffa86dfddfae'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
