$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.9.15/opensre_0.1.2026.9.15_windows-x64.zip'
  checksum64     = 'd50b2ded1d86123fb7eac5c406f129ba6723b0e7cb17b51f6b0804a6757e69dd'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
