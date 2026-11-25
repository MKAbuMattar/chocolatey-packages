$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/prometheus/alertmanager/releases/download/v0.35.1/alertmanager-0.35.1.windows-amd64.zip'
  checksum64     = '89deab50f465f3d7eb79f392d87493ac1972c6ffdefe617c0699458af933cfcf'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
