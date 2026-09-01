$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/microsoft/winappCli/releases/download/v0.6.0/winappcli-x64.zip'
  checksum64     = 'f6dc42e3b4e4709c8f617003008e2cfdd9a51735e04e7170d60edda258db78a8'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
