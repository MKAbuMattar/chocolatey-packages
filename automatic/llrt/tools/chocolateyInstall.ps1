$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/awslabs/llrt/releases/download/v0.8.1-beta/llrt-windows-x64.zip'
  checksum64     = '28108946ce8c0d849d2ad7d9a25921aacfe33de0cde144c7954ebbc39b50b6ee'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
