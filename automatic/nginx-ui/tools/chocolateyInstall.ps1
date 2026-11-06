$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/0xJacky/nginx-ui/releases/download/v3.0.0/nginx-ui-windows-64.zip'
  checksum64     = '6d89e7ae40f641c9fe9e1868c3d504d12d04422778fe3fc65078d653156d7589'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
