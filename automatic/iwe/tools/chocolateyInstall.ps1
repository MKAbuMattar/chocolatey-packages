$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/iwe-org/iwe/releases/download/iwe-v0.26.1/iwe-v0.26.1-x86_64-pc-windows-msvc.zip'
  checksum64     = 'dc51b3323ec80f1622d06208f4b0e05f56ab3a59506001ba769e312053e83656'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
