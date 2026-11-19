$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/n0-computer/iroh/releases/download/v1.5.0/iroh-relay-v1.5.0-x86_64-pc-windows-msvc.zip'
  checksum64     = 'cf42e04ab9931c693c88114ab5765216f562f6a07b28ead11df5ef0cada28503'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
