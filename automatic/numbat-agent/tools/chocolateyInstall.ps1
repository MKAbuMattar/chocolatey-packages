$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/perplexityai/numbat/releases/download/v0.2.0/numbat_0.2.0_windows_amd64.zip'
  checksum64     = '71a62680248a8c03596e1cc52626a042fd46374215af7b76c9e05059ba3fce31'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
