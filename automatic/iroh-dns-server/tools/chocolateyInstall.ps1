$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/n0-computer/iroh/releases/download/v1.4.1/iroh-dns-server-v1.4.1-x86_64-pc-windows-msvc.zip'
  checksum64     = 'e45de592dfc2aa47d5cd603c52be4dff0532d89fd62075f155ebd6c813ce5e4d'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
