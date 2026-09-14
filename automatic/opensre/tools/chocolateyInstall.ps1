$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.9.14/opensre_0.1.2026.9.14_windows-x64.zip'
  checksum64     = '9cb102c96b94a363807c111ff5bc35de60071ff3fdf44f0c64bf708943a35449'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
