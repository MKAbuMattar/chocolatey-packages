$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.9.6/opensre_0.1.2026.9.6_windows-x64.zip'
  checksum64     = '5201f41f2624ab9564bd23ef0e5b09425cbe28d97fdb42e3b5ae5c3a09ee89f9'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
