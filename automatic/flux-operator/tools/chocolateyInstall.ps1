$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/controlplaneio-fluxcd/flux-operator/releases/download/v0.58.0/flux-operator_0.58.0_windows_amd64.zip'
  checksum64     = '3207ca2a9b521608bd6f7f9b62a7be170cadef24da183c55784afa7e1a8411d6'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
