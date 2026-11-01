$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/usememos/memos/releases/download/26.11.0/memos_26.11.0_windows_amd64.zip'
  checksum64     = '3b5f7b92e11dc38b39a70e68ba4e734de870e5e098ea5a43f2c6b2817e1cbcc0'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
