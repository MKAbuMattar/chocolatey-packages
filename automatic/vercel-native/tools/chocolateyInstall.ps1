$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/vercel-labs/native/releases/download/v0.11.1/native-sdk-win32-x64.exe'
  checksum64     = '6510ef4ed6762a723bc3f2d297985fbae5d40f0afd05f970a918c38c395974a6'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'native.exe'
}

Get-ChocolateyWebFile @packageArgs
