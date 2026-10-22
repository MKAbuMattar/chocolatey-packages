$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.10.22/opensre_0.1.2026.10.22_windows-x64.zip'
  checksum64     = 'e88c60260ea34e047a2ddba6e65f79168e5ac0cfd685e0f7c26a4cd71f59a913'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
