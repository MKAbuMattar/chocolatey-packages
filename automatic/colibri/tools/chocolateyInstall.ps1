$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/JustVugg/colibri/releases/download/v1.10.1/colibri-v1.10.1-windows-x86_64.zip'
  checksum64     = '111a511e5c76de63ca504ba7bec36d85d9dd9b8b93cbaa47775af07f77209b4d'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
