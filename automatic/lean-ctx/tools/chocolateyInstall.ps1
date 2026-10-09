$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/yvgude/lean-ctx/releases/download/v3.11.2/lean-ctx-x86_64-pc-windows-msvc.zip'
  checksum64     = '37514f8de88b3f91e04734fc6a907f9ad3d3836287606e2a5f48281df70fc1c0'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
