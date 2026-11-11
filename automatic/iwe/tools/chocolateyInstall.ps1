$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/iwe-org/iwe/releases/download/iwe-v0.33.0/iwe-v0.33.0-x86_64-pc-windows-msvc.zip'
  checksum64     = 'dfacb9347ab66dc18cd4534ba66573745509b25493fb709e4a34a3667b027353'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
