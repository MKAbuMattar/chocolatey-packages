$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/yoanbernabeu/grepai/releases/download/v0.37.0/grepai_0.37.0_windows_amd64.zip'
  checksum64     = '5bf4c93ce978bd7b3de052bceb3861ca996e93912ef8d8d00feeb5f3adac5b21'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
