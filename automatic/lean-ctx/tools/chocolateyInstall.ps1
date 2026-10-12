$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/yvgude/lean-ctx/releases/download/v3.11.4/lean-ctx-x86_64-pc-windows-msvc.zip'
  checksum64     = '306cd503af93572ab8d1b27f7d4a851e54a2336897b1db98f46aa479b8d554f7'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
