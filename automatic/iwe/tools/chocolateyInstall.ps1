$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/iwe-org/iwe/releases/download/iwe-v0.25.0/iwe-v0.25.0-x86_64-pc-windows-msvc.zip'
  checksum64     = '8b18a967b84196bc996196df51339436bca3bcb208d14a92b708ae4de131d580'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
