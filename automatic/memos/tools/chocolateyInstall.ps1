$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/usememos/memos/releases/download/26.11.3/memos_26.11.3_windows_amd64.zip'
  checksum64     = 'e888cedcaa5460f02f9c5c829ca39a7fdac38459a487360f0c0293bdd64150b1'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
