$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/iwe-org/iwe/releases/download/iwe-v0.27.0/iwe-v0.27.0-x86_64-pc-windows-msvc.zip'
  checksum64     = 'ad60b9330cd4b2a9f5c90ee32ceca4816900d228b30e50bae1f8bb5fd4b3da3f'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
