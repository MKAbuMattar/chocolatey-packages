$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/0xJacky/nginx-ui/releases/download/v2.7.0/nginx-ui-windows-64.zip'
  checksum64     = 'e5f527579a8c7ec75bfd635343f81c66412711bf04a0f496e43fc93c0edf5943'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
