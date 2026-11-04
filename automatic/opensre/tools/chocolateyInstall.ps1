$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Tracer-Cloud/opensre/releases/download/v0.1.2026.11.4/opensre_0.1.2026.11.4_windows-x64.zip'
  checksum64     = '5656960f64d238d22cd1b324d5e1519dcae0f31ca0c9b2cb75b2d0f592c82a3f'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
