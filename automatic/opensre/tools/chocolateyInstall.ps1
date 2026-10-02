$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.10.2/opensre_0.1.2026.10.2_windows-x64.zip'
  checksum64     = 'e84fc19a7c16e697465ed9c3c477709936a4a0ac65de10a8365e7cd1e5591369'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
