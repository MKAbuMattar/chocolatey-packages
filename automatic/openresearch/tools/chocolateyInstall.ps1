$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/alphaXiv/OpenResearch/releases/download/v0.2.7/openresearch-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = 'fb0a40ec5830a165ef10519236b84226fba4372378f62c626ddb4bd5efcfd669'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
