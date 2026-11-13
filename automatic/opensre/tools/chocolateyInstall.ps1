$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.11.13/opensre_0.1.2026.11.13_windows-x64.zip'
  checksum64     = '88aa3363c0fa81a39db26cb060f28618bfe4fa44bd94658cf7e5d844e325dd6f'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
