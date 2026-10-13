$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.10.13/opensre_0.1.2026.10.13_windows-x64.zip'
  checksum64     = '5774c219d0cb6155953d43063cb4fa8ce9bc10084fc786fcf28f2f3201b63d49'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
