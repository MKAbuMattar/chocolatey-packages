$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/vercel-labs/native/releases/download/v0.11.0/native-sdk-win32-x64.exe'
  checksum64     = 'ce86c05d797bd479be9facc80422f2fdb427dd9998eba717fbf11856b90ed891'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'native.exe'
}

Get-ChocolateyWebFile @packageArgs
