$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/0xJacky/nginx-ui/releases/download/v2.6.0/nginx-ui-windows-64.zip'
  checksum64     = '6ae62a83ca2ceb4e8ad7bc272eba34758518be00a8aec31241d4a431fda8d8b5'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
