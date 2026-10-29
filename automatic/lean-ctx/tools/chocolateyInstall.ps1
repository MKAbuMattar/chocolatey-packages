$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/yvgude/lean-ctx/releases/download/v3.12.0/lean-ctx-x86_64-pc-windows-msvc.zip'
  checksum64     = 'ac41b4b3bebd34c876ee9dc36578e652f40d03cf9023514e9fcc9149d54c8888'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
