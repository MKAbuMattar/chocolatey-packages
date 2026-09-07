$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/microsoft/apm/releases/download/v0.30.0/apm-windows-x86_64.zip'
  checksum64     = '54ca29eb9db47779ec4b421d47570567d5b48ce1e52ab9809e84a9db86be8828'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
