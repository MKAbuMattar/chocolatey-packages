$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/alphaXiv/OpenResearch/releases/download/v0.2.8/openresearch-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = 'a735ad5f0715012bb190a349038f8e2acc8f521e7035e9f64215a79541836dc0'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
