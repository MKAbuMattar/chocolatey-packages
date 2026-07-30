$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/bensadeh/tailspin/releases/download/7.0.0/tailspin-x86_64-pc-windows-msvc.zip'
  checksum64     = '69f6301c93288a17806a7ddbf46bb0f33f400bc4059bf12bb7b94d38b2aa9bd9'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
