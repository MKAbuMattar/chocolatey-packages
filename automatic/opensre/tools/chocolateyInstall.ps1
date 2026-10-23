$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.10.23/opensre_0.1.2026.10.23_windows-x64.zip'
  checksum64     = '0cdc1200aa8d3238f2d877148f39b55f1e726296e2a0df4a038707e2ac6adffc'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
