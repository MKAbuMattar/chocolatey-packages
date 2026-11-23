$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/yvgude/lean-ctx/releases/download/v3.12.7/lean-ctx-x86_64-pc-windows-msvc.zip'
  checksum64     = '461ff6b3bcb370966eda2586eae9399293e74400e5a8b055911b9f20ea45b0a7'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
