$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/prometheus/alertmanager/releases/download/v0.33.1/alertmanager-0.33.1.windows-amd64.zip'
  checksum64     = 'b94f1a981ed8e8a07a6e9be015466e9cd8d180ad8659dfeeed16617248f90b93'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
