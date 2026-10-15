$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/alphaXiv/OpenResearch/releases/download/v0.2.19/openresearch-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = '6e4b8f538349014d1f2c4ab5a1a41ea46acac21c3062946d18091dbec684e675'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
