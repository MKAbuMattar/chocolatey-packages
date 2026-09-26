$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.9.26/opensre_0.1.2026.9.26_windows-x64.zip'
  checksum64     = '7b7a341dcf68d82b098d1816ec14156eb5f3386883a1fe8bedea0135fb6b2ac5'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
