$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/mco-org/squad/releases/download/v0.7.6/squad-x86_64-pc-windows-msvc.zip'
  checksum64     = 'b07e35cb16e53340b0311a7dff5fa4192e6259451aca3479c14c581d2ab21c47'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
