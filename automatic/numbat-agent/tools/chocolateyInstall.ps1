$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/perplexityai/numbat/releases/download/v0.3.0/numbat_0.3.0_windows_amd64.zip'
  checksum64     = 'a0880db223f78b0822dadad395c2e451cc7ed3bd32898ea5aaab243e7a092675'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
