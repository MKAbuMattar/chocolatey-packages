$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.11.10/opensre_0.1.2026.11.10_windows-x64.zip'
  checksum64     = '16139ac3ac4f0b3dba2f4e7bc1a7e12de295e4636c25da3c5251e35cd1a41fcd'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
