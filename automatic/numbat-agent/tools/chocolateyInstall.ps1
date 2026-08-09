$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/perplexityai/numbat/releases/download/v0.1.2/numbat_0.1.2_windows_amd64.zip'
  checksum64     = '175f5e69b7eb316c81a07380802e72e2ddb246e0628caa7bf24c5dfef9200668'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
