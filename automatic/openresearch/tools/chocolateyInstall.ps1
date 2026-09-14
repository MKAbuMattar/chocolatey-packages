$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/alphaXiv/OpenResearch/releases/download/v0.2.1/openresearch-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = 'f4303b0a118c3ec2a90b1c72cb5431750220416dad09a830fd2216e903cf6d0d'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
