$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/usememos/memos/releases/download/26.10.0/memos_26.10.0_windows_amd64.zip'
  checksum64     = 'aecb35ffdbf154a423fbd533777fa62a94dad899e50d37210abe0968c164976d'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
