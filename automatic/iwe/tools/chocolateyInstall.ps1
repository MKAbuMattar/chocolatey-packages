$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/iwe-org/iwe/releases/download/iwe-v0.23.2/iwe-v0.23.2-x86_64-pc-windows-msvc.zip'
  checksum64     = '53964c98f74e1b26a880a40a9a5b523f4d6314f4f13328e630530cfc439fed03'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
