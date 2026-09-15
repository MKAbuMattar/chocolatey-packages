$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/jub0t/Concat/releases/download/v0.2.2/Concat-0.2.2-windows-x86_64.zip'
  checksum64     = 'ed86613beee7131eceeb6bb025553c5323ba5ba8e983193a37e8dc9a3e45f868'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
