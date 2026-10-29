$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/prometheus/alertmanager/releases/download/v0.34.2/alertmanager-0.34.2.windows-amd64.zip'
  checksum64     = '7c322f966693f3aed7f62c643fa75de42312ab27ae4957b077c2e12ee78c153a'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
