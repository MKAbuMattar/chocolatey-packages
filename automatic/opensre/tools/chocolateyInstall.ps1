$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.9.16/opensre_0.1.2026.9.16_windows-x64.zip'
  checksum64     = '95aa1b5a86e1ab0ecb980328001b76b952f0930c2b748ece9dda381500495c52'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
