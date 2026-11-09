$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/prometheus/alertmanager/releases/download/v0.35.0/alertmanager-0.35.0.windows-amd64.zip'
  checksum64     = 'cdf8cd664889bf3f27771881e10814f3d5916310aba90717b4424deb358b0fa3'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
