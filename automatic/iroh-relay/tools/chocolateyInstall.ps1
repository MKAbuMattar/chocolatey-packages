$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/n0-computer/iroh/releases/download/v1.4.0/iroh-relay-v1.4.0-x86_64-pc-windows-msvc.zip'
  checksum64     = '9095a525b1c23c411653d0f405e518c6d4bd674fdfc72e22aa5eace5c0e3a5e8'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
