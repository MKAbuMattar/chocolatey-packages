$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/charmbracelet/crush/releases/download/v0.95.0/crush_0.95.0_Windows_x86_64.zip'
  checksum64     = '191cce8ac42716f88c725ad8ab6c0e5134d403fc76e5fcde6f0e536c45e284dd'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
