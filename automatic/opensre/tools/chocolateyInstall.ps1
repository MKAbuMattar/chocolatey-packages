$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.10.29/opensre_0.1.2026.10.29_windows-x64.zip'
  checksum64     = 'df5dc699cb4ee1edfe280e4f2be358c090b95e0e465f1c1aa0ebe4988ac0acf5'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
