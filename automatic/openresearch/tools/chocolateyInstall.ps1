$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/alphaXiv/OpenResearch/releases/download/v0.2.16/openresearch-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = '4837fdde12afbdfae01bf2c82d055bf37c0a05aa162d2f1f49de07765e83d4ad'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
