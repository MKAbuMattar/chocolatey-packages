$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.10.3/opensre_0.1.2026.10.3_windows-x64.zip'
  checksum64     = '24b2c2c799157ca29ae5559bae3577bf12a45cbb72294ff67cc03ea8fa5f134d'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
