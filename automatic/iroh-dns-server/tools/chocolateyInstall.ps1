$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/n0-computer/iroh/releases/download/v1.3.0/iroh-dns-server-v1.3.0-x86_64-pc-windows-msvc.zip'
  checksum64     = '4d9412231c071057f38a09799b2647bced2aa928deb846550ea6e2f7ce537e74'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
