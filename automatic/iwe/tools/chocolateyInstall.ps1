$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/iwe-org/iwe/releases/download/iwe-v0.26.0/iwe-v0.26.0-x86_64-pc-windows-msvc.zip'
  checksum64     = '862338486528db7a866aa3d368da1b8938e30d8c85ff0be06ccbc2e39466bd07'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
