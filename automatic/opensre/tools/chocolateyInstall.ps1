$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.10.15/opensre_0.1.2026.10.15_windows-x64.zip'
  checksum64     = '8fb47e04ec592d8e1cee2b426402769d4e96051461bbfba92b5fbd3d872b2850'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
