$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/microsoft/apm/releases/download/v0.28.0/apm-windows-x86_64.zip'
  checksum64     = 'b7085454956a8fa60aa61c062c566095bffe6bc1d6c0902f3a6657b1d1d7fc85'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
