$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/iwe-org/iwe/releases/download/iwe-v0.35.1/iwe-v0.35.1-x86_64-pc-windows-msvc.zip'
  checksum64     = '9c20fa3e01237fb43d08473055f2a5827c873e4822008d874e4b164a4a519f76'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
