$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/controlplaneio-fluxcd/flux-operator/releases/download/v0.60.0/flux-operator_0.60.0_windows_amd64.zip'
  checksum64     = '7a48e7affaed049c367563bb61a09ea117588a5e1b669ea2067338c9ea2a3373'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
