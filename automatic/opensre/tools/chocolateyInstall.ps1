$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.9.19/opensre_0.1.2026.9.19_windows-x64.zip'
  checksum64     = '8f21ab7aa6c4ac8dd09ad7b77292049a9399fe99beb9c37ec8286162ca056271'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
