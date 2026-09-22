$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.9.22/opensre_0.1.2026.9.22_windows-x64.zip'
  checksum64     = 'cd68d6cd31928db352aceb6d91f33d487e925ef24dfa4da8456cf03e7b23b9a8'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
