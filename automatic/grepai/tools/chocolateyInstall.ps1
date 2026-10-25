$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/yoanbernabeu/grepai/releases/download/v0.39.0/grepai_0.39.0_windows_amd64.zip'
  checksum64     = 'ac572e0ba6ec80c404f31c9880e1ba7f4974320628fa2f951fe8545a31198bba'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
