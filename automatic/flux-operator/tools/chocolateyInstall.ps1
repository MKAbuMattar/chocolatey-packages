$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/controlplaneio-fluxcd/flux-operator/releases/download/v0.61.0/flux-operator_0.61.0_windows_amd64.zip'
  checksum64     = 'b4f071ff1f1dcab77d138164077e6901b7215a41438106dcbe4677f8487fbc07'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
