$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/rtk-ai/rtk/releases/download/v1.2.1/rtk-x86_64-pc-windows-msvc.zip'
  checksum64     = '08671cb746e779c50dc530eec0114a7cd6cbbd1ea4f66c98dd9f0572f5f96c43'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
