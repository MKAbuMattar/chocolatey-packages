$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/yoanbernabeu/grepai/releases/download/v1.2.0/grepai_1.2.0_windows_amd64.zip'
  checksum64     = 'e190fb8d46dc3ea1cb15fd4cfb5efddc7fce21db0c2d9f8ab5c79ce65d8c8127'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
