$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/iwe-org/iwe/releases/download/iwe-v0.24.2/iwe-v0.24.2-x86_64-pc-windows-msvc.zip'
  checksum64     = 'a1ddeab60f40fd3323849aee95c11ca9b8aeeebce3a601a62ca1ddcc06bc1a08'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
