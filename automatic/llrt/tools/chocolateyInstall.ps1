$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/awslabs/llrt/releases/download/v0.10.0-beta/llrt-windows-x64.zip'
  checksum64     = 'e8722768f63d143f26749e6d7bb4927eab3fdd8b43f9908e4f1d5388b29db1a8'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
