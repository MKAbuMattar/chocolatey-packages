$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.11.20/opensre_0.1.2026.11.20_windows-x64.zip'
  checksum64     = 'b3a45f7008ebdb1c40101856021f262992c5c8ef0cd73180197ea2ef37f09d98'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
