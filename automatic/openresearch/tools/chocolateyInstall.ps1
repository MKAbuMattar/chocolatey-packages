$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/alphaXiv/OpenResearch/releases/download/v0.2.20/openresearch-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = 'b298d7e0cafb248d7b253251e0da2e14870f049d97907c066f509f2e155509e1'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
