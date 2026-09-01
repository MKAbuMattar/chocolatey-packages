$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/vercel-labs/native/releases/download/v0.10.1/native-sdk-win32-x64.exe'
  checksum64     = 'd493db3edab4e1a405484c34881a63f70864c9ac7ff71ad026ab36ff99a6fd30'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'native.exe'
}

Get-ChocolateyWebFile @packageArgs
