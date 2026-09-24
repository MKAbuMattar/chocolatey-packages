$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/microsoft/winappCli/releases/download/v0.7.0/winappcli-x64.zip'
  checksum64     = '236e35173f85a88a62cb030bdc07db6590fb7790514d530a050482a0da80313b'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
