$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/microsoft/winappCli/releases/download/v0.5.0/winappcli-x64.zip'
  checksum64     = '88735ce6c2582ac5fac6200194bf62467fdd72b44b2d230f3a4ed059fa79ee7d'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
