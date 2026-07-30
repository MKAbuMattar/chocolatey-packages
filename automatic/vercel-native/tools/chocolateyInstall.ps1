$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/vercel-labs/native/releases/download/v0.6.3/native-sdk-win32-x64.exe'
  checksum64     = 'b84e6a311404b8a673c966b4aec7537d883a2e8680ceabd1a0bf4b42670193b2'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'native.exe'
}

Get-ChocolateyWebFile @packageArgs
