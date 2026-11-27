$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.11.27/opensre_0.1.2026.11.27_windows-x64.zip'
  checksum64     = '582c2f1e8a92fa7124728c7b8c206a2e72f0cea776fbc0b64bb73860279c5d07'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
