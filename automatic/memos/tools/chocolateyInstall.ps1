$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/usememos/memos/releases/download/v0.31.0/memos_0.31.0_windows_amd64.zip'
  checksum64     = '648974a02d4ffe1e038fcdd81562e8ef64c7c38bcee920f5e7750dd07a8d7723'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
