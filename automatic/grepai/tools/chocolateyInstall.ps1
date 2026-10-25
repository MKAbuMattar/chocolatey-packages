$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/yoanbernabeu/grepai/releases/download/v1.0.0/grepai_1.0.0_windows_amd64.zip'
  checksum64     = 'c6b709be43420e1446e02fbd3edaed888a5b942cdd6a38e4ec56e421b4bc8d8a'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
