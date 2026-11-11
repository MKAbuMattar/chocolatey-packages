$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.11.11/opensre_0.1.2026.11.11_windows-x64.zip'
  checksum64     = '3fda8cd923103bab7ae3e8004ec56825ddb8ec3296020ea8b7653a5ceaf0db73'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
