$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/JustVugg/colibri/releases/download/v1.11.0/colibri-v1.11.0-windows-x86_64.zip'
  checksum64     = 'c4bcfe75c4b1afbe325d16586f13651a0625027419767acca86066192961562f'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
