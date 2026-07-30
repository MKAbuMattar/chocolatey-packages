$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/yoanbernabeu/grepai/releases/download/v0.35.0/grepai_0.35.0_windows_amd64.zip'
  checksum64     = 'f03d23e156ba0d5121c702e9f7dda9e483ff77e1a68f6e87d7563a2679dddd71'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
