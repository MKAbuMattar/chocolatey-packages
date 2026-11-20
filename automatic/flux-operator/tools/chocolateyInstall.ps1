$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/controlplaneio-fluxcd/flux-operator/releases/download/v0.63.0/flux-operator_0.63.0_windows_amd64.zip'
  checksum64     = '718b83c28183fc07051280e6814a298f46b10e78cdba8679eb42dda3d5997133'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
