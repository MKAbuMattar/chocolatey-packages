$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.11.12/opensre_0.1.2026.11.12_windows-x64.zip'
  checksum64     = 'bec6f3c5adb165f3c997b6690c4f06cd17d2ec48d21931e2db4274a8cd14cd86'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
