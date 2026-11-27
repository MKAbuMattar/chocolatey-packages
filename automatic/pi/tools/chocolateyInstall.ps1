$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/earendil-works/pi/releases/download/v1.7.0/pi-windows-x64.zip'
  checksum64     = 'e98bb945fb7f6917a4bea1956759ce9faf07cf6bdd8c42bfef521eccf2276a17'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
