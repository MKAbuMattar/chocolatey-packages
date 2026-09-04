$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/oblien/openship/releases/download/v0.7.1/Openship-win32-x64.zip'
  checksum64     = 'e80ce9cd5f9b052715b558795a4354c38d7639bfb542edce41998f6ee01e10b4'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
