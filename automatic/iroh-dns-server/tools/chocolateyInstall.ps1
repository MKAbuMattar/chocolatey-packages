$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/n0-computer/iroh/releases/download/v1.4.2/iroh-dns-server-v1.4.2-x86_64-pc-windows-msvc.zip'
  checksum64     = 'd02a0bd8d3dfdacbe8409528e602ce217e2d5ec01caa693a5e84c4bde0efc8e8'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
