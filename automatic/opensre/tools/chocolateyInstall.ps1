$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.11.8/opensre_0.1.2026.11.8_windows-x64.zip'
  checksum64     = 'b72fc155a3b02d3bb2243c3e00b2eb56a5be4a12ddc515d75314065d71e0fbe1'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
