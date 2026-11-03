$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/r14dd/patent/releases/download/v0.14.3/patent-x86_64-pc-windows-msvc.zip'
  checksum64     = '0ea4349947afa21e880f997e9716f60e5895b3bd24bd5d1e0e2a0688bd9a2659'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
