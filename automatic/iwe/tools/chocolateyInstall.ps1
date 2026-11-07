$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/iwe-org/iwe/releases/download/iwe-v0.32.0/iwe-v0.32.0-x86_64-pc-windows-msvc.zip'
  checksum64     = '59462a3930152275fe3970b49da90d12e7d727fa42895bf44ac3b39a86d985ac'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
