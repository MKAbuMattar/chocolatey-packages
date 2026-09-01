$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/yoanbernabeu/grepai/releases/download/v0.36.1/grepai_0.36.1_windows_amd64.zip'
  checksum64     = '7019af538b33a87985d9f07f89198f46072f874e4f751385d5bef9061addd0fe'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
