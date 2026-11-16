$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/usememos/memos/releases/download/26.11.1/memos_26.11.1_windows_amd64.zip'
  checksum64     = 'b8aee773308cfe33642ee71a2f56ae58bdb169d7928b9d6e666a107335fb1d10'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
