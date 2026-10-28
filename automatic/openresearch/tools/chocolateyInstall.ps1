$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/alphaXiv/OpenResearch/releases/download/v0.2.22/openresearch-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = '03219a46160fa22580f5e5adda942ac899aa82a9014eb7f4aa95c4adaed52a7d'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
