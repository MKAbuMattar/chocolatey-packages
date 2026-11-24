$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/oblien/openship/releases/download/v1.0.2/Openship-win32-x64.zip'
  checksum64     = '603fcea06b1ee2abd13404f2818f8eebaa4f8e4bbd5fef6e445ba44a6d9b9ec2'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
