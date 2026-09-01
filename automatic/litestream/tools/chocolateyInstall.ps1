$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/benbjohnson/litestream/releases/download/v0.5.17/litestream-0.5.17-windows-x86_64.zip'
  checksum64     = '6f5532687d71c452e0099a9087e51da65f9935664fb11549abc0a5a34cb1d34e'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
