$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/charmbracelet/crush/releases/download/v0.98.0/crush_0.98.0_Windows_x86_64.zip'
  checksum64     = '00a00735225c198dda6e63c1dbccb5143e92c808c0e3412db42e468b67dc2bc9'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
