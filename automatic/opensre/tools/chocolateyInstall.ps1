$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.9.12/opensre_0.1.2026.9.12_windows-x64.zip'
  checksum64     = '04b7349e1d5aa93cd474a62b3550346ffa199fe25a62388928b014c9f9b5fcbd'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
