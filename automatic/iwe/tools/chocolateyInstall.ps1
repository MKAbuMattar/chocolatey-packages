$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/iwe-org/iwe/releases/download/iwe-v0.24.1/iwe-v0.24.1-x86_64-pc-windows-msvc.zip'
  checksum64     = '12534ad9206b05d322e397ff1f6cd581ff4c4f9f08bb7d9471bb4eba6a670ece'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
