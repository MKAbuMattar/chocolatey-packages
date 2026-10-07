$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/alphaXiv/OpenResearch/releases/download/v0.2.17/openresearch-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = '01352ff0b51cfdc0e6a52a9ad36fcecc2ee5ba04951bf5df85e5d690497cd775'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
