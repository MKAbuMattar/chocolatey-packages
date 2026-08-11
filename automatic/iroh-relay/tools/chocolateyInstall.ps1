$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/n0-computer/iroh/releases/download/v1.0.3/iroh-relay-v1.0.3-x86_64-pc-windows-msvc.zip'
  checksum64     = '869dcbc194a0e70a0d32d0ea5e908b96d68018a6f1150c5bbbed8c9738151465'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
