$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.9.29.1/opensre_0.1.2026.9.29.1_windows-x64.zip'
  checksum64     = '9970d51aa5fec70c6fcebab049e8e6b68a142a5f1925f72e191329e3815f9366'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
