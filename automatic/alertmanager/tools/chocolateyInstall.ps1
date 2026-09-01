$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/prometheus/alertmanager/releases/download/v0.34.0/alertmanager-0.34.0.windows-amd64.zip'
  checksum64     = '0e4b832325d6d9b737b3255a242da7b11cb7a641d7f81f7e2aabe34b3207cd79'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
