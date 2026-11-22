$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.11.22/opensre_0.1.2026.11.22_windows-x64.zip'
  checksum64     = 'cd199f7e1b57b237e26ad46edfa05173ec7ac3285b9e3e587c2d74b7682b4826'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
