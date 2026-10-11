$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.10.11/opensre_0.1.2026.10.11_windows-x64.zip'
  checksum64     = '5d203d4908c9c55f093cd7a7e8d239e5d0a06364d4113b47c0c5b13e828f821e'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
