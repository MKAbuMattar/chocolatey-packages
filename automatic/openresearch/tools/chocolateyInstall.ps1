$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/alphaXiv/OpenResearch/releases/download/v0.2.24/openresearch-cli-x86_64-pc-windows-msvc.zip'
  checksum64     = 'd2bdd20600ff4f628b0b722a09aaa4f6fc86d5a3913753de7c097415c981dbe9'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
