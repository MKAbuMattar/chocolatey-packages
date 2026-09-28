$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/terralist/terralist/releases/download/v0.10.10/terralist_windows_amd64.zip'
  checksum64     = '2c54f6657efa20307aba008e792f6cf5a41e1c322450ef0a369f8b2f2b511952'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
