$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.11.15/opensre_0.1.2026.11.15_windows-x64.zip'
  checksum64     = '7fde629cd5d7421f211168f7bd11b3cecb89acb37a35c63005570efd7e86281e'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
