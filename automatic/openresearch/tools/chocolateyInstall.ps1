$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/alphaXiv/OpenResearch/releases/download/v0.2.27/openresearch-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = 'e1ccafb4fa99aae14f29ec380923fea57d7280111ea01b0e2e4c33ff74469bd0'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
