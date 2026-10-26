$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/yoanbernabeu/grepai/releases/download/v1.1.0/grepai_1.1.0_windows_amd64.zip'
  checksum64     = '6f7496e7f33558afa11fd8c1eb096a31c588c8e02a5294e8b93eaf8d951e568f'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
