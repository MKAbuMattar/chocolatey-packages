$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/prometheus/alertmanager/releases/download/v0.34.1/alertmanager-0.34.1.windows-amd64.zip'
  checksum64     = '69624d6ce3674dbcf8cefc5a93d7028d00bbd5e0196a8384907f51593a495fef'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
