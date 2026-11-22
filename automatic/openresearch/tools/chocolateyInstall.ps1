$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/alphaXiv/OpenResearch/releases/download/v0.2.30/openresearch-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = 'd0bf44b7044eb6bc1ddb332e9074e5670e75192c6103629b389c8555083756f2'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
