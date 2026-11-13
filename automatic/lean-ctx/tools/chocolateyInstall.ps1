$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/yvgude/lean-ctx/releases/download/v3.12.4/lean-ctx-x86_64-pc-windows-msvc.zip'
  checksum64     = 'bcf707cc4fcae3a648e8404d123677894d07d1abc3f33e18ae006b162dd0a09b'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
