$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/controlplaneio-fluxcd/flux-operator/releases/download/v0.62.0/flux-operator_0.62.0_windows_amd64.zip'
  checksum64     = '62a6f5b55da8848483ee30ef263865dcfbde323f176a6f07533196485ef4ad43'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
