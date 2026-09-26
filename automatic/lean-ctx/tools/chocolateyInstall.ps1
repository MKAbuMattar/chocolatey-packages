$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/yvgude/lean-ctx/releases/download/v3.10.4/lean-ctx-x86_64-pc-windows-msvc.zip'
  checksum64     = '11727f4ef1ee1a15806dc0b106cc30901c581640e1f0f6d2a57f2fbff368a1c2'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
